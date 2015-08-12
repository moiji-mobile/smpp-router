public
get
	| route   |
	route := database selectOne: SMPPMongoRoute where: [:each | each msisdn = variables first ].
	route ifNil: [
		logger logNotice: 'Routing does not exist' with: { 'msisdn' -> variables first }.
		^self notFound].

	^self jsonResponse:{
		'msisdn' -> route msisdn.
		'customerName' -> route customer customerName} asDictionary.