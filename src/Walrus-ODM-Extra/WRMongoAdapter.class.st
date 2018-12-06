Class {
	#name : #WRMongoAdapter,
	#superclass : #WRAdapter,
	#instVars : [
		'connectionPool'
	],
	#category : #'Walrus-ODM-Extra-Adapter'
}

{ #category : #private }
WRMongoAdapter >> buildQuery: query fromCriteria: criteria [
	^ query
		where: criteria;
		yourself
]

{ #category : #public }
WRMongoAdapter >> delete: criteria metadata: aClassMetadata [

	connectionPool withConnection: [ :con | 
		^ self delete: criteria metadata: aClassMetadata connection: con ]
]

{ #category : #private }
WRMongoAdapter >> delete: criteria metadata: aClassMetadata connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection metadata: aClassMetadata.
	^ collection delete: criteria
]

{ #category : #public }
WRMongoAdapter >> fetchAll: criteria metadata: aClassMetadata [

	connectionPool withConnection: [ :con | 
		^ self fetchAll: criteria metadata: aClassMetadata connection: con ]
]

{ #category : #private }
WRMongoAdapter >> fetchAll: criteria metadata: aClassMetadata connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection metadata: aClassMetadata.
	^ collection query: [ :q | self buildQuery: q fromCriteria: criteria ]
]

{ #category : #public }
WRMongoAdapter >> fetchOne: criteria metadata: aClassMetadata [

	connectionPool withConnection: [ :con | 
		^ self fetchOne: criteria metadata: aClassMetadata connection: con ]
]

{ #category : #private }
WRMongoAdapter >> fetchOne: criteria metadata: aClassMetadata connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection metadata: aClassMetadata.
	^ collection queryOne: [ :q | self buildQuery: q fromCriteria: criteria ]
]

{ #category : #initialization }
WRMongoAdapter >> initialize [
	super initialize.
	connectionPool := self class defaultConnectionPool
]

{ #category : #private }
WRMongoAdapter >> newCollectionUsingConnection: con metadata: aClassMetadata [
	
	^ MongoCollection
			database: (con databaseNamed: aClassMetadata database) 
			name: aClassMetadata collection
]
