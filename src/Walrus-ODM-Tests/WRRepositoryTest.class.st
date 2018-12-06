Class {
	#name : #WRRepositoryTest,
	#superclass : #TestCase,
	#traits : 'TWRTestWithConnection',
	#classTraits : 'TWRTestWithConnection classTrait',
	#category : #'Walrus-ODM-Tests'
}

{ #category : #mock }
WRRepositoryTest >> newConnectionPoolMockWithSize: aNumber [
	^ WRConnectionPool config:
			(WRConnectionConfig local
				connectionClass: WRMockConnection;
				maxPoolSize: aNumber;
				yourself)
]

{ #category : #tests }
WRRepositoryTest >> test [
	| dbContext |
	dbContext := self newDbContext.
	WRGenericRepository context: dbContext modelClass: WRTestObject name
]
