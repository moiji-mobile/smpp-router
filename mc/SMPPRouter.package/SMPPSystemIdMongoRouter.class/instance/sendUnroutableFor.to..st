as yet unclassified
sendUnroutableFor: aCommand to: aHandler
	| response |
	"We don't want an unroutable number to be retried. Instead just let it sink
	here"
	logger logError: 'Command unroutable. Replying positively' with: {'cmd'->aCommand.  'to'->aHandler}.
	unroutableCounter increment.
	statsdClient increment: 'smppRouter.unroutable' rate: 1.

	response := SMPPMessage new
					header: (SMPPPDUHeader new
						commandId: aCommand body responseForCommand;
						commandStatus: 0;
						sequenceNumber: aCommand header sequenceNumber;
						yourself);
					body: aCommand body responseSuccessBody.
	aHandler sendDirect: response toMessage asByteArray.