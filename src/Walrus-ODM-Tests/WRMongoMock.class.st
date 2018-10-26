Class {
	#name : #WRMongoMock,
	#superclass : #MongoMock,
	#instVars : [
		'isOpen',
		'inMemoryDatabase'
	],
	#category : #'Walrus-ODM-Tests-Mock'
}

{ #category : #operations }
WRMongoMock >> close [
	isOpen := false
]

{ #category : #private }
WRMongoMock >> collectionAt: aString [
	^ inMemoryDatabase at: aString ifAbsentPut: [ Dictionary new ]
]

{ #category : #initialization }
WRMongoMock >> initialize [
	super initialize.
	isOpen := false.
	inMemoryDatabase := Dictionary new.
]

{ #category : #operations }
WRMongoMock >> insert: aCollection collection: aString [
	| collection |
	collection := self collectionAt: aString.
	collection addAll: aCollection
]

{ #category : #operations }
WRMongoMock >> isOpen [
	^ isOpen
]

{ #category : #operations }
WRMongoMock >> open [
	isOpen := true
]

{ #category : #private }
WRMongoMock >> privateSelect: criteria onCollection: aCollection [
	| results |
	results := OrderedCollection new.
	criteria ifEmpty: [ ^ aCollection asOrderedCollection  ].
	results := (aCollection select: [:each| (each difference: criteria) isEmpty ]) asOrderedCollection.
	
	^ results
]

{ #category : #operations }
WRMongoMock >> query: aMongoQuery [
	| results collection |
	results := OrderedCollection new.
	collection := self collectionAt: aMongoQuery qualifiedName.
	results := self privateSelect: aMongoQuery where onCollection: collection.
	^ results
]

{ #category : #operations }
WRMongoMock >> update: origDictionary with: newDictionary collection: aString flags: aFlag [
	| collection |
	collection := self collectionAt: aString.
	
]
