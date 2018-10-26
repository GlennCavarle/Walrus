Class {
	#name : #WRNumberTypeMetadata,
	#superclass : #WRPrimitiveTypeMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRNumberTypeMetadata >> accept: aVisitor [
	aVisitor visitNumberTypeMetadata: self
]
