as yet unclassified
findRouteFor: aCommand from: aHandler
	routes do: [:each |
		(each matchesCommand: aCommand from: aHandler)
			ifTrue: [^each]].

	^nil
	