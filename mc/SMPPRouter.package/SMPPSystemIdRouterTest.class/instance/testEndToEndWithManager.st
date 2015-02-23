as yet unclassified
testEndToEndWithManager
	| source dest command manager |
	manager := SMPPConnectionManager new
					systemId: 'source';
					yourself.
	source := SMPPMockConnection new 
					systemId: 'source';
					yourself.
	dest := SMPPMockConnection new
					systemId: 'dest';
					scheduleToSuper;
					omitResult;
					yourself.
	
	smppRouter
		addConnection: manager;
		addConnection: dest;
		routeSystemId: 'source' toSystemId: 'dest';
		yourself.

	"Fake the effect of a connect for the source"
	source	onUnhandledCommand: manager onUnhandledCommand.
	source onUnhandledResponse: manager unhandledResponse.

	"Select some more sequence numbers"
	dest handler
		nextSequenceNumber;
		nextSequenceNumber.
	self assert: dest handler nextSequenceNumber equals: 3.
	source handler dispatchMessage: (SMPPNumberPatcherTest deliverSM).
	self assert: source sent size equals: 0.
	self assert: dest sent size equals: 1.
	command := SMPPMessage readFrom: dest sent first readStream.
	self assert: command header sequenceNumber equals: 4.
	self assert: command body isCommand.

	"Return it as unroutable with a trick"
	dest handler dispatchMessage: command smppUnroutableResponse.
	self assert: dest sent size equals: 1.
	self assert: source sent size equals: 1.
	command := SMPPMessage readFrom: source sent first readStream.
	self assert: command header sequenceNumber equals: 1.
	self deny: command body isCommand.