Class {
	#name : #WRNullTypeMetadata,
	#superclass : #WRPrimitiveTypeMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRNullTypeMetadata >> accept: aVisitor [
	aVisitor visitNullTypeMetadata: self
]
