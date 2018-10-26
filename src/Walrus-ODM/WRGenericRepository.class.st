Class {
	#name : #WRGenericRepository,
	#superclass : #WRRepository,
	#instVars : [
		'modelClass'
	],
	#category : #'Walrus-ODM-Repository'
}

{ #category : #accessing }
WRGenericRepository class >> model: aModelClass [
	^ self basicNew
		initializeWithModel: aModelClass;
		yourself
]

{ #category : #initialization }
WRGenericRepository >> initializeWithModel: aModelClass [ 
	modelClass := aModelClass.
	self initialize
]

{ #category : #accessing }
WRGenericRepository >> modelClass [
	^ modelClass
]
