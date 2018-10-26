tests
testFromAnnotation
	|factory|
	factory := WRClassMetadataFactory withAnnotationLoader.
	factory classMetadataFor: #WRTestObject
	