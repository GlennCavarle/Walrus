Class {
	#name : #WRClassMetadataFactory,
	#superclass : #Object,
	#instVars : [
		'loader',
		'cache'
	],
	#category : #'Walrus-Metadata-Util'
}

{ #category : #'instance creation' }
WRClassMetadataFactory class >> withAnnotationLoader [
	^ self basicNew
		initializeWithAnnotationLoader;
		yourself
]

{ #category : #'instance creation' }
WRClassMetadataFactory class >> withClassMethodLoader [
	^ self basicNew
		initializeWithClassMethodLoader;
		yourself
]

{ #category : #initialization }
WRClassMetadataFactory >> classMetadataFor: aClassName [
	^ cache at: aClassName ifAbsentPut: [ loader loadClassMetadataForClass: aClassName ]
]

{ #category : #initialization }
WRClassMetadataFactory >> initialize [
	super initialize.
	cache := Dictionary new.
	self registerDefaultTypes
]

{ #category : #initialization }
WRClassMetadataFactory >> initializeWithAnnotationLoader [
	loader := WRMetadataAnnotationLoader new.
	self initialize
]

{ #category : #initialization }
WRClassMetadataFactory >> initializeWithClassMethodLoader [
	loader := WRMetadataClassMethodLoader new.
	self initialize
]

{ #category : #private }
WRClassMetadataFactory >> registerDefaultTypes [

	String withAllSubclassesDo: [ :each | 
		cache at: each name put: (WRStringTypeMetadata targetClass: each name) ].
	Number withAllSubclassesDo: [ :each | 
		cache at: each name put: (WRNumberTypeMetadata targetClass: each name) ].
	Boolean withAllSubclassesDo: [ :each | 
		cache at: each name put: (WRBooleanTypeMetadata targetClass: each name) ].
	
	cache at: Date name put: (WRDateTypeMetadata targetClass: Date name).
	cache at: DateAndTime name put: (WRDateTimeTypeMetadata targetClass: DateAndTime name).
	cache at: UndefinedObject name put: (WRNullTypeMetadata targetClass: UndefinedObject name).
	cache at: OID name put: (WRIDTypeMetadata targetClass: OID name).
	cache at: UUID name put: (WRIDTypeMetadata targetClass: UUID name)
]
