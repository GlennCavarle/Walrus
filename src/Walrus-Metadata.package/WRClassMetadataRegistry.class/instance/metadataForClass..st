as yet unclassified
metadataForClass: aClass
	| key |
	key := aClass asString asSymbol.
	^ registredMetadata at: key