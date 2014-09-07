initialization
addConnection: aConnection
	"Remember where we want to route it to."

	aConnection
		onUnhandledCommand: [:conn :msg |
			self routeCommand: msg from: aConnection];
		onUnhandledResponse: [:conn :msg |
			Transcript nextPutAll: 'Unknown response on command. Should not happen'; cr.
		].