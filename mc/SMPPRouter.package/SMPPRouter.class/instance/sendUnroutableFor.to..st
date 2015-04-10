as yet unclassified
sendUnroutableFor: aCommand to: aHandler
	| response |
	logger logError: 'Command unroutable' with: {'cmd'->aCommand.  'to'->aHandler}.

	response := aCommand smppUnroutableResponse.
	response ifNotNil: [aHandler sendDirect: response toMessage asByteArray].