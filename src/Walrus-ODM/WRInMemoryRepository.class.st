Class {
	#name : #WRInMemoryRepository,
	#superclass : #WRAbstractRepository,
	#instVars : [
		'collection'
	],
	#category : #'Walrus-ODM-Repository'
}

{ #category : #adding }
WRInMemoryRepository >> add: anObject [
	collection add: anObject
]

{ #category : #initialization }
WRInMemoryRepository >> initialize [
	super initialize.
	collection := OrderedCollection new
]

{ #category : #adding }
WRInMemoryRepository >> remove: anObject [
	collection remove: anObject
]

{ #category : #adding }
WRInMemoryRepository >> removeAll [
	collection removeAll
]

{ #category : #adding }
WRInMemoryRepository >> removeById: anId [
	collection removeAllSuchThat: [ :each | each id = anId ]
]

{ #category : #adding }
WRInMemoryRepository >> selectAll [
	^ collection copy
]

{ #category : #adding }
WRInMemoryRepository >> selectBy: criteria [
	^ collection select: [ :each | 
			criteria associations allSatisfy: [ :assoc | 
				(each instVarNamed: assoc key) = assoc value ] ]
]

{ #category : #adding }
WRInMemoryRepository >> selectById: anId [
	^ (self selectBy: {(#id -> anId)} asDictionary) first
]
