as yet unclassified
rewriteDeliverSM: aDeliverSM
	| address |
	address := aDeliverSM destinationAddress.
	(address beginsWith: '18888')
		ifTrue: [aDeliverSM destinationAddress: (address allButFirst: 5)].

	address := aDeliverSM sourceAddress.
	(address beginsWith: '18888')
		ifTrue: [aDeliverSM sourceAddress: (address allButFirst: 5)].