instance creation
connection: aCon metadata: aClassMetadata
	^ self basicNew
		initializeWithConnection: aCon metadata: aClassMetadata;
		yourself