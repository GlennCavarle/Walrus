public
delete: criteria metadata: aClassMetadata

	connectionPool withConnection: [ :con | 
		^ self delete: criteria metadata: aClassMetadata connection: con ]