public
put
	| customer data |
	customer := database selectOne: SMPPMongoDIDCustomer where: [:each | each customerName = variables first ].
	customer ifNil: [
		customer := SMPPMongoDIDCustomer new.
		customer customerName: variables first].

	

	data := self jsonRequest.
	customer
		sipProxyIP: (data at: 'sipProxyIP');
		sipProxyPort: (data at: 'sipProxyPort');
		systemId: (data at: 'systemId').
	database save: customer.
	self emptyOkResponse