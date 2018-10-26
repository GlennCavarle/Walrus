initialization
initializeWithConfig: aMongoConfig
	config := aMongoConfig.
	self initialize.
	self initializeInternalConnection
	