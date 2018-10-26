instance creation
config: aMongoConfig
	^ self basicNew
		initializeWithConfig: aMongoConfig;
		yourself