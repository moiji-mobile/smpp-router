client
sendToClient: aMessage
	| conn |
	conn := clientManager anyAuthenticatedConnection.
	self flag: #todo.
	"Don't return an error to the master as this would loop!"
	conn ifNil: [^self].

	conn sendDirect: aMessage toMessage asByteArray