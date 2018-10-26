instance creation
for: aClass
	^ self basicNew
		initializeWithMappedClass: aClass;
		yourself