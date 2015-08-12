as yet unclassified
match: request

	| subclasses |
	subclasses := {SMPPMongoDIDCustomerRest. SMPPMongoRouteRest}.
	subclasses do: [ :each |
		(each match: request)
			ifNotNil: [ :variables |
				^ each new
					variables: variables;
					database: database;
					yourself ] ].
	^ nil  