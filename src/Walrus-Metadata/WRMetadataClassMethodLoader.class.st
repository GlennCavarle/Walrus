Class {
	#name : #WRMetadataClassMethodLoader,
	#superclass : #WRAbstractMetadataLoader,
	#category : #'Walrus-Metadata-Loader'
}

{ #category : #public }
WRMetadataClassMethodLoader >> loadClassMetadataForClass: aClass [
	^ aClass walrusMetadata
]
