visiting
visitEmbeddedMetadata: aMetadata
	| rawData embeddedObject |
	embeddedObject := nil.
	rawData := aMetadata readFieldIn: self jsonData.
	rawData ifNotNil: [ embeddedObject := self materialize: rawData metadata: aMetadata].
	
	aMetadata writePropertyValue: embeddedObject in: self object