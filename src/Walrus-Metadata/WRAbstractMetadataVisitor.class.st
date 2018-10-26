Class {
	#name : #WRAbstractMetadataVisitor,
	#superclass : #Object,
	#category : #'Walrus-Metadata-Visitor'
}

{ #category : #visiting }
WRAbstractMetadataVisitor >> visit: aMetadata [
	aMetadata accept: self
]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitBooleanTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitClassMetadata: aMetadata [
	self visitMetadata: aMetadata
]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitDateTimeTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitDateTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitEmbeddedListMetadata: aMetadata [
	self visitListMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitEmbeddedMetadata: aMetadata [
	self visitPropertyMetadata: aMetadata
]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitIDTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitIdentifierMetadata: aMetadata [
	self visitPropertyMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitListMetadata: aMetadata [
	self visitPropertyMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitMetadata: aMetadata [

]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitNullTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitNumberTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitPropertyMetadata: aMetadata [
	self visitMetadata: aMetadata
]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitStringTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitToManyMetadata: aMetadata [
	self visitListMetadata: aMetadata
]

{ #category : #visiting }
WRAbstractMetadataVisitor >> visitToOneMetadata: aMetadata [
	self visitPropertyMetadata: aMetadata
]

{ #category : #'visiting types' }
WRAbstractMetadataVisitor >> visitTypeMetadata: aMetadata [
	
]
