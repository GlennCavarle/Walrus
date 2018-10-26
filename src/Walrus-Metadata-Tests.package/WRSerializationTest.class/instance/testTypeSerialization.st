tests
testTypeSerialization
	|today now|
	today := Date today.
	now := DateAndTime now.
	WRClassMetadataRegistry reset.
	
	self assert: (self serializeTypeObject: true) = true.
	self assert: (self serializeTypeObject: #aSymbol) = #aSymbol.
	self assert: (self serializeTypeObject: 'aString') = 'aString'.
	self assert: (self serializeTypeObject: 12) = 12.
	self assert: (self serializeTypeObject: nil) = nil.
	self assert: (self serializeTypeObject: today) = today yyyymmdd.
	self assert: (self serializeTypeObject: now) = now asUTC asString