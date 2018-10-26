public
fetchById: anId
	| anObject |
	anObject := dataMapper fetchById: anId.
	self registerClean: anObject.
	^ anObject