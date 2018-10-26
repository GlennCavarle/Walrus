visiting
visitToOneMetadata: aMetadata
	| refObject refMetadata refId|
	refId := nil.
	refObject := aMetadata readPropertyIn: self object.
	refObject ifNotNil:[
		refMetadata := metadataFactory classMetadataFor: refObject class.
		refId := self serialize: (refMetadata identifierProperty readPropertyIn: refObject)].
	
	aMetadata writeFieldValue: refId in: self jsonData