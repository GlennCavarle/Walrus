visiting
visitEmbeddedMetadata: aMetadata
	| refObject refMetadata refValue|
	refObject := aMetadata readPropertyIn: self object.
	refMetadata := metadataFactory classMetadataFor: aMetadata type.
	refValue := self serialize: refObject metadata: refMetadata.
	aMetadata writeFieldValue: refValue in: self jsonData