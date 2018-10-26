Class {
	#name : #WRDateTypeMetadata,
	#superclass : #WRMagnitudeTypeMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRDateTypeMetadata >> accept: aVisitor [
	aVisitor visitDateTypeMetadata: self
]
