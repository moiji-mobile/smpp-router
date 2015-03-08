as yet unclassified
matchesCommand: aMessage from: aHandler
	"This can only work for deliver_SM and submit_SM"
	| body |
	body := aMessage body.
	(body class = SMPPDeliverSM or: [body class = SMPPSubmitSM])
		ifFalse: [^false].

	(sourceAddressMatcher matches: body sourceAddress)
		ifFalse: [^false].

	(destinationAddressMatcher matches: body destinationAddress)
		ifFalse: [^false].

	^super matchesCommand: aMessage from: aHandler