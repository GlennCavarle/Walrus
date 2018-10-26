visiting
visitToManyMetadata: aMetadata
	| rawList resultSet|
	resultSet := self newCollection: aMetadata type.
	rawList := aMetadata readFieldIn: self jsonData.
	rawList ifNotEmpty:[
		resultSet := self newUnresolvedCollection:rawList metadata: aMetadata].
	
	aMetadata writePropertyValue: resultSet in: self object