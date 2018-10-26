accessing
addProperty: aPropertyMetadata
	aPropertyMetadata isIdentifier
		ifTrue: [ identifier := aPropertyMetadata name ].
	aPropertyMetadata owner: self.
	^ properties at: aPropertyMetadata name put: aPropertyMetadata