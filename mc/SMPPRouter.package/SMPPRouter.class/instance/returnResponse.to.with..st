as yet unclassified
returnResponse: result to: aConnection with: sequenceNumber
	"Put back the original sequence number"
	self logDebug: ('SMPPRouter returning response to systemId(<1p>)'
						expandMacrosWith: aConnection systemId) area: #smppRouter.
	result header sequenceNumber: sequenceNumber.
	aConnection sendDirect: result toMessage asByteArray.