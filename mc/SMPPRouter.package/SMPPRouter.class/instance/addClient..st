client
addClient: aSMPPConnectionManager 
	clientManager := aSMPPConnectionManager.
	clientManager
		onUnhandledCommandOrResponse: [:conn :msg |
			self sendToMaster: msg.
		];
		onUnhandledResponse: [:conn :msg |
			self sendToMaster: msg.
		].