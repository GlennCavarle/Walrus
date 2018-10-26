public
loadClassMetadataFromMapping: aMappingClass
	| clsAnnotation propAnnotations clsMetadata |
	clsAnnotation := self classMetadataAnnotationFor: aMappingClass.
	propAnnotations := self propertyMetadataAnnotationsFor: aMappingClass.
	clsMetadata := clsAnnotation metadataOn: aMappingClass.
	propAnnotations do: [ :eachAnnot | clsMetadata addProperty: (eachAnnot metadataOn: aMappingClass) ].
	^ clsMetadata