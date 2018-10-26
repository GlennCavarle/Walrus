as yet unclassified
serialize: anObject metadata: aClassMetadata
	^ self new
		object: anObject;
		visit: aClassMetadata;
		jsonData