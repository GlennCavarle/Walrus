Class {
	#name : #WRDbContext,
	#superclass : #Object,
	#instVars : [
		'metadataFactory',
		'connection'
	],
	#category : #'Walrus-ODM-DataMapper'
}

{ #category : #'instance creation' }
WRDbContext class >> metadataFactory: aMetadataFactory connection: aConnection [
	^ self basicNew
		initializeWithMetadataFactory: aMetadataFactory connection: aConnection;
		yourself
]

{ #category : #public }
WRDbContext >> classMetadataFor: aClassName [
	^ metadataFactory classMetadataFor: aClassName
]

{ #category : #accessing }
WRDbContext >> connection [
	^ connection
]

{ #category : #initialization }
WRDbContext >> initializeWithMetadataFactory: aMetadataFactory connection: aConnection [
	metadataFactory := aMetadataFactory.
	connection := aConnection.
	self initialize
]

{ #category : #accessing }
WRDbContext >> metadataFactory [
	^ metadataFactory
]

{ #category : #public }
WRDbContext >> withConnection: aBlock [
	connection withConnection: aBlock
]
