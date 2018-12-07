Class {
	#name : #WRTestChildObjectMapping,
	#superclass : #WRAnnotationMapping,
	#category : #'Walrus-Metadata-Testing'
}

{ #category : #accessing }
WRTestChildObjectMapping class >> classMetadata [
	<walrusClassMetadataFor: #WRTestChildObject>
	
	^ WRClassMetadata new
		database: 'test-database';
		collection: 'test-child-collection';
		yourself
]

{ #category : #accessing }
WRTestChildObjectMapping class >> propId [
	<walrusPropertyMetadata>
	^ (WRIdentifierMetadata named: #id)
		type: #OID;
		field: #_id;
		yourself
]

{ #category : #accessing }
WRTestChildObjectMapping class >> propText [
	<walrusPropertyMetadata>
	
	^ WRPropertyMetadata named: #text type: #String
]
