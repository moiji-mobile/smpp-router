as yet unclassified
testEndToEndSuccessNoConnection
	| source  |
	source := SMPPMockConnection new 
					systemId: 'source';
					yourself.
	
	smppRouter
		addConnection: source;
		routeSystemId: 'source' toSystemId: 'dest';
		yourself.

	"Check that there is no exception..."
	source handler dispatchMessage: (SMPPNumberPatcherTest deliverSM).
	self assert: source sent size equals: 0.