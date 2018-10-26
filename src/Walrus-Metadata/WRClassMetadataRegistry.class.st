Class {
	#name : #WRClassMetadataRegistry,
	#superclass : #Object,
	#instVars : [
		'registredMetadata'
	],
	#classVars : [
		'uniqueInstance'
	],
	#category : #'Walrus-Metadata-Util'
}

{ #category : #'instance creation' }
WRClassMetadataRegistry class >> new [
	^ self shouldNotImplement
]

{ #category : #accessing }
WRClassMetadataRegistry class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
WRClassMetadataRegistry class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #initialization }
WRClassMetadataRegistry >> initialize [
	super initialize.
	registredMetadata := Dictionary new.
	self initializeDefaultMetadata
]

{ #category : #initialization }
WRClassMetadataRegistry >> initializeDefaultMetadata [
	
	String withAllSubclassesDo: [ :each | 
		self registerMetadata: (WRStringTypeMetadata targetClass: each name) ].
	
	Number withAllSubclassesDo: [ :each | 
		self registerMetadata: (WRNumberTypeMetadata targetClass: each name) ].
	
	Boolean withAllSubclassesDo: [ :each | 
		self registerMetadata: (WRBooleanTypeMetadata targetClass: each name) ].
	
	self registerMetadata: (WRDateTypeMetadata targetClass: Date name).
	self registerMetadata: (WRDateTimeTypeMetadata targetClass: DateAndTime name).
	self registerMetadata: (WRNullTypeMetadata targetClass: UndefinedObject name).
	self registerMetadata: (WRIDTypeMetadata targetClass: OID name)
]

{ #category : #'as yet unclassified' }
WRClassMetadataRegistry >> metadataForClass: aClass [
	| key |
	key := aClass asString asSymbol.
	^ registredMetadata at: key
]

{ #category : #'as yet unclassified' }
WRClassMetadataRegistry >> registerMetadata: aClassMetadata [
	registredMetadata at: aClassMetadata targetClass put: aClassMetadata
]
