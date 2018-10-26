Class {
	#name : #WRIdentifierMetadata,
	#superclass : #WRPropertyMetadata,
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #configuration }
WRIdentifierMetadata class >> orderPriority [
	^ 20
]

{ #category : #visiting }
WRIdentifierMetadata >> accept: aVisitor [
	aVisitor visitIdentifierMetadata: self
]

{ #category : #initialization }
WRIdentifierMetadata >> initialize [
	super initialize.
	type := #OID
]

{ #category : #testing }
WRIdentifierMetadata >> isIdentifier [
	^ true
]
