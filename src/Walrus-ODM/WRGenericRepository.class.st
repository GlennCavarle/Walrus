Class {
	#name : #WRGenericRepository,
	#superclass : #Object,
	#instVars : [
		'dataMapper'
	],
	#category : #'Walrus-ODM-Repository'
}

{ #category : #'instance creation' }
WRGenericRepository class >> context: aDbContext metadata: aClassMetadata [
	^ self basicNew
		initializeWithContext: aDbContext metadata: aClassMetadata;
		yourself
]

{ #category : #'instance creation' }
WRGenericRepository class >> context: aDbContext modelClass: aClassName [
	^ self context: aDbContext metadata: (aDbContext classMetadataFor: aClassName)
]

{ #category : #operations }
WRGenericRepository >> add: anObject [
	^ dataMapper insert: anObject
]

{ #category : #initialization }
WRGenericRepository >> initialize [
	super initialize
]

{ #category : #initialization }
WRGenericRepository >> initializeWithContext: aDbContext metadata: aClassMetadata [
	dataMapper := WRDataMapper context: aDbContext metadata: aClassMetadata.
	self initialize
]

{ #category : #accessing }
WRGenericRepository >> modelClass [
	^ dataMapper mappedClass
]

{ #category : #operations }
WRGenericRepository >> remove: anObject [
	^ dataMapper remove: anObject
]

{ #category : #operations }
WRGenericRepository >> selectAll [
	^ dataMapper fetchAll
]

{ #category : #operations }
WRGenericRepository >> selectBy: criteria [
	^ dataMapper fetchOneBy: criteria
]

{ #category : #operations }
WRGenericRepository >> selectById: anId [
	^ dataMapper fetchOneById: anId
]
