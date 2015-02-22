as yet unclassified
sendUnroutableFor: aCommand to: aConnection
	| response |
	self logError: ('SMPPRouter command unroutable <1p> on systemId(<2p>)'
					expandMacrosWith: aCommand body class with: aConnection systemId) area: #smppRouter.
	response := aCommand smppUnroutableResponse.
	response ifNotNil: [aConnection sendDirect: response toMessage asByteArray].