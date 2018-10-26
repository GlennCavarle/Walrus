private
basicFetchOneBy: criteria connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection queryOne: [ :q | self buildQuery: q fromCriteria: criteria asDictionary ]