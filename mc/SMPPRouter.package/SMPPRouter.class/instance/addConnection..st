initialization
addConnection: aConnection
	"Remember where we want to route it to."
	self logDebug: ('SMPPRouter adding connection systemId(<1p>) to the list'
						expandMacrosWith: aConnection systemId) area: #smppRouter.

	aConnection
		onUnhandledCommand: [:conn :msg |
			self routeCommand: msg from: aConnection];
		onUnhandledResponse: [:conn :msg |
			self logError: ('SMPPRouter response to unknown command on systemId(<1p>)'
							expandMacrosWith: aConnection systemId) area: #smppRouter.
		].
	connections add: aConnection