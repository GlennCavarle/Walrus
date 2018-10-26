Class {
	#name : #WRConnection,
	#superclass : #Object,
	#instVars : [
		'mongo',
		'config',
		'connection'
	],
	#category : #'Walrus-ODM-Connection'
}

{ #category : #'instance creation' }
WRConnection class >> config: aMongoConfig [
	^ self basicNew
		initializeWithConfig: aMongoConfig;
		yourself
]

{ #category : #operations }
WRConnection >> close [
	self isOpen
		ifTrue: [ connection close ]
]

{ #category : #operations }
WRConnection >> databaseNamed: aDatabaseName [
	^ connection databaseNamed: aDatabaseName
]

{ #category : #initialization }
WRConnection >> initializeInternalConnection [
	connection := Mongo host: config host port: config port
]

{ #category : #initialization }
WRConnection >> initializeWithConfig: aMongoConfig [
	config := aMongoConfig.
	self initialize.
	self initializeInternalConnection
	
]

{ #category : #testing }
WRConnection >> isOpen [
	^ connection isOpen
]

{ #category : #operations }
WRConnection >> open [
	self isOpen
		ifFalse: [ connection open ]
]

{ #category : #public }
WRConnection >> withConnection: aBlock [
	self open.
	aBlock value: self
]
