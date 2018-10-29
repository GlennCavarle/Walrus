Class {
	#name : #WRConnection,
	#superclass : #WRAbstractConnection,
	#instVars : [
		'mongo',
		'connection'
	],
	#category : #'Walrus-ODM-Connection'
}

{ #category : #operations }
WRConnection >> close [
	self isOpen
		ifTrue: [ connection close ]
]

{ #category : #operations }
WRConnection >> databaseNamed: aDatabaseName [
	^ connection databaseNamed: aDatabaseName
]

{ #category : #private }
WRConnection >> flush [
	self close.
]

{ #category : #initialization }
WRConnection >> initialize [
	super initialize.
	self initializeInternalConnection
]

{ #category : #initialization }
WRConnection >> initializeInternalConnection [
	connection := Mongo host: config host port: config port
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
