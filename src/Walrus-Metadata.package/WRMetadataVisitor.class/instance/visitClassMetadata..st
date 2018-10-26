visiting
visitClassMetadata: aMetadata
	aMetadata properties do: [ :each | each accept: self ]