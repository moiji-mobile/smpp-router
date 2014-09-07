as yet unclassified
selectRouteFor: aCommand from: aConnection
	| routeName |
	routeName := routes at: aConnection systemId ifAbsent: [^nil].

	"Check if there is a target system and if it is available"
	connections do: [:each |
		each systemId = routeName ifTrue: [
			| conn |
			conn := each anyAuthenticatedConnection.
			conn ifNotNil: [
				conn isConnected ifTrue: [^conn]]]].

	^nil