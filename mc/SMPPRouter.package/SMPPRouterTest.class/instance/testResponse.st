as yet unclassified
testResponse
	| deliverSM response responseParsed |
	deliverSM := SMPPMessage readFrom: SMPPMessageTest new exampleDeliverSM readStream.
	response := deliverSM smppUnroutableResponse.
	self deny: response isNil.
	self assert: response toMessage asByteArray equals: #[0 0 0 17 128 0 0 5 0 0 0 8 0 0 0 1 0].
	responseParsed := SMPPMessage readFrom: response toMessage asByteArray readStream.
	self assert: responseParsed body class equals: SMPPDeliverSMResponse.
	
