public
get
	| customer |
	customer := database selectOne: SMPPMongoDIDCustomer where: [:each | each customerName = variables first ].
	customer ifNil: [
		logger logNotice: 'Unknown customer' with: { 'customerName' -> variables first }.
		^self notFound].
	^self jsonResponse: {
		'customerName' -> customer customerName.
		'sipProxyIP' -> customer sipProxyIP.
		'sipProxyPort' -> customer sipProxyPort.
		'systemId' -> customer systemId. 
	} asDictionary.