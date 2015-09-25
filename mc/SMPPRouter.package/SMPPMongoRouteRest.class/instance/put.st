public
put
	| route customerName customer data |
	route := database selectOne: SMPPMongoRoute where: [:each | each msisdn = variables first ].
	route ifNil: [
		logger logNotice: 'Creating route for' with: { 'msisdn' -> variables first }.
		route := SMPPMongoRoute new.
		route msisdn: variables first].

	data := self jsonRequest.

	customerName := data at: 'customerName'.
	customer := database selectOne: SMPPMongoDIDCustomer where: [:each |
		each customerName = customerName ].
	customer ifNil: [
		logger logNotice: 'Customer does not exist' with: { 'msisdn' -> variables first. 'customerName' -> customerName  }.
		^self notFound].


	route
		customer: customer.
	database save: route.
	self emptyOkResponse