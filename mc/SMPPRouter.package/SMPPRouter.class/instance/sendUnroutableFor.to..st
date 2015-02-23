as yet unclassified
sendUnroutableFor: aCommand to: aHandler
	| response |
	self logError: ('SMPPRouter command unroutable <1p> on systemId(<2p>)'
					expandMacrosWith: aCommand body class with: aHandler systemId) area: #smppRouter.
	response := aCommand smppUnroutableResponse.
	response ifNotNil: [aHandler sendDirect: response toMessage asByteArray].