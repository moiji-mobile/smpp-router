as yet unclassified
connectionForSystemId: routeName from: aHandler

	"Check if there is a target system and if it is available"
	connections do: [:each |
		each systemId = routeName ifTrue: [
			| conn |
			conn := each anyAuthenticatedConnection.
			conn ifNotNil: [
				conn isConnected ifTrue: [
					logger logDebug: 'Selected route' with: {'from'->aHandler. 'to'->conn}.
					^conn]]]].

	logger logNotice: 'No route available' with: {'from'->aHandler. 'routeName' -> routeName}.
	^nil