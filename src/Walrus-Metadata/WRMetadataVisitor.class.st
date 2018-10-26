Class {
	#name : #WRMetadataVisitor,
	#superclass : #WRAbstractMetadataVisitor,
	#instVars : [
		'object',
		'jsonData',
		'metadataFactory'
	],
	#category : #'Walrus-Metadata-Visitor'
}

{ #category : #'as yet unclassified' }
WRMetadataVisitor class >> metadataFactory: aMetadataFactory [
	^ self basicNew
		initializeWithMetadataFactory: aMetadataFactory;
		yourself
]

{ #category : #initialization }
WRMetadataVisitor >> initialize [
	super initialize.
	
]

{ #category : #initialization }
WRMetadataVisitor >> initializeWithMetadataFactory: aMetadataFactory [
	metadataFactory := aMetadataFactory.
	self initialize.
]

{ #category : #accessing }
WRMetadataVisitor >> jsonData [
	^ jsonData
]

{ #category : #accessing }
WRMetadataVisitor >> jsonData: anObject [
	jsonData := anObject
]

{ #category : #accessing }
WRMetadataVisitor >> object [
	^ object
]

{ #category : #accessing }
WRMetadataVisitor >> object: anObject [
	object := anObject
]

{ #category : #visiting }
WRMetadataVisitor >> visitClassMetadata: aMetadata [
	aMetadata properties do: [ :each | each accept: self ]
]

{ #category : #visiting }
WRMetadataVisitor >> visitMetadata: aMetadata [
	Transcript crShow: aMetadata name
]
