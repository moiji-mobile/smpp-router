initialization
addConnection: aConnection
	"Remember where we want to route it to."
	logger logDebug: 'Adding connection' with: {aConnection}.

	aConnection
		onUnhandledCommand: [:handler :msg |
			self routeCommand: msg from: handler.
			statsdClient flush];
		onUnhandledResponse: [:handler :msg |
			logger logError: 'Response to unknown command' with: {handler}.
			statsdClient increment: 'smppRouter.unhandledResponse' rate: 1.
			statsdClient flush.
		].
	connections add: aConnection