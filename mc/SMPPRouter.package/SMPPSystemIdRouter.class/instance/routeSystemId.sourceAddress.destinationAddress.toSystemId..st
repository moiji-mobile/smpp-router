as yet unclassified
routeSystemId: aSourceId sourceAddress: aSourceAddress destinationAddress: aDestAddress toSystemId: aRemoteId
	self logDebug: ('SMPPSystemIdRouter adding route from systemId(<1p>) to systemId(<2p>) for <3p>/<4p>'
						expandMacrosWith: aSourceId with: aRemoteId with: aSourceAddress with: aDestAddress)
						area: #smppRouter.
	routes add: (SMPPSystemIdBodyRoute new
					sourceId: aSourceId;
					sourceAddressMatcher: aSourceAddress;
					destinationId: aRemoteId;
					destinationAddressMatcher: aDestAddress;
					yourself).