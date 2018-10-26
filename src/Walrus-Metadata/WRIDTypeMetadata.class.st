Class {
	#name : #WRIDTypeMetadata,
	#superclass : #WRPrimitiveTypeMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRIDTypeMetadata >> accept: aVisitor [
	aVisitor visitIDTypeMetadata: self
]
