accessing
classMetadata
	<walrusClassMetadataFor: #WRTestObject>
	
	^ WRClassMetadata new
		database: 'test-database';
		collection: 'test-object-collection';
		yourself