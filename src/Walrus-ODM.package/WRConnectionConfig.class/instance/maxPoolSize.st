accessing
maxPoolSize
	^ maxPoolSize ifNil: [ maxPoolSize := self class defaultMaxPoolSize ]