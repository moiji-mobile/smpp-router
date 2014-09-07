as yet unclassified
sendUnroutableFor: aCommand to: aConnection
	| response |
	response := aCommand smppUnroutableResponse.
	response ifNotNil: [aConnection sendDirect: response toMessage asByteArray].