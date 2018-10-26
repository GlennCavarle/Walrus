visiting
visitClassMetadata: aMetadata
	self object: (self newInstance: aMetadata).
	aMetadata properties do: [ :each | each accept: self ]