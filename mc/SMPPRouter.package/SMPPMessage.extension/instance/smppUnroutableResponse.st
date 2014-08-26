*SMPPRouter
smppUnroutableResponse
	| msg |
	body isCommand ifFalse: [^nil].
	
	msg := (SMPPMessage new)
				header: ((SMPPPDUHeader new)
					commandId: body responseForCommand;
					commandStatus: 8;
					sequenceNumber:  header sequenceNumber;
					yourself);
			body: body responseErrorBody.
	^msg