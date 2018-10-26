Class {
	#name : #WRClassMetadataPropertiesDecorator,
	#superclass : #Object,
	#instVars : [
		'metadata'
	],
	#category : #'Walrus-Metadata-Util'
}

{ #category : #'as yet unclassified' }
WRClassMetadataPropertiesDecorator class >> metadata: aClassMetadata [
	^ self new
		metadata: aClassMetadata;
		yourself
]

{ #category : #public }
WRClassMetadataPropertiesDecorator >> embedded: aPropertyName [
	^ metadata addProperty: (WREmbeddedMetadata named: aPropertyName)
]

{ #category : #public }
WRClassMetadataPropertiesDecorator >> embeddedList: aPropertyName [
	^ metadata addProperty: (WREmbeddedListMetadata named: aPropertyName)
]

{ #category : #public }
WRClassMetadataPropertiesDecorator >> identifier: aPropertyName [
	^ metadata addProperty: (WRIdentifierMetadata named: aPropertyName)
]

{ #category : #private }
WRClassMetadataPropertiesDecorator >> metadata: anObject [
	metadata := anObject
]

{ #category : #public }
WRClassMetadataPropertiesDecorator >> property: aPropertyName [
	^ metadata addProperty: (WRPropertyMetadata named: aPropertyName)
]

{ #category : #public }
WRClassMetadataPropertiesDecorator >> toMany: aPropertyName [
	^ metadata addProperty: (WRToManyMetadata named: aPropertyName)
]

{ #category : #public }
WRClassMetadataPropertiesDecorator >> toOne: aPropertyName [
	^ metadata addProperty: (WRToOneMetadata named: aPropertyName)
]
