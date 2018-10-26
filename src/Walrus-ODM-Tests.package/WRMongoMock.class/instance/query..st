operations
query: aMongoQuery
	| results collection |
	results := OrderedCollection new.
	collection := self collectionAt: aMongoQuery qualifiedName.
	results := self privateSelect: aMongoQuery where onCollection: collection.
	^ results