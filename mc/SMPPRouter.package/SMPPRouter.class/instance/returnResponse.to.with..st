as yet unclassified
returnResponse: result to: aHandler with: sequenceNumber
	"Put back the original sequence number"
	logger logDebug: 'Returning response' with: {'result'->result. 'to'->aHandler}.

	result header sequenceNumber: sequenceNumber.
	aHandler sendDirect: result toMessage asByteArray.