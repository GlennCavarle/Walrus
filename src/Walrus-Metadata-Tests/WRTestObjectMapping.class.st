Class {
	#name : #WRTestObjectMapping,
	#superclass : #WRAnnotationMapping,
	#category : #'Walrus-Metadata-Tests'
}

{ #category : #accessing }
WRTestObjectMapping class >> classMetadata [
	<walrusClassMetadataFor: #WRTestObject>
	
	^ WRClassMetadata new
		database: 'test-database';
		collection: 'test-object-collection';
		yourself
]

{ #category : #accessing }
WRTestObjectMapping class >> propCategory [
	<walrusPropertyMetadata>
	
	^ (WRToOneMetadata named: #category)
			type: #WRTestCategory;
			beLazy;
			yourself
]

{ #category : #accessing }
WRTestObjectMapping class >> propChildren [
	<walrusPropertyMetadata>
	
	^ (WRToManyMetadata named: #children)
			type: #WRTestChildObject;
			yourself
]

{ #category : #accessing }
WRTestObjectMapping class >> propId [
	<walrusPropertyMetadata>
	^ (WRIdentifierMetadata named: #id)
		type: #OID;
		field: #_id;
		yourself
]

{ #category : #accessing }
WRTestObjectMapping class >> propTags [
	<walrusPropertyMetadata>
	
	^ (WREmbeddedListMetadata named: #tags)
			type: #Symbol;
			yourself
]

{ #category : #accessing }
WRTestObjectMapping class >> propText [
	<walrusPropertyMetadata>
	
	^ WRPropertyMetadata named: #text type: #String
]
