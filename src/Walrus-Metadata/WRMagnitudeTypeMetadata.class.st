Class {
	#name : #WRMagnitudeTypeMetadata,
	#superclass : #WRPrimitiveTypeMetadata,
	#instVars : [
		'pattern'
	],
	#category : #'Walrus-Metadata-Metadata'
}

{ #category : #accessing }
WRMagnitudeTypeMetadata >> pattern [
	^ pattern ifNil:[pattern := 'yyyy-mm-ddThh:mm:ss+ZZ:zz:z']
]

{ #category : #accessing }
WRMagnitudeTypeMetadata >> pattern: anObject [
	pattern := anObject
]
