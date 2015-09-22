as yet unclassified
setUp
	sevenBitPatcher := SMPP7BitPackingPatcher new.
	sevenBitPatcher dcs: 0.

	smppRouter := SMPPRouter new.
	smppRouter patcher: sevenBitPatcher.