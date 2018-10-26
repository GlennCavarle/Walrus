private
ensurePoolSize
	currentSize >= self minSize ifTrue:[^self].
	(self minSize - currentSize) timesRepeat: [ self poolNewConnection ]