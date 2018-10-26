public
mappingClassFor: aTargetClass
	^ ((WRClassMetadataAnnotation collectAllFor: aTargetClass) collect: [ :each | each mappingClass ]) 
			ifEmpty: [ Error signal: ('ClassMatadata annotation not found for class {1}' format: {aTargetClass})] 
			ifNotEmpty:[:col| col first]