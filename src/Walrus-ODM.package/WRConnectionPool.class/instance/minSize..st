accessing
minSize: aNumber
	aNumber > self maxSize
		ifTrue: [ Error signal: 'min pool size must be lower or equal to max pool size' ].
		
	minSize := aNumber.
	self ensurePoolSize