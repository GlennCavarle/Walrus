accessing
isLazy
	^ lazy ifNil: [ lazy := false ]