as yet unclassified
testRewriteDeliverSM
	| deliverSM msg parsedAgain |
	deliverSM := SMPPMessage readFrom: SMPPMessageTest new exampleDeliverSM readStream.
	self assert: deliverSM body sourceAddress equals: '888817024782276'.
	self assert: deliverSM body destinationAddress equals: '888817024782276'.
	deliverSM body smppRouterRewriteForClient: smppRouter.
	self assert: deliverSM body sourceAddress equals: '17024782276'.
	self assert: deliverSM body destinationAddress equals: '17024782276'.

	msg := deliverSM toMessage asByteArray.
	parsedAgain := SMPPMessage readFrom: msg readStream.
	self assert: parsedAgain body class equals: SMPPDeliverSM.