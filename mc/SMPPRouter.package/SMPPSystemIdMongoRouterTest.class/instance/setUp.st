as yet unclassified
setUp
	smppRouter := SMPPSystemIdMongoRouter new.
	smppRouter database: (VOMemoryRepository new).