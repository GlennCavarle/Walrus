Class {
	#name : #WRRepositoryITest,
	#superclass : #TestCase,
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

{ #category : #tests }
WRRepositoryITest >> test [
	| repo |
	repo := WRGenericRepository 
		context: self createDbContext 
		modelClass: WRTestObject name.
	
	repo selectAll.
]
