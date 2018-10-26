public
fetchAll: criteria metadata: aClassMetadata

	connectionPool withConnection: [ :con | 
		^ self fetchAll: criteria metadata: aClassMetadata connection: con ]