private
basicInsert: aDictionary connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection add: aDictionary asDictionary