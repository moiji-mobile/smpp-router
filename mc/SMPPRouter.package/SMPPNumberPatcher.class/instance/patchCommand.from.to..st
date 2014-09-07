as yet unclassified
patchCommand: aCommand from: aConnection to: aRemoteConnection
	^aCommand body smppRouterRewriteForClient: self