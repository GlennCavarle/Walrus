private
basicFetchBy: criteria connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection query: [ :q | self buildQuery: q fromCriteria: criteria asDictionary ]