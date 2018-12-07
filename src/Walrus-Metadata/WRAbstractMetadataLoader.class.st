Class {
	#name : #WRAbstractMetadataLoader,
	#superclass : #Object,
	#category : #'Walrus-Metadata-Loader'
}

{ #category : #public }
WRAbstractMetadataLoader >> loadClassMetadataForClass: aClass [
	self subclassResponsibility 
]
