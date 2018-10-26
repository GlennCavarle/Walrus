accessing
metadataOn: aClass
	^ (super metadataOn: aClass)
		targetClass: self targetClassName;
		yourself