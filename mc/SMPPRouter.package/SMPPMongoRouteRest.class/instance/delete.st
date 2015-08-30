public
delete
	| route   |

	route := database selectOne: SMPPMongoRoute where: [:each | each msisdn = variables first ].
	route ifNil: [
		logger logNotice: 'Routing does not exist' with: { 'msisdn' -> variables first }.
		^self notFound].

	database remove: route.
	self emptyOkResponse.