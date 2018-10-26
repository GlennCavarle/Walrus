tests
test
	|dataMapper con testObjMetadata|
	testObjMetadata := WRTestObject walrusMetadata.
	WRClassMetadataRegistry reset.
	WRClassMetadataRegistry uniqueInstance 
		registerMetadata: testObjMetadata;
		registerMetadata: WRTestChildObject walrusMetadata.
	
	con := self newConnectionPoolMockWithSize: 1.
	dataMapper := WRDataMapper connection: con metadata: testObjMetadata. 
	
	dataMapper insert: WRTestObject example1.
	dataMapper fetchAll.
	
	dataMapper update: WRTestObject example1.