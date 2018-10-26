Class {
	#name : #WRAnnotation,
	#superclass : #Object,
	#instVars : [
		'pragma'
	],
	#category : #'Walrus-Metadata-Annotation'
}

{ #category : #'as yet unclassified' }
WRAnnotation class >> allPragmaSelectors [
	^ {self pragmaSelector} , (self allSubclasses collect: [ :each | each pragmaSelector ])
]

{ #category : #'as yet unclassified' }
WRAnnotation class >> collectFrom: startClass to: endClass [
	^ (Pragma allNamed: self pragmaSelector from: startClass to: endClass)
		collect: [ :each | self fromPragma: each ]
]

{ #category : #'instance creation' }
WRAnnotation class >> fromPragma: aPragma [
	^ self new
		pragma: aPragma;
		yourself
]

{ #category : #'as yet unclassified' }
WRAnnotation class >> pragmaSelector [
	^ #walrus
]

{ #category : #accessing }
WRAnnotation >> mappingClass [
	^ pragma methodClass
]

{ #category : #accessing }
WRAnnotation >> metadata [
	^ pragma 	method valueWithReceiver: self mappingClass arguments: #()
]

{ #category : #accessing }
WRAnnotation >> metadataOn: aClass [
	^ (pragma method valueWithReceiver: aClass arguments: #()) origin: pragma methodClass baseClass name
]

{ #category : #accessing }
WRAnnotation >> pragma [
	^ pragma
]

{ #category : #accessing }
WRAnnotation >> pragma: anObject [
	pragma := anObject
]
