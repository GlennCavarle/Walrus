private
newCollectionUsingConnection: con
	
	^ MongoCollection
			database: (con databaseNamed: self classMetadata database) 
			name: self classMetadata collection