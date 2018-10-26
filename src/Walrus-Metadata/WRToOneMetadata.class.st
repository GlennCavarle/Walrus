Class {
	#name : #WRToOneMetadata,
	#superclass : #WRPropertyMetadata,
	#instVars : [
		'lazy'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #configuration }
WRToOneMetadata class >> orderPriority [
	^ 10
]

{ #category : #visiting }
WRToOneMetadata >> accept: aVisitor [
	aVisitor visitToOneMetadata: self
]

{ #category : #accessing }
WRToOneMetadata >> beEager [
	lazy := false
]

{ #category : #accessing }
WRToOneMetadata >> beLazy [
	lazy := true
]

{ #category : #accessing }
WRToOneMetadata >> isLazy [
	^ lazy ifNil: [ lazy := false ]
]

{ #category : #accessing }
WRToOneMetadata >> lazy: anObject [
	lazy := anObject
]
