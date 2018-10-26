private
poolNewConnection
	connections nextPut: self newConnection.
	currentSize := currentSize + 1