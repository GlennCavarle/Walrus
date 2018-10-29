Class {
	#name : #WRConnectionPool,
	#superclass : #WRAbstractConnection,
	#instVars : [
		'connections',
		'minSize',
		'maxSize',
		'currentSize'
	],
	#classVars : [
		'uniqueInstance'
	],
	#category : #'Walrus-ODM-Connection'
}

{ #category : #'instance creation' }
WRConnectionPool class >> config: aMongoConfig [
	
	uniqueInstance ifNotNil: [ self reset ].

	uniqueInstance := self basicNew
		initializeWithConfig: aMongoConfig;
		yourself.
		
	^ uniqueInstance
]

{ #category : #'instance creation' }
WRConnectionPool class >> host: aHost port: aPort [ 
	^ self host: aHost port: aPort username: nil password: nil
]

{ #category : #'instance creation' }
WRConnectionPool class >> host: aHost port: aPort username: aUsername password: aPassword [
	^ self config: 
		(WRConnectionConfig
				host: aHost port: aPort  
				username: aUsername password: aPassword)
]

{ #category : #'instance creation' }
WRConnectionPool class >> local [
	^ self config: WRConnectionConfig local
]

{ #category : #'instance creation' }
WRConnectionPool class >> reset [
	uniqueInstance flush.
	uniqueInstance := nil
]

{ #category : #'instance creation' }
WRConnectionPool class >> uniqueInstance [
	^ uniqueInstance ifNil: [ self local ]
]

{ #category : #accessing }
WRConnectionPool >> currentSize [
	^ currentSize
]

{ #category : #private }
WRConnectionPool >> ensurePoolSize [
	currentSize >= self minSize ifTrue:[^self].
	(self minSize - currentSize) timesRepeat: [ self poolNewConnection ]
]

{ #category : #private }
WRConnectionPool >> flush [
	[ connections isEmpty ]
		whileFalse: [ self unpoolConnection: connections next ]
]

{ #category : #initialization }
WRConnectionPool >> initialize [
	super initialize.
	connections := SharedQueue new.
	currentSize := 0.
	minSize := self config minPoolSize.
	maxSize := self config maxPoolSize.
	self ensurePoolSize
]

{ #category : #accessing }
WRConnectionPool >> maxSize [
	^ maxSize
]

{ #category : #accessing }
WRConnectionPool >> maxSize: aNumber [
	aNumber < self minSize
		ifTrue: [ Error signal: 'max pool size must be greater or equal to min pool size' ].
	maxSize := aNumber
]

{ #category : #accessing }
WRConnectionPool >> minSize [
	^ minSize
]

{ #category : #accessing }
WRConnectionPool >> minSize: aNumber [
	aNumber > self maxSize
		ifTrue: [ Error signal: 'min pool size must be lower or equal to max pool size' ].
		
	minSize := aNumber.
	self ensurePoolSize
]

{ #category : #private }
WRConnectionPool >> newConnection [
	^ (config connectionClass config: config) open
]

{ #category : #private }
WRConnectionPool >> nextConnection [
	| con |
	con := connections next.
	con open.
	^ con
]

{ #category : #private }
WRConnectionPool >> obtainConnection [
	"if all connections are used, wait for next"
	currentSize = self maxSize ifTrue: [ ^ self nextConnection ].
	"if connections is empty, pool a new connection"
	connections isEmpty ifTrue:[ self poolNewConnection].
	^ self nextConnection
]

{ #category : #private }
WRConnectionPool >> poolNewConnection [
	connections nextPut: self newConnection.
	currentSize := currentSize + 1
]

{ #category : #private }
WRConnectionPool >> releaseConnection: aConnection [
	"do not return to pool after flush"
	currentSize isZero ifTrue: [ ^ self unpoolConnection: aConnection ].
	"do not return to pool if maxSize changed"
	connections size >= self maxSize ifTrue: [ ^ self unpoolConnection: aConnection ].
	"otherwise, return to pool"
	connections nextPutIfMissing: aConnection
]

{ #category : #private }
WRConnectionPool >> unpoolConnection: aConnection [
	aConnection close.
	currentSize := currentSize - 1
]

{ #category : #public }
WRConnectionPool >> withConnection: aBlock [
	| con |
	con := self obtainConnection.
	[ aBlock value: con ]
		ensure: [ self releaseConnection: con ]
]
