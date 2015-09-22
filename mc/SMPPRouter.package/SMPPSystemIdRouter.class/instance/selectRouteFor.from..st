as yet unclassified
selectRouteFor: aCommand from: aHandler
	| route |
	route := self findRouteFor: aCommand from: aHandler.
	route ifNil: [
		logger logNotice: 'no routes' with: {'cmd'->aCommand. 'from'->aHandler}.
		^nil].

	^{self connectionForSystemId: route destinationId from: aHandler. route}