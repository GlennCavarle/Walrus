instance creation
config: aMongoConfig
	
	uniqueInstance ifNotNil: [ self reset ].

	uniqueInstance := self basicNew
		initializeWithConfig: aMongoConfig;
		yourself.
		
	^ uniqueInstance