as yet unclassified
patch: aCommand from: aHandler to: aConnection rule: aRule
	| body |
	body := aCommand body.
	body := patcher patchBody: body from: aHandler to: aConnection.

	"Quadratic but low amount of patchers and rules!"
	aRule patcherNames do: [:name |
		patchers do: [:each |
			each patcherName = name ifTrue: [
				body := each patchBody: body from: aHandler to: aConnection]]].
	^body