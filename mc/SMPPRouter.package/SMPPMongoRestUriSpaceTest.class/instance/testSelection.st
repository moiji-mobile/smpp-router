as yet unclassified
testSelection
	"Smoke test that everything got loaded"
	| operation |
	operation := restSpace match: (ZnRequest get: '/v1/routing/13213213').
	self assert: operation class equals: SMPPMongoRouteRest.

	operation := restSpace match: (ZnRequest get: '/v1/customer/13213213').
	self assert: operation class equals: SMPPMongoDIDCustomerRest.