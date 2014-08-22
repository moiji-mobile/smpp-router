master
sendToMaster: aMessage
	| conn |
	conn := master anyAuthenticatedConnection.
	self flag: #todo.
	conn ifNil: [^self].	
	conn sendDirect: aMessage toMessage asByteArray.