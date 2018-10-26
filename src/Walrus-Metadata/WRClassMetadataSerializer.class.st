Class {
	#name : #WRClassMetadataSerializer,
	#superclass : #WRMetadataVisitor,
	#category : #'Walrus-Metadata-Visitor'
}

{ #category : #'as yet unclassified' }
WRClassMetadataSerializer class >> serialize: anObject metadata: aClassMetadata [
	^ self new
		object: anObject;
		visit: aClassMetadata;
		jsonData
]

{ #category : #initialization }
WRClassMetadataSerializer >> serialize: anObject [
	^ self 
		serialize: anObject 
		metadata: (metadataFactory classMetadataFor: anObject class name)
]

{ #category : #initialization }
WRClassMetadataSerializer >> serialize: anObject metadata: aClassMetadata [
	|prevObject prevJsonData|
	prevObject := self object.
	prevJsonData := self jsonData.
	
	[
		^ self 
			object: anObject;
			jsonData: Dictionary new;
			visit: aClassMetadata;
			jsonData
	] ensure:[
		self
			object: prevObject;
			jsonData: prevJsonData
	]
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitBooleanTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRClassMetadataSerializer >> visitClassMetadata: aMetadata [
	self jsonData: Dictionary new.
	aMetadata properties do: [ :each | each accept: self ]
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitDateTimeTypeMetadata: aMetadata [
	self jsonData: self object asUTC asString
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitDateTypeMetadata: aMetadata [
	self jsonData: self object yyyymmdd
]

{ #category : #visiting }
WRClassMetadataSerializer >> visitEmbeddedListMetadata: aMetadata [
	| refList itemMetadata result |
	result := aMetadata collectionType asClass new.
	refList := aMetadata readPropertyIn: self object.
	itemMetadata := metadataFactory classMetadataFor: aMetadata type.
	refList ifNotEmpty: [ result := refList collect: [ :each | self serialize: each metadata: itemMetadata] ].
	aMetadata writeFieldValue: result in: self jsonData
]

{ #category : #visiting }
WRClassMetadataSerializer >> visitEmbeddedMetadata: aMetadata [
	| refObject refMetadata refValue|
	refObject := aMetadata readPropertyIn: self object.
	refMetadata := metadataFactory classMetadataFor: aMetadata type.
	refValue := self serialize: refObject metadata: refMetadata.
	aMetadata writeFieldValue: refValue in: self jsonData
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitIDTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitNullTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitNumberTypeMetadata: aMetadata [
	self visitTypeMetadata: aMetadata
]

{ #category : #visiting }
WRClassMetadataSerializer >> visitPropertyMetadata: aMetadata [
	| refValue|
	refValue := aMetadata readPropertyIn: self object.
	aMetadata writeFieldValue: (self serialize: refValue) in: self jsonData
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitStringTypeMetadata: aMetadata [
	self jsonData: self object asString
]

{ #category : #visiting }
WRClassMetadataSerializer >> visitToManyMetadata: aMetadata [
	| refList refMetadata result|
	result := aMetadata collectionType asClass new.
	refList := aMetadata readPropertyIn: self object.
	refList ifNotEmpty:[
		refMetadata := metadataFactory classMetadataFor: aMetadata type.
		result := refList collect:[:each| 
			self serialize: (refMetadata identifierProperty readPropertyIn: each)]].
	
	aMetadata writeFieldValue: result in: self jsonData
]

{ #category : #visiting }
WRClassMetadataSerializer >> visitToOneMetadata: aMetadata [
	| refObject refMetadata refId|
	refId := nil.
	refObject := aMetadata readPropertyIn: self object.
	refObject ifNotNil:[
		refMetadata := metadataFactory classMetadataFor: refObject class.
		refId := self serialize: (refMetadata identifierProperty readPropertyIn: refObject)].
	
	aMetadata writeFieldValue: refId in: self jsonData
]

{ #category : #'visiting types' }
WRClassMetadataSerializer >> visitTypeMetadata: aMetadata [
	self jsonData: self object
]
