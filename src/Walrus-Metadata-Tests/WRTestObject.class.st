Class {
	#name : #WRTestObject,
	#superclass : #Object,
	#instVars : [
		'id',
		'text',
		'category',
		'tags',
		'children'
	],
	#category : #'Walrus-Metadata-Tests'
}

{ #category : #examples }
WRTestObject class >> example1 [
	^ self new
		id: OID nextOID;
		text: 'hello text';
		tags:#(#test #hello);
		category: WRTestChildObject example1;
		children:{
			WRTestChildObject example1.
			WRTestChildObject example1.
		}.
]

{ #category : #examples }
WRTestObject class >> walrusMetadata [
	^ WRClassMetadata for: self name build: [ :mb | 
			mb
				database:'test-database';
				collection: 'test-object-collection';
				
				fields: [ :fb | 
					
					(fb identifier: #id)
						field:#_id;
						type:#OID.
						
					(fb property: #text)
						type: #String.
						
					(fb embeddedList: #tags)
						type:#Symbol.
						
					(fb toOne: #category)
						type:#WRTestCategory;
						beLazy.
						
					(fb toMany: #children)
						type:#WRTestChildObject 
			] ]
]

{ #category : #accessing }
WRTestObject >> category [
	^ category
]

{ #category : #accessing }
WRTestObject >> category: anObject [
	category := anObject
]

{ #category : #accessing }
WRTestObject >> children [
	^ children
]

{ #category : #accessing }
WRTestObject >> children: anObject [
	children := anObject
]

{ #category : #accessing }
WRTestObject >> id [
	^ id
]

{ #category : #accessing }
WRTestObject >> id: anObject [
	id := anObject
]

{ #category : #initialization }
WRTestObject >> initialize [
	super initialize.
	tags := OrderedCollection new.
	children := OrderedCollection new
]

{ #category : #accessing }
WRTestObject >> tags [
	^ tags
]

{ #category : #accessing }
WRTestObject >> tags: anObject [
	tags := anObject
]

{ #category : #accessing }
WRTestObject >> text [
	^ text
]

{ #category : #accessing }
WRTestObject >> text: anObject [
	text := anObject
]
