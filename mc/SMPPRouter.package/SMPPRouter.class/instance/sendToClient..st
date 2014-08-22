client
sendToClient: aMessage
	| conn |
	conn := clientManager anyAuthenticatedConnection.
	self flag: #todo.
	conn ifNil: [^self].
	
	aMessage body smppRouterRewriteForClient: self.

	conn sendDirect: aMessage toMessage asByteArray