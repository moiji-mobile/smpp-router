as yet unclassified
setUp
	smppRouter := SMPPRouter new.
	smppRouter patcher: (SMPPNumberPatcher on: smppRouter)