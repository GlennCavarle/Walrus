public
autoloadAllClassMetadata
	^ self allMappingClasses collect: [ :eachMappingClass | self loadClassMetadataFromMapping: eachMappingClass ]