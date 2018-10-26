serialize/materialize
resolveCollection: anUnresolvedCollection
	^ (self class
			connection: connection
			metadata: anUnresolvedCollection metadata)
		fetchByIds: anUnresolvedCollection ids