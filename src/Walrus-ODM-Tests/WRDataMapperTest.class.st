Class {
	#name : #WRDataMapperTest,
	#superclass : #TestCase,
	#traits : 'TWRTestWithConnection',
	#classTraits : 'TWRTestWithConnection classTrait',
	#instVars : [
		'listenerSocket'
	],
	#category : #'Walrus-ODM-Tests'
}

{ #category : #mock }
WRDataMapperTest >> newConnectionPoolMockWithSize: aNumber [
	^ WRConnectionPool config:
			(WRConnectionConfig local
				connectionClass: WRMockConnection;
				maxPoolSize: aNumber;
				yourself)
]

{ #category : #tests }
WRDataMapperTest >> test [
	|dbContext dataMapper|
	
	dbContext := self newDbContext.
	dataMapper := WRDataMapper context: dbContext mappedClass: WRTestObject name. 
	
	dataMapper insert: WRTestObject example1.
	dataMapper fetchAll.
	
	dataMapper update: WRTestObject example1.
]
