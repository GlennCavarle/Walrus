visiting
visitToManyMetadata: aMetadata
	| refList refMetadata result|
	result := aMetadata collectionType asClass new.
	refList := aMetadata readPropertyIn: self object.
	refList ifNotEmpty:[
		refMetadata := metadataFactory classMetadataFor: aMetadata type.
		result := refList collect:[:each| 
			self serialize: (refMetadata identifierProperty readPropertyIn: each)]].
	
	aMetadata writeFieldValue: result in: self jsonData