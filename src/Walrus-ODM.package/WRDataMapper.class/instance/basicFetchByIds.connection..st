private
basicFetchByIds: aCollectionOfIds connection: aConnection
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection query: [ :q | 
		q where: (MQQueryBuilder queryFor:[:mq| (mq fieldNamed: #_id) in: aCollectionOfIds]).
	]