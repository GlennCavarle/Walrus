tests
testSerialization
	| jsonData |
	WRClassMetadataRegistry reset.
	WRClassMetadataRegistry uniqueInstance 
		registerMetadata: WRTestChildObject walrusMetadata.
	
	jsonData := (WRClassMetadataSerializer  metadataFactory: metadataFactory)
		serialize: WRTestObject example1 metadata: WRTestObject walrusMetadata