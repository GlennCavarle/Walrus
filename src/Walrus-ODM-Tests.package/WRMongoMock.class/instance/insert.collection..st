operations
insert: aCollection collection: aString
	| collection |
	collection := self collectionAt: aString.
	collection addAll: aCollection