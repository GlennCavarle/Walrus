Class {
	#name : #WREmbeddedMetadata,
	#superclass : #WRPropertyMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WREmbeddedMetadata >> accept: aVisitor [
	aVisitor visitEmbeddedMetadata: self
]
