operations
update: origDictionary with: newDictionary collection: aString flags: aFlag
	| collection |
	collection := self collectionAt: aString.
	