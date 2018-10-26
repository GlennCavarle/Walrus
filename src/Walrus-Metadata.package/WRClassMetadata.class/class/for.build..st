as yet unclassified
for: aClassName build: aBuildBlock
	| metadata |
	metadata := self for: aClassName.
	aBuildBlock value: (WRClassMetadataDecorator metadata: metadata).
	^ metadata