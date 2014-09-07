as yet unclassified
testRewriteDeliverSM
	| deliverSM msg parsedAgain body |
	deliverSM := self class deliverSM.
	self assert: deliverSM body sourceAddress equals: '1888817024782276'.
	self assert: deliverSM body destinationAddress equals: '1888817024782276'.

	body := smppRouter patcher patchCommand: deliverSM from: nil to: nil.
	
	self assert: body sourceAddress equals: '17024782276'.
	self assert: body destinationAddress equals: '17024782276'.
	"Check we patch in-place"
	self assert: body == deliverSM body.

	msg := deliverSM toMessage asByteArray.
	parsedAgain := SMPPMessage readFrom: msg readStream.
	self assert: parsedAgain body class equals: SMPPDeliverSM.