instance creation
uniqueInstance
	^ uniqueInstance ifNil: [ self local ]