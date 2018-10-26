accessing
classMetadata
	<walrusClassMetadataFor: #WRTestChildObject>
	
	^ WRClassMetadata new
		database: 'test-database';
		collection: 'test-child-collection';
		yourself