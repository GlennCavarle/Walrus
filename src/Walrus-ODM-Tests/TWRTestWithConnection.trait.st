Trait {
	#name : #TWRTestWithConnection,
	#category : #'Walrus-ODM-Tests'
}

{ #category : #mock }
TWRTestWithConnection >> newConnectionPoolMock [
	^ self newConnectionPoolMockWithSize: 10
]

{ #category : #mock }
TWRTestWithConnection >> newConnectionPoolMockWithSize: aNumber [
	^ WRConnectionPool config:
			(WRConnectionConfig local
				connectionClass: WRMockConnection;
				maxPoolSize: aNumber;
				yourself)
]

{ #category : #tests }
TWRTestWithConnection >> newDbContext [
	^ WRDbContext 
		metadataFactory: WRClassMetadataFactory withAnnotationLoader 
		connection: self newConnectionPoolMock
]
