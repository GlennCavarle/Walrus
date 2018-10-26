public
allMappingClasses
	^ (PragmaCollector filter: [ :pragma | WRClassMetadataAnnotation allPragmaSelectors includes: pragma keyword ]) reset
		collect: [ :each | each methodClass ]