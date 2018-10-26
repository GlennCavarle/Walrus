private
newCollectionUsingConnection: con metadata: aClassMetadata
	
	^ MongoCollection
			database: (con databaseNamed: aClassMetadata database) 
			name: aClassMetadata collection