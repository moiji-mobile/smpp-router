as yet unclassified
testUnroutableDeliverSM
	| source  response |
	source := SMPPMockConnection new 
					systemId: 'source';
					yourself.
	
	smppRouter
		addConnection: source;
		yourself.

	"Select some more sequence numbers"
	source handler dispatchMessage: (SMPPNumberPatcherTest deliverSM).
	self assert: source sent size equals: 1.
	response := SMPPMessage readFrom: source sent first readStream.
	self assert: response body isCommand not.