as yet unclassified
routeCommand: aCommand from: aConnection
	| remote smppCommand body origSeqNumber |

	self logNotice: ('SMPPRouter routing <1p> from <2p>'
						expandMacrosWith: aCommand body class with: aConnection systemId) area: #smppRouter.

	"See if we can forward the message?"
	(filter filterCommand: aCommand from: aConnection)
		ifTrue: [^self].

	"We have a new command and need to select a route"
	remote := self selectRouteFor: aCommand from: aConnection.
	remote ifNil: [
		^self sendUnroutableFor: aCommand to: aConnection].

	"Patch the message now that we know the remote"
	origSeqNumber := aCommand header sequenceNumber.
	body := patcher patchCommand: aCommand from: aConnection to: remote.

	"Now build a command send it. This gets a new sequence number"
	smppCommand := SMPPCommand new
		body: body;
		setTimeout: 60*5;
		onCancel: [self sendUnroutableFor: aCommand to: aConnection];
		onError: [:err |
			self returnResponse: err to: aConnection with: origSeqNumber];
		onResult: [:result |
			self returnResponse: result to: aConnection with: origSeqNumber];
		onTimeout: [
			self logError: 'SMPPRouter command timed out. Ignoring' area: #smppRouter.
			 "TODO!"
		];
		yourself.
	remote scheduleCommand: smppCommand.