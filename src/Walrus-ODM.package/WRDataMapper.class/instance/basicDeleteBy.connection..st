private
basicDeleteBy: criteria connection:aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection delete: criteria asDictionary