Class {
	#name : #WRAbstractMetadata,
	#superclass : #Object,
	#instVars : [
		'origin'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #configuration }
WRAbstractMetadata class >> orderPriority [
	^ 0
]

{ #category : #visiting }
WRAbstractMetadata >> accept: aVisitor [
	self subclassResponsibility 
]

{ #category : #accessing }
WRAbstractMetadata >> origin [
	^ origin
]

{ #category : #accessing }
WRAbstractMetadata >> origin: anObject [
	origin := anObject
]
