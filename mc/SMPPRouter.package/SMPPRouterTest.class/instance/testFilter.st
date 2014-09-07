as yet unclassified
testFilter
	smppRouter filter: (SMPPNoFilter on: smppRouter).
	self  deny: smppRouter filter isNil