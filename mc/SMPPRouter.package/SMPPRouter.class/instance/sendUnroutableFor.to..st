as yet unclassified
sendUnroutableFor: aCommand to: aHandler
	| response |
	logger logError: 'Command unroutable' with: {'cmd'->aCommand.  'to'->aHandler}.
	unroutableCounter increment.
	statsdClient increment: 'smppRouter.unroutable' rate: 1.

	response := aCommand smppUnroutableResponse.
	response ifNotNil: [aHandler sendDirect: response toMessage asByteArray].