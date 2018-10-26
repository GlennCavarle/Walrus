private
serializeTypeObject: anObject
	^ (WRClassMetadataSerializer metadataFactory: metadataFactory)
			serialize: anObject metadata: (self typeMetadataOf: anObject)