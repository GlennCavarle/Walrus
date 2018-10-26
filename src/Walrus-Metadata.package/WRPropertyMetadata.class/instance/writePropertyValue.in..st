write and read
writePropertyValue: aValue in: anObject
	^ anObject instVarNamed: self name put: aValue