initialization
initialize
	super initialize.
	connections := SharedQueue new.
	currentSize := 0.
	minSize := self config minPoolSize.
	maxSize := self config maxPoolSize.
	self ensurePoolSize