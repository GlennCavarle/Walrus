Class {
	#name : #WRAdapter,
	#superclass : #Object,
	#category : #'Walrus-ODM-Extra-Adapter'
}

{ #category : #'as yet unclassified' }
WRAdapter class >> defaultConnectionPool [
	^ WRConnectionPool uniqueInstance
]

{ #category : #public }
WRAdapter >> fetchAll: criteria metadata: aClassMetadata [
	
]

{ #category : #public }
WRAdapter >> fetchOne: criteria metadata: aClassMetadata [
	
]
