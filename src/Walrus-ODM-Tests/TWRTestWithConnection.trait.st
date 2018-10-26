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
				connectionClass: WRConnectionMock;
				maxPoolSize: aNumber;
				yourself)
]
