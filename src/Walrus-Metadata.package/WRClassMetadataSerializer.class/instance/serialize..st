initialization
serialize: anObject
	^ self 
		serialize: anObject 
		metadata: (metadataFactory classMetadataFor: anObject class name)