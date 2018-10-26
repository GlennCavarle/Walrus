Class {
	#name : #WREmbeddedListMetadata,
	#superclass : #WRAbstractListMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #visiting }
WREmbeddedListMetadata >> accept: aVisitor [
	aVisitor visitEmbeddedListMetadata: self
]
