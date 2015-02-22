as yet unclassified
selectRouteFor: aCommand from: aConnection
	| routeName |
	routeName := routes at: aConnection systemId ifAbsent: [
		self logNotice: ('SMPPSystemIdRouter no routes for systemId(<1p>)'
						expandMacrosWith: aConnection systemId) area: #smppRouter.
		^nil].

	"Check if there is a target system and if it is available"
	connections do: [:each |
		each systemId = routeName ifTrue: [
			| conn |
			conn := each anyAuthenticatedConnection.
			conn ifNotNil: [
				conn isConnected ifTrue: [
					self logDebug: ('SMPPSystemIdRouter selected route for systemId(<1p>) to systemId(<2p>)'
										expandMacrosWith: aConnection systemId with: routeName) area: #smppRouter.
					^conn]]]].

	self logNotice: ('SMPPSystemIdRouter nothing connected for systemId(<1p>) -> systemId(<2p>)'
						expandMacrosWith: aConnection systemId with: routeName) area: #smppRouter.
	^nil