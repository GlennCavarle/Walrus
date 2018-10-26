Class {
	#name : #WRObjectEntry,
	#superclass : #Object,
	#instVars : [
		'object',
		'state',
		'originalValues'
	],
	#category : #'Walrus-ODM-UnitOfWork'
}

{ #category : #'as yet unclassified' }
WRObjectEntry class >> object: anObject state: anObjectState [
	^ self basicNew
		initializeWithObject: anObject state: anObjectState;
		yourself
]

{ #category : #accessing }
WRObjectEntry >> computeOriginalValues [
	| index|
	originalValues := Dictionary new.
	index := object class instSize.
	[index > 0] whileTrue:[
			originalValues at: index put: (object instVarAt: index) copy.
			index := index - 1]
]

{ #category : #accessing }
WRObjectEntry >> identifier [
	^ object id
]

{ #category : #accessing }
WRObjectEntry >> initializeWithObject: anObject state: anObjectState [
	object := anObject.
	state := anObjectState.
	self initialize.
	self computeOriginalValues
]
