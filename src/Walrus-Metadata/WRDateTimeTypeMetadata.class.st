Class {
	#name : #WRDateTimeTypeMetadata,
	#superclass : #WRMagnitudeTypeMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WRDateTimeTypeMetadata >> accept: aVisitor [
	aVisitor visitDateTimeTypeMetadata: self
]
