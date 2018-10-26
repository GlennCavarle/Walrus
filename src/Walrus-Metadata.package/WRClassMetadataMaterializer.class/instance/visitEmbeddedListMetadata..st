visiting
visitEmbeddedListMetadata: aMetadata
	| rawList itemMetadata resultSet|
	resultSet := self newCollection: aMetadata collectionType.
	rawList := aMetadata readFieldIn: self jsonData.
	rawList ifNotEmpty:[
		itemMetadata := metadataFactory classMetadataFor: aMetadata type.
		resultSet := rawList collect:[:each| self materialize: each metadata: itemMetadata]].
	
	aMetadata writePropertyValue: resultSet in: self object