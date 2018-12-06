Class {
	#name : #WRObjectStorage,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'Walrus-ODM-Extra-UnitOfWork'
}

{ #category : #adding }
WRObjectStorage >> add: anObjectEntry [
	data at: anObjectEntry identifier put: anObjectEntry
]

{ #category : #adding }
WRObjectStorage >> clear [
	data removeAll
]

{ #category : #adding }
WRObjectStorage >> do: aBlock [
	data valuesDo: aBlock
]

{ #category : #initialization }
WRObjectStorage >> initialize [
	super initialize.
	data := Dictionary new
]
