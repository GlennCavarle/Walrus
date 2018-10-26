Class {
	#name : #WRClassMetadataMaterializer,
	#superclass : #WRMetadataVisitor,
	#instVars : [
		'unresolvedReferences',
		'targetClass'
	],
	#category : #'Walrus-Metadata-Visitor'
}

{ #category : #initialization }
WRClassMetadataMaterializer >> initialize [
	super initialize.
	unresolvedReferences := OrderedCollection new
]

{ #category : #initialization }
WRClassMetadataMaterializer >> materialize: aJsonData metadata: aClassMetadata [
	| prevJsonData prevObject|
	prevJsonData := self jsonData.
	prevObject := self object.
	
	[
		self 
			object: nil;
			jsonData: aJsonData;
			visit: aClassMetadata.
		^ self object 
	] ensure:[
		self
			object: prevObject;
			jsonData: prevJsonData
	]
]

{ #category : #private }
WRClassMetadataMaterializer >> newCollection: aClassName [
	^ (Smalltalk at: aClassName) new
]

{ #category : #private }
WRClassMetadataMaterializer >> newInstance: aClassMetadata [
	^ aClassMetadata constructorBlock 
		value: (Smalltalk at: aClassMetadata targetClass)
		value: self jsonData
]

{ #category : #private }
WRClassMetadataMaterializer >> newUnresolvedCollection: aCollection metadata: aClassMetadata [
	| theCollectionClass itemMetadata |
	theCollectionClass := aClassMetadata isLazy
		ifTrue: [ WRLazyUnresolvedCollection ]
		ifFalse: [ WRUnresolvedCollection ].
		itemMetadata := metadataFactory classMetadataFor: aClassMetadata type.
		
	^ unresolvedReferences add: (theCollectionClass type: aClassMetadata collectionType ids: aCollection metadata: itemMetadata)
]

{ #category : #private }
WRClassMetadataMaterializer >> newUnresolvedReference: anId metadata: aClassMetadata lazy: isLazy [
	| theClass |
	theClass := isLazy ifTrue: [ WRLazyUnresolvedObject ] ifFalse: [ WRUnresolvedObject ].
	^ unresolvedReferences add: (theClass id: anId metadata: aClassMetadata)
]

{ #category : #accessing }
WRClassMetadataMaterializer >> unresolvedReferences [
	^ unresolvedReferences
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitBooleanTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRClassMetadataMaterializer >> visitClassMetadata: aMetadata [
	self object: (self newInstance: aMetadata).
	aMetadata properties do: [ :each | each accept: self ]
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitDateTimeTypeMetadata: aMetadata [
	self object: (DateAndTime fromString: self jsonData)
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitDateTypeMetadata: aMetadata [
	self object: (Date fromString: self jsonData)
]

{ #category : #visiting }
WRClassMetadataMaterializer >> visitEmbeddedListMetadata: aMetadata [
	| rawList itemMetadata resultSet|
	resultSet := self newCollection: aMetadata collectionType.
	rawList := aMetadata readFieldIn: self jsonData.
	rawList ifNotEmpty:[
		itemMetadata := metadataFactory classMetadataFor: aMetadata type.
		resultSet := rawList collect:[:each| self materialize: each metadata: itemMetadata]].
	
	aMetadata writePropertyValue: resultSet in: self object
]

{ #category : #visiting }
WRClassMetadataMaterializer >> visitEmbeddedMetadata: aMetadata [
	| rawData embeddedObject |
	embeddedObject := nil.
	rawData := aMetadata readFieldIn: self jsonData.
	rawData ifNotNil: [ embeddedObject := self materialize: rawData metadata: aMetadata].
	
	aMetadata writePropertyValue: embeddedObject in: self object
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitIDTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitNullTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitNumberTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRClassMetadataMaterializer >> visitPropertyMetadata: aMetadata [
	| rawData refMetadata|
	rawData := aMetadata readFieldIn: self jsonData.
	refMetadata := metadataFactory classMetadataFor: aMetadata type.
	
	aMetadata 
		writePropertyValue: (self materialize: rawData metadata: refMetadata) 
		in: self object
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitStringTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRClassMetadataMaterializer >> visitToManyMetadata: aMetadata [
	| rawList resultSet|
	resultSet := self newCollection: aMetadata type.
	rawList := aMetadata readFieldIn: self jsonData.
	rawList ifNotEmpty:[
		resultSet := self newUnresolvedCollection:rawList metadata: aMetadata].
	
	aMetadata writePropertyValue: resultSet in: self object
]

{ #category : #visiting }
WRClassMetadataMaterializer >> visitToOneMetadata: aMetadata [
	| ref refId |
	ref := nil.
	refId := aMetadata readFieldIn: self jsonData.
	refId ifNotNil: [ ref := self newUnresolvedReference: refId metadata: aMetadata lazy: aMetadata isLazy].
	
	aMetadata writePropertyValue: ref in: self object
]

{ #category : #'visiting types' }
WRClassMetadataMaterializer >> visitTypeMetadata: aMetadata [
	self object: (self jsonData as: (Smalltalk at: aMetadata type))
]
