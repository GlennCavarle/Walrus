private
fetchOne: criteria metadata: aClassMetadata connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection metadata: aClassMetadata.
	^ collection queryOne: [ :q | self buildQuery: q fromCriteria: criteria ]