public
withConnection: aBlock
	| con |
	con := self obtainConnection.
	[ aBlock value: con ]
		ensure: [ self releaseConnection: con ]