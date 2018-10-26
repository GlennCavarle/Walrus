Class {
	#name : #WRAnnotationMapping,
	#superclass : #Object,
	#category : #'Walrus-Metadata-Annotation'
}

{ #category : #'as yet unclassified' }
WRAnnotationMapping class >> createMetadata [
	^ WRMetadataAnnotationLoader new metadataFromMappingClass: self
]
