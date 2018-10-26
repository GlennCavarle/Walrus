accessing
maxSize: aNumber
	aNumber < self minSize
		ifTrue: [ Error signal: 'max pool size must be greater or equal to min pool size' ].
	maxSize := aNumber