as yet unclassified
routeCommand: aCommand from: aHandler
	| remote smppCommand body origSeqNumber |

	self logNotice: ('SMPPRouter routing <1p> from <2p>'
						expandMacrosWith: aCommand body class with: aHandler systemId) area: #smppRouter.

	"See if we can forward the message?"
	(filter filterCommand: aCommand from: aHandler)
		ifTrue: [^self].

	"We have a new command and need to select a route"
	remote := self selectRouteFor: aCommand from: aHandler.
	remote ifNil: [
		^self sendUnroutableFor: aCommand to: aHandler].

	"Patch the message now that we know the remote"
	origSeqNumber := aCommand header sequenceNumber.
	body := patcher patchCommand: aCommand from: aHandler to: remote.

	"Now build a command send it. This gets a new sequence number"
	smppCommand := SMPPCommand new
		body: body;
		setTimeout: 60*5;
		onCancel: [self sendUnroutableFor: aCommand to: aHandler];
		onError: [:err |
			self returnResponse: err to: aHandler with: origSeqNumber];
		onResult: [:result |
			self returnResponse: result to: aHandler with: origSeqNumber];
		onTimeout: [
			self logError: 'SMPPRouter command timed out. Ignoring' area: #smppRouter.
			 "TODO!"
		];
		yourself.
	remote scheduleCommand: smppCommand.