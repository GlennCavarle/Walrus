Class {
	#name : #WRTestChildObject,
	#superclass : #Object,
	#instVars : [
		'id',
		'text'
	],
	#category : #'Walrus-Metadata-Tests'
}

{ #category : #examples }
WRTestChildObject class >> example1 [
	^ self new
		id: OID nextOID;
		text: 'hello child';
		yourself
]

{ #category : #examples }
WRTestChildObject class >> walrusMetadata [
	^ WRClassMetadata for: self name build: [ :mb | 
			mb
				database:'test-database';
				collection: 'test-child-collection';
				
				fields: [ :fb | 
					
					(fb identifier: #id)
						field:#_id;
						type:#OID.
						
					(fb property: #text)
						type: #String.
					
			] ]
]

{ #category : #accessing }
WRTestChildObject >> id [
	^ id
]

{ #category : #accessing }
WRTestChildObject >> id: anObject [
	id := anObject
]

{ #category : #accessing }
WRTestChildObject >> text [
	^ text
]

{ #category : #accessing }
WRTestChildObject >> text: anObject [
	text := anObject
]
