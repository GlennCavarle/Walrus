Class {
	#name : #WRConnectionMock,
	#superclass : #WRConnection,
	#category : #'Walrus-ODM-Tests-Mock'
}

{ #category : #initialization }
WRConnectionMock >> initializeInternalConnection [
	connection := WRMongoMock host: config host port: config port
]
