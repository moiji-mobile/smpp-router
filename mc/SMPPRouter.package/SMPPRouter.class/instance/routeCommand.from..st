as yet unclassified
routeCommand: aCommand from: aHandler
	| remoteRule smppCommand body origSeqNumber |

	logger logNotice: 'Routing message to system' with: {'cmd'->aCommand. 'from'->aHandler}.
	routeReqCounter increment.

	"See if we can forward the message?"
	(filter filterCommand: aCommand from: aHandler) ifTrue: [
		filterCounter increment.
		^self].

	"We have a new command and need to select a route"
	remoteRule := self selectRouteFor: aCommand from: aHandler.
	remoteRule ifNil: [
		^self sendUnroutableFor: aCommand to: aHandler].

	"Patch the message now that we know the remote"
	origSeqNumber := aCommand header sequenceNumber.
	body := self patch: aCommand from: aHandler to: remoteRule first rule: remoteRule second.

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
			timeoutCounter increment.
			logger logError: 'Command timed out. Ignoring' with: {aCommand. aHandler}.
			 "TODO!"
		];
		yourself.
	remoteRule first scheduleCommand: smppCommand.