Class {
	#name : #WRRepository,
	#superclass : #Object,
	#instVars : [
		'dataMapper'
	],
	#category : #'Walrus-ODM-Repository'
}

{ #category : #accessing }
WRRepository class >> defaultClassMetadata [
	^ self subclassResponsibility 
]

{ #category : #operations }
WRRepository >> add: anObject [
	^ dataMapper insert: anObject
]

{ #category : #initialization }
WRRepository >> initialize [
	super initialize.
	dataMapper := WRDataMapper for: self defaultClassMetadata
]

{ #category : #accessing }
WRRepository >> modelClass [
	^ dataMapper mappedClass
]

{ #category : #operations }
WRRepository >> remove: anObject [
	^ dataMapper remove: anObject
]

{ #category : #operations }
WRRepository >> selectAll [
	^ dataMapper fetchAll
]

{ #category : #operations }
WRRepository >> selectBy: criteria [
	^ dataMapper fetchOneBy: criteria
]

{ #category : #operations }
WRRepository >> selectById: anId [
	^ dataMapper fetchOneById: anId
]
