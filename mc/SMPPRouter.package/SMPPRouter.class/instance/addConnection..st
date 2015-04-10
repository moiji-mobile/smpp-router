initialization
addConnection: aConnection
	"Remember where we want to route it to."
	logger logDebug: 'Adding connection' with: {aConnection}.

	aConnection
		onUnhandledCommand: [:handler :msg |
			self routeCommand: msg from: handler];
		onUnhandledResponse: [:handler :msg |
			logger logError: 'Response to unknown command' with: {handler}.
		].
	connections add: aConnection