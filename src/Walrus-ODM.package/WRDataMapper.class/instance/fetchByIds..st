operations
fetchByIds: aCollectionOfIds
	| resultSet |
	resultSet := {}.
	connection withConnection: [ :con | 
		resultSet := self basicFetchByIds: aCollectionOfIds connection: con ].
	^ self materializeCollection: resultSet