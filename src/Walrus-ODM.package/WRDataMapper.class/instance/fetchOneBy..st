operations
fetchOneBy: criteria
	| result |
	result := nil.
	
	connection withConnection: [ :con | 
		result := self basicFetchOneBy: criteria connection: con ].
	
	^ self materialize: result