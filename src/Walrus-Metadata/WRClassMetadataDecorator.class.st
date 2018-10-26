Class {
	#name : #WRClassMetadataDecorator,
	#superclass : #Object,
	#instVars : [
		'metadata'
	],
	#category : #'Walrus-Metadata-Util'
}

{ #category : #'as yet unclassified' }
WRClassMetadataDecorator class >> metadata: aClassMetadata [
	^ self new
		metadata: aClassMetadata;
		yourself
]

{ #category : #public }
WRClassMetadataDecorator >> collection: aCollectionName [
	metadata collection: aCollectionName
]

{ #category : #public }
WRClassMetadataDecorator >> constructor: aBlock [ 
	metadata constructorBlock: aBlock
]

{ #category : #public }
WRClassMetadataDecorator >> database: aDbName [
	metadata database: aDbName
]

{ #category : #public }
WRClassMetadataDecorator >> fields: aBlock [
	aBlock value: (WRClassMetadataPropertiesDecorator metadata: metadata)
]

{ #category : #private }
WRClassMetadataDecorator >> metadata: anObject [
	metadata := anObject
]

{ #category : #public }
WRClassMetadataDecorator >> repository: aRepositoryClass [
	metadata repositoryClass: aRepositoryClass
]
