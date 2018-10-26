Class {
	#name : #WRToManyMetadata,
	#superclass : #WRAbstractListMetadata,
	#instVars : [
		'lazy'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRToManyMetadata >> accept: aVisitor [
	aVisitor visitToManyMetadata: self
]

{ #category : #accessing }
WRToManyMetadata >> beEager [
	lazy := false
]

{ #category : #accessing }
WRToManyMetadata >> beLazy [
	lazy := true
]

{ #category : #accessing }
WRToManyMetadata >> isLazy [
	^ lazy ifNil: [ lazy := false ]
]

{ #category : #accessing }
WRToManyMetadata >> lazy: anObject [
	lazy := anObject
]
