Class {
	#name : #WRRepositoryTest,
	#superclass : #TestCase,
	#traits : 'TWRTestWithConnection',
	#classTraits : 'TWRTestWithConnection classTrait',
	#category : #'Walrus-ODM-Tests'
}

{ #category : #tests }
WRRepositoryTest >> test [
	|factory metadata connection dbContext|
	factory := WRClassMetadataFactory withAnnotationLoader.
	metadata := factory classMetadataFor: #AKTodo.
	
	connection := self newConnectionPoolMock.
	
	dbContext := WRDbContext
		connection: connection
		metadataFactory: factory.
	
	WRRepository context:dbContext metadata: metadata
]
