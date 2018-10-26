Class {
	#name : #WRBooleanTypeMetadata,
	#superclass : #WRPrimitiveTypeMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRBooleanTypeMetadata >> accept: aVisitor [
	aVisitor visitBooleanTypeMetadata: self
]
