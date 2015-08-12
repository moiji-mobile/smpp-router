public
put
	| route customer data |
	route := database selectOne: SMPPMongoRoute where: [:each | each msisdn = variables first ].
	route ifNil: [
		route := SMPPMongoRoute new.
		route msisdn: variables first].

	data := self jsonRequest.

	customer := database selectOne: SMPPMongoDIDCustomer where: [:each |
		each customerName = (data at: 'customerName') ].
	customer ifNil: [^self notFound].


	route
		customer: customer.
	database save: route.
	self emptyOkResponse