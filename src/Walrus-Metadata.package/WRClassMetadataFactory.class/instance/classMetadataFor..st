initialization
classMetadataFor: aClassName
	^ cache at: aClassName ifAbsentPut: [ loader loadClassMetadataForClass: aClassName ]