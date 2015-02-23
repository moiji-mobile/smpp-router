initialization
addConnection: aConnection
	"Remember where we want to route it to."
	self logDebug: ('SMPPRouter adding connection systemId(<1p>) to the list'
						expandMacrosWith: aConnection systemId) area: #smppRouter.

	aConnection
		onUnhandledCommand: [:handler :msg |
			self routeCommand: msg from: handler];
		onUnhandledResponse: [:handler :msg |
			self logError: ('SMPPRouter response to unknown command on systemId(<1p>)'
							expandMacrosWith: handler systemId) area: #smppRouter.
		].
	connections add: aConnection