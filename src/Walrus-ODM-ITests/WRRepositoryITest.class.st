Class {
	#name : #WRRepositoryITest,
	#superclass : #TestCase,
	#instVars : [
		'repository'
	],
	#category : #'Walrus-ODM-ITests'
}

{ #category : #tests }
WRRepositoryITest >> createDbContext [
	^ WRDbContext 
		metadataFactory: WRClassMetadataFactory withAnnotationLoader 
		connection: (self newConnectionPoolWithSize: 10)
]

{ #category : #mock }
WRRepositoryITest >> newConnectionPoolWithSize: aNumber [
	^ WRConnectionPool config:
			(WRConnectionConfig local
				maxPoolSize: aNumber;
				yourself)
]

{ #category : #running }
WRRepositoryITest >> setUp [
	repository := WRGenericRepository 
		context: self createDbContext 
		modelClass: WRTestObject name.
]

{ #category : #tests }
WRRepositoryITest >> test [
	
	repository add: WRTestObject example1.
	self assert: repository selectAll size equals: 1.
]
