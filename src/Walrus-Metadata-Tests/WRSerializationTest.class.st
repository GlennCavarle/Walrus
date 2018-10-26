Class {
	#name : #WRSerializationTest,
	#superclass : #TestCase,
	#instVars : [
		'metadataFactory'
	],
	#category : #'Walrus-Metadata-Tests'
}

{ #category : #private }
WRSerializationTest >> serializeTypeObject: anObject [
	^ (WRClassMetadataSerializer metadataFactory: metadataFactory)
			serialize: anObject metadata: (self typeMetadataOf: anObject)
]

{ #category : #initialization }
WRSerializationTest >> setUp [
	metadataFactory := WRClassMetadataFactory withAnnotationLoader 
]

{ #category : #tests }
WRSerializationTest >> testMaterialization [
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
]

{ #category : #tests }
WRSerializationTest >> testSerialization [
	| jsonData |
	WRClassMetadataRegistry reset.
	WRClassMetadataRegistry uniqueInstance 
		registerMetadata: WRTestChildObject walrusMetadata.
	
	jsonData := (WRClassMetadataSerializer  metadataFactory: metadataFactory)
		serialize: WRTestObject example1 metadata: WRTestObject walrusMetadata
]

{ #category : #tests }
WRSerializationTest >> testTypeSerialization [
	|today now|
	today := Date today.
	now := DateAndTime now.
	WRClassMetadataRegistry reset.
	
	self assert: (self serializeTypeObject: true) = true.
	self assert: (self serializeTypeObject: #aSymbol) = #aSymbol.
	self assert: (self serializeTypeObject: 'aString') = 'aString'.
	self assert: (self serializeTypeObject: 12) = 12.
	self assert: (self serializeTypeObject: nil) = nil.
	self assert: (self serializeTypeObject: today) = today yyyymmdd.
	self assert: (self serializeTypeObject: now) = now asUTC asString
]

{ #category : #private }
WRSerializationTest >> typeMetadataOf: anObject [
	^ WRClassMetadataRegistry uniqueInstance metadataForClass: anObject class name
]
