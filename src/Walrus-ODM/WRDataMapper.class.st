Class {
	#name : #WRDataMapper,
	#superclass : #Object,
	#traits : 'TWRReferenceResolver',
	#classTraits : 'TWRReferenceResolver classTrait',
	#instVars : [
		'context',
		'classMetadata'
	],
	#category : #'Walrus-ODM-DataMapper'
}

{ #category : #'instance creation' }
WRDataMapper class >> context: aDbContext mappedClass: aClassName [
	^ self context: aDbContext metadata: (aDbContext classMetadataFor: aClassName)
]

{ #category : #'instance creation' }
WRDataMapper class >> context: aDbContext metadata: aClassMetadata [
	^ self basicNew
		initializeWithContext: aDbContext metadata: aClassMetadata;
		yourself
]

{ #category : #'instance creation' }
WRDataMapper class >> new [
	^ self shouldNotImplement
]

{ #category : #private }
WRDataMapper >> basicDeleteBy: criteria connection:aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection delete: criteria asDictionary
]

{ #category : #private }
WRDataMapper >> basicFetchBy: criteria connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection query: [ :q | self buildQuery: q fromCriteria: criteria asDictionary ]
]

{ #category : #private }
WRDataMapper >> basicFetchByIds: aCollectionOfIds connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection query: [ :q | 
		q where: (MQQueryBuilder queryFor:[:mq| (mq fieldNamed: #_id) in: aCollectionOfIds]).
	]
]

{ #category : #private }
WRDataMapper >> basicFetchOneBy: criteria connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection queryOne: [ :q | self buildQuery: q fromCriteria: criteria asDictionary ]
]

{ #category : #private }
WRDataMapper >> basicInsert: aDictionary connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection add: aDictionary asDictionary
]

{ #category : #private }
WRDataMapper >> basicUpdateBy: criteria with: aNewDictionary connection: aConnection [
	| collection |
	collection := self newCollectionUsingConnection: aConnection.
	^ collection replace: criteria asDictionary with: aNewDictionary asDictionary
]

{ #category : #private }
WRDataMapper >> buildQuery: query fromCriteria: criteria [
	^ query
		where: criteria;
		yourself
]

{ #category : #accessing }
WRDataMapper >> classMetadata [
	^ classMetadata
]

{ #category : #operations }
WRDataMapper >> delete: anObject [
	self deleteById: (self idOf: anObject)
]

{ #category : #operations }
WRDataMapper >> deleteBy: criteria [
	
	context withConnection: [ :con | 
		self basicDeleteBy: criteria connection: con ]
]

{ #category : #operations }
WRDataMapper >> deleteById: anId [
	self deleteBy: {(self idField -> anId)}
]

{ #category : #operations }
WRDataMapper >> fetchAll [
	^ self fetchBy: {}
]

{ #category : #operations }
WRDataMapper >> fetchBy: criteria [
	| resultSet |
	resultSet := OrderedCollection new.
	
	context withConnection: [ :con | 
		resultSet := self basicFetchBy: criteria connection: con ].
	
	^ self materializeCollection: resultSet
]

{ #category : #operations }
WRDataMapper >> fetchByIds: aCollectionOfIds [
	| resultSet |
	resultSet := {}.
	context withConnection: [ :con | 
		resultSet := self basicFetchByIds: aCollectionOfIds connection: con ].
	^ self materializeCollection: resultSet
]

{ #category : #operations }
WRDataMapper >> fetchOneBy: criteria [
	| result |
	result := nil.
	
	context withConnection: [ :con | 
		result := self basicFetchOneBy: criteria connection: con ].
	
	^ self materialize: result
]

{ #category : #operations }
WRDataMapper >> fetchOneById: anId [
	^ self fetchOneBy: {(self idField -> anId)}
]

{ #category : #accessing }
WRDataMapper >> idField [
	^ #_id
]

{ #category : #accessing }
WRDataMapper >> idOf: anObject [
	^ anObject instVarNamed: self classMetadata identifier
]

{ #category : #initialization }
WRDataMapper >> initialize [
	super initialize.
]

{ #category : #initialization }
WRDataMapper >> initializeWithContext: aDbContext metadata: aClassMetadata [
	context := aDbContext.
	classMetadata := aClassMetadata.
	self initialize
]

{ #category : #operations }
WRDataMapper >> insert: anObject [
	| rawData |
	rawData := self serialize: anObject.
	context withConnection: [ :con | 
		self basicInsert: rawData connection: con ]
]

{ #category : #accessing }
WRDataMapper >> mappedClass [
	^ classMetadata targetClass
]

{ #category : #'serialize/materialize' }
WRDataMapper >> materialize: rawData [
	| m result |
	m := self newMaterializer.
	result := m materialize: rawData metadata: self classMetadata.
	m unresolvedReferences do:[:each| each tryResolveUsing: self].
	^ result
]

{ #category : #'serialize/materialize' }
WRDataMapper >> materializeCollection: rawDataCollection [
	^ rawDataCollection collect: [ :eachRawData | self materialize: eachRawData ]
]

{ #category : #private }
WRDataMapper >> newCollectionUsingConnection: con [
	
	^ MongoCollection
			database: (con databaseNamed: self classMetadata database) 
			name: self classMetadata collection
]

{ #category : #'serialize/materialize' }
WRDataMapper >> newMaterializer [
	^ WRClassMetadataMaterializer metadataFactory: context metadataFactory
]

{ #category : #'serialize/materialize' }
WRDataMapper >> newSerializer [
	^ WRClassMetadataSerializer metadataFactory: context metadataFactory
]

{ #category : #operations }
WRDataMapper >> refresh: anObject [
	| refreshedObject |
	refreshedObject := self fetchOneById: (self idOf: anObject).
	anObject becomeForward: refreshedObject copyHash: false
]

{ #category : #'serialize/materialize' }
WRDataMapper >> resolveCollection: anUnresolvedCollection [
	^ (self class
			context: context
			metadata: anUnresolvedCollection metadata)
		fetchByIds: anUnresolvedCollection ids
]

{ #category : #'serialize/materialize' }
WRDataMapper >> resolveObject: anUnresolvedObject [
	^ (self class
			context: context
			metadata: anUnresolvedObject metadata)
		fetchOneById: anUnresolvedObject id
]

{ #category : #operations }
WRDataMapper >> save: anObject [
	
]

{ #category : #'serialize/materialize' }
WRDataMapper >> serialize: anObject [
	^ self newSerializer serialize: anObject metadata: self classMetadata
]

{ #category : #'serialize/materialize' }
WRDataMapper >> serializeCollection: anObjectCollection [

	^ anObjectCollection
		collect: [ :eachObject | self serialize: eachObject ]
		as: OrderedCollection
]

{ #category : #operations }
WRDataMapper >> update: anObject [
	| rawData criteria|
	criteria := { self idField -> (self idOf: anObject)}.
	rawData := self serialize: anObject.
	context withConnection: [ :con | 
		self basicUpdateBy: criteria with: rawData connection: con ]
]
