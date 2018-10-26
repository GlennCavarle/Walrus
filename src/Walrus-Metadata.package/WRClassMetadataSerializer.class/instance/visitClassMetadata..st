visiting
visitClassMetadata: aMetadata
	self jsonData: Dictionary new.
	aMetadata properties do: [ :each | each accept: self ]