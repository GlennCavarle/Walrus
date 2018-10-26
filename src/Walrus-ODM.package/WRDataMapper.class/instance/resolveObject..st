serialize/materialize
resolveObject: anUnresolvedObject
	^ (self class
			connection: connection
			metadata: anUnresolvedObject metadata)
		fetchOneById: anUnresolvedObject id