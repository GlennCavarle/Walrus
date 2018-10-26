private
delete: criteria metadata: aClassMetadata connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection metadata: aClassMetadata.
	^ collection delete: criteria