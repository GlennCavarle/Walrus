Class {
	#name : #WRMockConnection,
	#superclass : #WRConnection,
	#category : #'Walrus-ODM-Testing'
}

{ #category : #initialization }
WRMockConnection >> initializeInternalConnection [
	connection := WRMockMongo host: config host port: config port
]
