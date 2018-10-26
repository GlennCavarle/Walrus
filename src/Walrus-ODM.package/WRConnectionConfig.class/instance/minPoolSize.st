accessing
minPoolSize
	^ minPoolSize ifNil: [ minPoolSize := self class defaultMinPoolSize ]