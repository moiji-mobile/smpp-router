as yet unclassified
returnResponse: result to: aConnection with: sequenceNumber
	"Put back the original sequence number"
	result header sequenceNumber: sequenceNumber.
	aConnection sendDirect: result toMessage asByteArray.