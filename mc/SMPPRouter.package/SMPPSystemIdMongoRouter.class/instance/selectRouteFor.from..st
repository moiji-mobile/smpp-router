as yet unclassified
selectRouteFor: aCommand from: aHandler
	| body dest route |

	body := aCommand body.
	(body class = SMPPDeliverSM or: [body class = SMPPSubmitSM]) ifFalse: [
		logger logNotice: 'unroutable command' with: {'cmd'->aCommand. 'from'->aHandler}.
		^nil].

	dest := body destinationAddress.


	"Attempt to query the DB"
	[
		route := database selectOne: SMPPMongoRoute where: [:itm | itm msisdn = dest]
	] on: Error do: [:e |
		logger logError: 'Failed Mongo query' with: { 'error'->e }.
		^nil
	].


	^route isNil
		ifTrue: [
			logger logNotice: 'Unknown dest route' with: { 'cmd' ->aCommand. 'from'->aHandler. 'dest'->dest}.
			nil]
		ifFalse: [
			| systemId |
			systemId := route systemId.
			logger logNotice: 'Selected route' with: { 'cmd'->aCommand. 'from'->aHandler.'dest'->dest.'systemId'->systemId}.
			self connectionForSystemId: systemId from: aHandler].