as yet unclassified
selectRouteFor: aCommand from: aHandler
	| route routeName |
	route := self findRouteFor: aCommand from: aHandler.
	route ifNil: [
		logger logNotice: 'no routes' with: {'cmd'->aCommand. 'from'->aHandler}.
		^nil].

	routeName := route destinationId.
	"Check if there is a target system and if it is available"
	connections do: [:each |
		each systemId = routeName ifTrue: [
			| conn |
			conn := each anyAuthenticatedConnection.
			conn ifNotNil: [
				conn isConnected ifTrue: [
					logger logDebug: 'Selected route' with: {'from'->aHandler. 'to'->conn}.
					^conn]]]].

	logger logNotice: 'No route available' with: {'from'->aHandler. route}.
	^nil