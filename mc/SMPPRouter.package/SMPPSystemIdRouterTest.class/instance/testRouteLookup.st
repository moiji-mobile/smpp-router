as yet unclassified
testRouteLookup
	| conn source dest|
	smppRouter
		addConnection: (source := SMPPMockConnection new systemId: 'source'; yourself);
		addConnection: (dest := SMPPMockConnection new systemId: 'dest'; yourself);
		routeSystemId: 'source' toSystemId: 'dest';
		yourself.


	conn := smppRouter selectRouteFor: nil from: source.
	self assert: conn == dest.