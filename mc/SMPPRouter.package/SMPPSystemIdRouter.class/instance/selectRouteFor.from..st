as yet unclassified
selectRouteFor: aCommand from: aHandler
	| routeName |
	routeName := routes at: aHandler systemId ifAbsent: [
		self logNotice: ('SMPPSystemIdRouter no routes for systemId(<1p>)'
						expandMacrosWith: aHandler systemId) area: #smppRouter.
		^nil].

	"Check if there is a target system and if it is available"
	connections do: [:each |
		each systemId = routeName ifTrue: [
			| conn |
			conn := each anyAuthenticatedConnection.
			conn ifNotNil: [
				conn isConnected ifTrue: [
					self logDebug: ('SMPPSystemIdRouter selected route for systemId(<1p>) to systemId(<2p>)'
										expandMacrosWith: aHandler systemId with: routeName) area: #smppRouter.
					^conn]]]].

	self logNotice: ('SMPPSystemIdRouter nothing connected for systemId(<1p>) -> systemId(<2p>)'
						expandMacrosWith: aHandler systemId with: routeName) area: #smppRouter.
	^nil