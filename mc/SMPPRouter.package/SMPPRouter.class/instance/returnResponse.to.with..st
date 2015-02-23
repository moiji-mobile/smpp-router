as yet unclassified
returnResponse: result to: aHandler with: sequenceNumber
	"Put back the original sequence number"
	self logDebug: ('SMPPRouter returning response to systemId(<1p>)'
						expandMacrosWith: aHandler systemId) area: #smppRouter.
	result header sequenceNumber: sequenceNumber.
	aHandler sendDirect: result toMessage asByteArray.