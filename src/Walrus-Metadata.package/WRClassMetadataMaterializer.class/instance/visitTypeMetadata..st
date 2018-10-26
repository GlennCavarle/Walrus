visiting types
visitTypeMetadata: aMetadata
	self object: (self jsonData as: (Smalltalk at: aMetadata type))