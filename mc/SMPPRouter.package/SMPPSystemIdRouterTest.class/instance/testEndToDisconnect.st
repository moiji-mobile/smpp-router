as yet unclassified
testEndToDisconnect
	| source dest command |
	source := SMPPMockConnection new 
					systemId: 'source';
					yourself.
	dest := SMPPMockConnection new
					systemId: 'dest';
					scheduleToSuper;
					omitResult;
					yourself.
	
	smppRouter
		addConnection: source;
		addConnection: dest;
		routeSystemId: 'source' toSystemId: 'dest';
		yourself.

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

	"Disconnect"
	dest setUnreachable.
	dest handler disconnected.

	"Verify the cancelation"
	self assert: source sent size equals: 1.
	self assert: dest sent size equals: 1.

	command := SMPPMessage readFrom: source sent first readStream.
	self assert: command header sequenceNumber equals: 1.
	self deny: command body isCommand.