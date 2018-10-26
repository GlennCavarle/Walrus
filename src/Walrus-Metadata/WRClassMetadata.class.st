Class {
	#name : #WRClassMetadata,
	#superclass : #WRAbstractMetadata,
	#instVars : [
		'collection',
		'database',
		'targetClass',
		'repositoryClass',
		'constructorBlock',
		'identifier',
		'properties'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #'instance creation' }
WRClassMetadata class >> for: aClassName [
	^ self new
		targetClass: aClassName;
		yourself
]

{ #category : #'as yet unclassified' }
WRClassMetadata class >> for: aClassName build: aBuildBlock [
	| metadata |
	metadata := self for: aClassName.
	aBuildBlock value: (WRClassMetadataDecorator metadata: metadata).
	^ metadata
]

{ #category : #visiting }
WRClassMetadata >> accept: aVisitor [
	aVisitor visitClassMetadata: self
]

{ #category : #accessing }
WRClassMetadata >> addProperty: aPropertyMetadata [
	aPropertyMetadata isIdentifier
		ifTrue: [ identifier := aPropertyMetadata name ].
	aPropertyMetadata owner: self.
	^ properties at: aPropertyMetadata name put: aPropertyMetadata
]

{ #category : #accessing }
WRClassMetadata >> collection [
	^ collection
]

{ #category : #accessing }
WRClassMetadata >> collection: anObject [
	collection := anObject asSymbol
]

{ #category : #accessing }
WRClassMetadata >> constructorBlock [
	^ constructorBlock ifNil: [ constructorBlock := [ :cls :data | cls new ] ]
]

{ #category : #accessing }
WRClassMetadata >> constructorBlock: anObject [
	constructorBlock := anObject
]

{ #category : #accessing }
WRClassMetadata >> database [
	^ database
]

{ #category : #accessing }
WRClassMetadata >> database: anObject [
	database := anObject asSymbol
]

{ #category : #'as yet unclassified' }
WRClassMetadata >> gtInspectorPropertiesIn: composite [
	<gtInspectorPresentationOrder: 0>  
	
	^(composite list)
		title: ['Properties' translated];		 
		display: [ self properties ]; 
		format: [:each | each printString ]
]

{ #category : #accessing }
WRClassMetadata >> identifier [
	^ identifier
]

{ #category : #accessing }
WRClassMetadata >> identifierProperty [
	^ self propertyAt: identifier
]

{ #category : #initialization }
WRClassMetadata >> initialize [
	super initialize.
	properties := Dictionary new
]

{ #category : #printing }
WRClassMetadata >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $<;
		nextPutAll: self targetClass;
		nextPut: $>
]

{ #category : #accessing }
WRClassMetadata >> properties [
	^ properties sorted:[:a :b| a class orderPriority > b class orderPriority]
]

{ #category : #accessing }
WRClassMetadata >> propertyAt: aPropertyName [
	^ properties at: aPropertyName
]

{ #category : #accessing }
WRClassMetadata >> repositoryClass [
	^ repositoryClass
]

{ #category : #accessing }
WRClassMetadata >> repositoryClass: anObject [
	repositoryClass := anObject asString asSymbol
]

{ #category : #accessing }
WRClassMetadata >> targetClass [
	^ targetClass
]

{ #category : #accessing }
WRClassMetadata >> targetClass: anObject [
	targetClass := anObject asString asSymbol
]
