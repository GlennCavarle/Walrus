Class {
	#name : #WRAbstractConnection,
	#superclass : #Object,
	#instVars : [
		'config'
	],
	#category : #'Walrus-ODM-Connection'
}

{ #category : #'instance creation' }
WRAbstractConnection class >> config: aMongoConfig [
	^ self basicNew
		initializeWithConfig: aMongoConfig;
		yourself
]

{ #category : #accessing }
WRAbstractConnection >> config [
	^ config
]

{ #category : #initialization }
WRAbstractConnection >> initializeWithConfig: aMongoConfig [
	config := aMongoConfig.
	self initialize
]

{ #category : #public }
WRAbstractConnection >> withConnection: aBlock [
	self subclassResponsibility 
]
