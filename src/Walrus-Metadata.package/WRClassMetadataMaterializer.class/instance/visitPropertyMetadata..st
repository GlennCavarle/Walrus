visiting
visitPropertyMetadata: aMetadata
	| rawData refMetadata|
	rawData := aMetadata readFieldIn: self jsonData.
	refMetadata := metadataFactory classMetadataFor: aMetadata type.
	
	aMetadata 
		writePropertyValue: (self materialize: rawData metadata: refMetadata) 
		in: self object