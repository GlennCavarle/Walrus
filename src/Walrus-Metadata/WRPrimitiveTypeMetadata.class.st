Class {
	#name : #WRPrimitiveTypeMetadata,
	#superclass : #WRAbstractMetadata,
	#instVars : [
		'targetClass'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #'accessing structure variables' }
WRPrimitiveTypeMetadata class >> targetClass: aTypeName [
	^ self new targetClass: aTypeName
]

{ #category : #visiting }
WRPrimitiveTypeMetadata >> accept: aVisitor [
	aVisitor visitTypeMetadata: self
]

{ #category : #accessing }
WRPrimitiveTypeMetadata >> targetClass [
	^ targetClass
]

{ #category : #accessing }
WRPrimitiveTypeMetadata >> targetClass: anObject [
	targetClass := anObject asString asSymbol
]

{ #category : #accessing }
WRPrimitiveTypeMetadata >> type [
	^ self targetClass
]
