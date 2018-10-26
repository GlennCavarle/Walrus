visiting
visitEmbeddedListMetadata: aMetadata
	| refList itemMetadata result |
	result := aMetadata collectionType asClass new.
	refList := aMetadata readPropertyIn: self object.
	itemMetadata := metadataFactory classMetadataFor: aMetadata type.
	refList ifNotEmpty: [ result := refList collect: [ :each | self serialize: each metadata: itemMetadata] ].
	aMetadata writeFieldValue: result in: self jsonData