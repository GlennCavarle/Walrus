Class {
	#name : #WRMetadataAnnotationLoader,
	#superclass : #Object,
	#category : #'Walrus-Metadata-Loader'
}

{ #category : #public }
WRMetadataAnnotationLoader >> allMappingClasses [
	^ (PragmaCollector filter: [ :pragma | WRClassMetadataAnnotation allPragmaSelectors includes: pragma keyword ]) reset
		collect: [ :each | each methodClass ]
]

{ #category : #public }
WRMetadataAnnotationLoader >> autoloadAllClassMetadata [
	^ self allMappingClasses collect: [ :eachMappingClass | self loadClassMetadataFromMapping: eachMappingClass ]
]

{ #category : #private }
WRMetadataAnnotationLoader >> classMetadataAnnotationFor: aClass [
	^ (WRClassMetadataAnnotation
		collectFrom: aClass theMetaClass
		to: Class) first
]

{ #category : #public }
WRMetadataAnnotationLoader >> loadClassMetadataForClass: aClass [
	^ self loadClassMetadataFromMapping: (self mappingClassFor: aClass)
]

{ #category : #public }
WRMetadataAnnotationLoader >> loadClassMetadataFromMapping: aMappingClass [
	| clsAnnotation propAnnotations clsMetadata |
	clsAnnotation := self classMetadataAnnotationFor: aMappingClass.
	propAnnotations := self propertyMetadataAnnotationsFor: aMappingClass.
	clsMetadata := clsAnnotation metadataOn: aMappingClass.
	propAnnotations do: [ :eachAnnot | clsMetadata addProperty: (eachAnnot metadataOn: aMappingClass) ].
	^ clsMetadata
]

{ #category : #public }
WRMetadataAnnotationLoader >> mappingClassFor: aTargetClass [
	^ ((WRClassMetadataAnnotation collectAllFor: aTargetClass) collect: [ :each | each mappingClass ]) 
			ifEmpty: [ Error signal: ('ClassMatadata annotation not found for class {1}' format: {aTargetClass})] 
			ifNotEmpty:[:col| col first]
]

{ #category : #private }
WRMetadataAnnotationLoader >> propertyMetadataAnnotationsFor: aClass [ 
	^ WRPropertyMetadataAnnotation collectFrom: aClass theMetaClass to: Class
]
