Class {
	#name : #WRPropertyMetadata,
	#superclass : #WRAbstractMetadata,
	#instVars : [
		'owner',
		'name',
		'type',
		'field'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #'instance creation' }
WRPropertyMetadata class >> named: aPropertyName [
	^ self new
		name: aPropertyName;
		yourself
]

{ #category : #'instance creation' }
WRPropertyMetadata class >> named: aPropertyName type: aTypeName [
	^ self new
		name: aPropertyName;
		type: aTypeName;
		yourself
]

{ #category : #configuration }
WRPropertyMetadata class >> orderPriority [
	^ 15
]

{ #category : #visiting }
WRPropertyMetadata >> accept: aVisitor [
	aVisitor visitPropertyMetadata: self
]

{ #category : #accessing }
WRPropertyMetadata >> field [
	^ field ifNil: [ self name ]
]

{ #category : #accessing }
WRPropertyMetadata >> field: aString [
	field := aString asSymbol
]

{ #category : #testing }
WRPropertyMetadata >> isIdentifier [
	^ false
]

{ #category : #accessing }
WRPropertyMetadata >> name [
	^ name
]

{ #category : #accessing }
WRPropertyMetadata >> name: aString [
	name := aString asSymbol
]

{ #category : #accessing }
WRPropertyMetadata >> owner [
	^ owner
]

{ #category : #accessing }
WRPropertyMetadata >> owner: anObject [
	owner := anObject
]

{ #category : #printing }
WRPropertyMetadata >> printOn: aStream [
	aStream
		
		nextPutAll: self class name;
		nextPut: $<;
		nextPutAll: self name asSymbol;
		nextPutAll: ' : ';
		nextPutAll: self type asSymbol;
		nextPut: $>
]

{ #category : #'write and read' }
WRPropertyMetadata >> readFieldIn: aDictionary [
	^ aDictionary at: self field
]

{ #category : #'write and read' }
WRPropertyMetadata >> readPropertyIn: anObject [
	^ anObject instVarNamed: self name
]

{ #category : #accessing }
WRPropertyMetadata >> type [
	^ type
]

{ #category : #accessing }
WRPropertyMetadata >> type: anObject [
	type := anObject asString asSymbol
]

{ #category : #'write and read' }
WRPropertyMetadata >> writeFieldValue: aValue in: aDictionary [
	^ aDictionary at: self field put: aValue
]

{ #category : #'write and read' }
WRPropertyMetadata >> writePropertyValue: aValue in: anObject [
	^ anObject instVarNamed: self name put: aValue
]
