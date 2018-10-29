Class {
	#name : #WRRepository,
	#superclass : #WRGenericRepository,
	#instVars : [
		'modelClass'
	],
	#category : #'Walrus-ODM-Repository'
}

{ #category : #accessing }
WRRepository class >> context: aDbContext [
	^ self basicNew
		initializeWithContext: aDbContext metadata: (aDbContext classMetadataFor: self defaultModelClass);
		yourself
]

{ #category : #accessing }
WRRepository class >> defaultModelClass [
	^ self subclassResponsibility 
]

{ #category : #initialization }
WRRepository >> initializeWithModel: aModelClass [ 
	modelClass := aModelClass.
	self initialize
]

{ #category : #accessing }
WRRepository >> modelClass [
	^ modelClass
]
