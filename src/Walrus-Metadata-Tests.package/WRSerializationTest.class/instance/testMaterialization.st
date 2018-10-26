tests
testMaterialization
	| object rawObject m testObjMetadata|
	testObjMetadata := metadataFactory classMetadataFor: #WRTestObject.
	
	rawObject := (WRClassMetadataSerializer metadataFactory: metadataFactory)
			serialize: WRTestObject example1
			metadata: testObjMetadata.
			
	m := (WRClassMetadataMaterializer metadataFactory: metadataFactory).
	object := m
		materialize: rawObject
		metadata: testObjMetadata.
	
	self assert: (object isKindOf: WRTestObject).
	self assert: (object text = 'hello text').
	self assert: (object category isKindOf: WRUnresolvedObject ).
	
	self assert: m unresolvedReferences size = 2