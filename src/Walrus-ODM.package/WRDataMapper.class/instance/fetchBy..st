operations
fetchBy: criteria
	| resultSet |
	resultSet := OrderedCollection new.
	
	connection withConnection: [ :con | 
		resultSet := self basicFetchBy: criteria connection: con ].
	
	^ self materializeCollection: resultSet