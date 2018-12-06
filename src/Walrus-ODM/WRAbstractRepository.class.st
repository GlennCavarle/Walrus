Class {
	#name : #WRAbstractRepository,
	#superclass : #Object,
	#category : #'Walrus-ODM-Repository'
}

{ #category : #adding }
WRAbstractRepository >> add: anObject [
	self subclassResponsibility 
]

{ #category : #adding }
WRAbstractRepository >> remove: anObject [
	self subclassResponsibility 
]

{ #category : #adding }
WRAbstractRepository >> removeAll [
	self subclassResponsibility 
]

{ #category : #adding }
WRAbstractRepository >> removeById: anId [
	self subclassResponsibility 
]

{ #category : #adding }
WRAbstractRepository >> selectAll [
	self subclassResponsibility 
]

{ #category : #adding }
WRAbstractRepository >> selectBy: criteria [
	self subclassResponsibility 
]

{ #category : #adding }
WRAbstractRepository >> selectById: anId [
	self subclassResponsibility 
]
