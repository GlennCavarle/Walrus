private
fetchAll: criteria metadata: aClassMetadata connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection metadata: aClassMetadata.
	^ collection query: [ :q | self buildQuery: q fromCriteria: criteria ]