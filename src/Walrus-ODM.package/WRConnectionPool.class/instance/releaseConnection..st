private
releaseConnection: aConnection
	"do not return to pool after flush"
	currentSize isZero ifTrue: [ ^ self unpoolConnection: aConnection ].
	"do not return to pool if maxSize changed"
	connections size >= self maxSize ifTrue: [ ^ self unpoolConnection: aConnection ].
	"otherwise, return to pool"
	connections nextPutIfMissing: aConnection