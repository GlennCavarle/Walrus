Class {
	#name : #WRStringTypeMetadata,
	#superclass : #WRPrimitiveTypeMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRStringTypeMetadata >> accept: aVisitor [
	aVisitor visitStringTypeMetadata: self
]
