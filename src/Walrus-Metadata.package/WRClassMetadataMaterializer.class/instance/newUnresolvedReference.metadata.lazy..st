private
newUnresolvedReference: anId metadata: aClassMetadata lazy: isLazy
	| theClass |
	theClass := isLazy ifTrue: [ WRLazyUnresolvedObject ] ifFalse: [ WRUnresolvedObject ].
	^ unresolvedReferences add: (theClass id: anId metadata: aClassMetadata)