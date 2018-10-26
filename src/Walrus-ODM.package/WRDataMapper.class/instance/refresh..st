operations
refresh: anObject
	| refreshedObject |
	refreshedObject := self fetchOneById: (self idOf: anObject).
	anObject becomeForward: refreshedObject copyHash: false