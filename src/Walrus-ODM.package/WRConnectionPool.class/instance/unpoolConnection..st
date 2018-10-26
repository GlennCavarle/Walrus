private
unpoolConnection: aConnection
	aConnection close.
	currentSize := currentSize - 1