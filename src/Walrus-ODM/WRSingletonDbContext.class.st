Class {
	#name : #WRSingletonDbContext,
	#superclass : #WRDbContext,
	#classVars : [
		'uniqueInstance'
	],
	#category : #'Walrus-ODM-DataMapper'
}

{ #category : #'instance creation' }
WRSingletonDbContext class >> metadataFactory: aMetadataFactory connection: aConnection [
	uniqueInstance ifNotNil: [ self reset ].
	^ uniqueInstance := super metadataFactory: aMetadataFactory connection: aConnection
]

{ #category : #'instance creation' }
WRSingletonDbContext class >> reset [
	uniqueInstance flush.
	uniqueInstance := nil
]

{ #category : #'instance creation' }
WRSingletonDbContext class >> uniqueInstance [
	^ uniqueInstance ifNil: [ Error signal: 'DbContext must be configured before being used' ]
]

{ #category : #accessing }
WRSingletonDbContext >> flush [
	connection flush.
]
