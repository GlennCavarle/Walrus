visiting
visitToOneMetadata: aMetadata
	| ref refId |
	ref := nil.
	refId := aMetadata readFieldIn: self jsonData.
	refId ifNotNil: [ ref := self newUnresolvedReference: refId metadata: aMetadata lazy: aMetadata isLazy].
	
	aMetadata writePropertyValue: ref in: self object