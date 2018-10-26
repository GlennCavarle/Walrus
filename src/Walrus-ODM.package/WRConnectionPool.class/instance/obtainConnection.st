private
obtainConnection
	"if all connections are used, wait for next"
	currentSize = self maxSize ifTrue: [ ^ self nextConnection ].
	"if connections is empty, pool a new connection"
	connections isEmpty ifTrue:[ self poolNewConnection].
	^ self nextConnection