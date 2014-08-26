master
sendToMaster: aMessage
	| conn |
	conn := master anyAuthenticatedConnection.
	self flag: #todo.
	conn ifNil: [
		| response |
		response := aMessage smppUnroutableResponse.
		response ifNotNil: [
			self sendToClient: response.
		].
		^self].	
	conn sendDirect: aMessage toMessage asByteArray.