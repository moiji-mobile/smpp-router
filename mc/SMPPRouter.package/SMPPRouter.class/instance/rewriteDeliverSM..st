as yet unclassified
rewriteDeliverSM: aDeliverSM
	| address |
	address := aDeliverSM destinationAddress.
	(address beginsWith: '8888')
		ifTrue: [aDeliverSM destinationAddress: (address allButFirst: 4)].

	address := aDeliverSM sourceAddress.
	(address beginsWith: '8888')
		ifTrue: [aDeliverSM sourceAddress: (address allButFirst: 4)].