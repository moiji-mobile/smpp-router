master
addMaster: anOutGoingConnection
	master := anOutGoingConnection.
	master
		onUnhandledCommandOrResponse: [:conn :msg |
			self sendToClient: msg.
		];
		onUnhandledResponse: [:conn :msg |
			self sendToClient: msg.
		].