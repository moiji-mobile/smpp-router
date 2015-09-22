as yet unclassified
test7bitPacking
	| deliverSM msg parsedAgain body |
	deliverSM := SMPPNumberPatcherTest deliverSM.
	self assert: deliverSM body sourceAddress equals: '1888817024782276'.
	self assert: deliverSM body destinationAddress equals: '1888817024782276'.
	self assert: deliverSM body shortMessage size equals: 10.

	body := smppRouter patcher patchBody: deliverSM body from: nil to: nil.
	

	"Check we patch in-place"
	self assert: body == deliverSM body.
	self assert: body shortMessage size equals: 9.

	msg := deliverSM toMessage asByteArray.
	parsedAgain := SMPPMessage readFrom: msg readStream.
	self assert: parsedAgain body class equals: SMPPDeliverSM.