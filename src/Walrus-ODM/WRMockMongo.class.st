Class {
	#name : #WRMockMongo,
	#superclass : #MongoMock,
	#instVars : [
		'isOpen',
		'inMemoryDatabase'
	],
	#category : #'Walrus-ODM-Testing'
}

{ #category : #operations }
WRMockMongo >> close [
	isOpen := false
]

{ #category : #private }
WRMockMongo >> collectionAt: aString [
	^ inMemoryDatabase at: aString ifAbsentPut: [ Dictionary new ]
]

{ #category : #initialization }
WRMockMongo >> initialize [
	super initialize.
	isOpen := false.
	inMemoryDatabase := Dictionary new.
]

{ #category : #operations }
WRMockMongo >> insert: aCollection collection: aString [
	| collection |
	collection := self collectionAt: aString.
	collection addAll: aCollection
]

{ #category : #operations }
WRMockMongo >> isOpen [
	^ isOpen
]

{ #category : #operations }
WRMockMongo >> open [
	isOpen := true
]

{ #category : #private }
WRMockMongo >> privateSelect: criteria onCollection: aCollection [
	| results |
	results := OrderedCollection new.
	criteria ifEmpty: [ ^ aCollection asOrderedCollection  ].
	results := (aCollection select: [:each| (each difference: criteria) isEmpty ]) asOrderedCollection.
	
	^ results
]

{ #category : #operations }
WRMockMongo >> query: aMongoQuery [
	| results collection |
	results := OrderedCollection new.
	collection := self collectionAt: aMongoQuery qualifiedName.
	results := self privateSelect: aMongoQuery where onCollection: collection.
	^ results
]

{ #category : #operations }
WRMockMongo >> update: origDictionary with: newDictionary collection: aString flags: aFlag [
	| collection |
	collection := self collectionAt: aString.
	
]
