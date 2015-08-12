public
get
	| route   |
	route := database selectOne: SMPPMongoRoute where: [:each | each msisdn = variables first ].
	route ifNil: [^self notFound].

	^self jsonResponse:{
		'msisdn' -> route msisdn.
		'customerName' -> route customer customerName} asDictionary.