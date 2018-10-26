private
classMetadataAnnotationFor: aClass
	^ (WRClassMetadataAnnotation
		collectFrom: aClass theMetaClass
		to: Class) first