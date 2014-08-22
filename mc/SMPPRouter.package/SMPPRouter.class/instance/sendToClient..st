client
sendToClient: aMessage
	| conn |
	conn := clientManager anyAuthenticatedConnection.
	self flag: #todo.
	conn ifNil: [^self].

	conn sendDirect: aMessage toMessage asByteArray