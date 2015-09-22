as yet unclassified
pack: aText esmClass: anEsmClass
	| skipBytes padding udh data input udhi dataPacked result |
	skipBytes := 0.
	padding := 0.
	udh := #[] toMessage.
	data := #[] toMessage.
	
	input := aText readStream.
	udhi := (anEsmClass bitAnd: 2r01000000) > 0.

	udhi ifTrue: [
		| len tmp fillBits |
		len := input next.
		tmp := input next: len.
		tmp size = len ifFalse: [
			^self error: 'Short read on UDH'].
		udh putByteArray: tmp.
		data putByte: len.
		data putByteArray: udh.

		skipBytes := (((udh size)* 8) \\ 7).
		fillBits := 7 - skipBytes.
		fillBits > 0 ifTrue: [
			skipBytes := skipBytes + 1.
			padding := 1.
			data putByte: 0]].

	"Does the UDH stop on a 7bit boundary? If not we need to add padding.."
	data putByteArray: input upToEnd asByteArray.
	dataPacked := (GSMEncoding compact: data) allButFirst: skipBytes.

	result := WriteStream on: ByteArray new.
	udhi ifTrue: [
		result
			nextPut: udh size;
			nextPutAll: udh asByteArray.
	].
	result nextPutAll: dataPacked.
	^result contents