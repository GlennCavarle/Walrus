private
basicUpdateBy: criteria with: aNewDictionary connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection replace: criteria asDictionary with: aNewDictionary asDictionary