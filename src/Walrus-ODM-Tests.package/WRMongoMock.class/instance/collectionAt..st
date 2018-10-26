private
collectionAt: aString
	^ inMemoryDatabase at: aString ifAbsentPut: [ Dictionary new ]