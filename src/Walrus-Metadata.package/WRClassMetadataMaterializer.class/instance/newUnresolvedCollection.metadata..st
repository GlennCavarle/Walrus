private
newUnresolvedCollection: aCollection metadata: aClassMetadata
	| theCollectionClass itemMetadata |
	theCollectionClass := aClassMetadata isLazy
		ifTrue: [ WRLazyUnresolvedCollection ]
		ifFalse: [ WRUnresolvedCollection ].
		itemMetadata := metadataFactory classMetadataFor: aClassMetadata type.
		
	^ unresolvedReferences add: (theCollectionClass type: aClassMetadata collectionType ids: aCollection metadata: itemMetadata)