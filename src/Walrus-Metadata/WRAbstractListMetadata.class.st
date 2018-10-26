Class {
	#name : #WRAbstractListMetadata,
	#superclass : #WRPropertyMetadata,
	#instVars : [
		'listOf',
		'collectonType'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #configuration }
WRAbstractListMetadata class >> orderPriority [
	^ 5
]

{ #category : #visiting }
WRAbstractListMetadata >> accept: aVisitor [
	aVisitor visitListMetadata: self
]

{ #category : #accessing }
WRAbstractListMetadata >> collectionType [
	^ collectonType ifNil: [ collectonType := #OrderedCollection ]
]

{ #category : #accessing }
WRAbstractListMetadata >> collectionType: aCollectionType [
	collectonType := aCollectionType
]

{ #category : #printing }
WRAbstractListMetadata >> printOn: aStream [
	aStream
		
		nextPutAll: self class name;
		nextPut: $<;
		nextPutAll: self name asSymbol;
		nextPutAll: ' : ';
		nextPutAll: self type asSymbol;
		nextPutAll: '[]';
		nextPut: $>
]
