Class {
	#name : #WRUnitOfWork,
	#superclass : #Object,
	#instVars : [
		'dataMapper',
		'storage'
	],
	#category : #'Walrus-ODM-UnitOfWork'
}

{ #category : #public }
WRUnitOfWork >> clearChanges [
	storage clear
]

{ #category : #public }
WRUnitOfWork >> commitChanges [
	storage do:[:state :obj| 
		 
	]
]

{ #category : #public }
WRUnitOfWork >> fetchById: anId [
	| anObject |
	anObject := dataMapper fetchById: anId.
	self registerClean: anObject.
	^ anObject
]

{ #category : #public }
WRUnitOfWork >> getById: anId [
	^ storage at: anId ifAbsent: [ nil ]
]

{ #category : #initialization }
WRUnitOfWork >> initialize [
	super initialize.
	storage := Dictionary new.
]

{ #category : #public }
WRUnitOfWork >> registerForDelete: anObject [
	self registerObject: anObject state: WRObjectStateDeleted
]

{ #category : #public }
WRUnitOfWork >> registerForInsert: anObject [
	self registerObject: anObject state: WRObjectStateAdded
]

{ #category : #public }
WRUnitOfWork >> registerForSync: anObject [
	self registerObject: anObject state: WRObjectStateManaged
]

{ #category : #public }
WRUnitOfWork >> registerForUpdate: anObject [
	self registerObject: anObject state: WRObjectStateModified
]

{ #category : #private }
WRUnitOfWork >> registerObject: anObject state: aState [
	storage add: (WRObjectEntry object: anObject state: aState)
]

{ #category : #public }
WRUnitOfWork >> rollbackChanges [
]
