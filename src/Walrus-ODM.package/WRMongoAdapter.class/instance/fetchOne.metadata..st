public
fetchOne: criteria metadata: aClassMetadata

	connectionPool withConnection: [ :con | 
		^ self fetchOne: criteria metadata: aClassMetadata connection: con ]