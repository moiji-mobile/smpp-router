as yet unclassified
patchBody: aBody from: aHandler to: aRemoteConnection
	| text |

	"Only trigger on specific bodies"
	aBody dataCoding = dcs ifFalse: [
		^aBody].

	text := aBody shortMessage asByteArray.
	aBody shortMessage: (self pack: text esmClass: aBody esmClass).
	^aBody