Class {
	#name : #WRClassMetadataAnnotation,
	#superclass : #WRAnnotation,
	#category : #'Walrus-Metadata-Annotation'
}

{ #category : #'pragma helpers' }
WRClassMetadataAnnotation class >> collectAllFor: aTargetClass [
	^ PragmaCollector new 
		filter: [ :eachPragma | 
			eachPragma keyword = self pragmaSelector and: [eachPragma arguments first = aTargetClass asString asSymbol ] ];
		reset;
		collect: [ :each| self fromPragma: each ]
]

{ #category : #'pragma helpers' }
WRClassMetadataAnnotation class >> pragmaSelector [
	^ #walrusClassMetadataFor:
]

{ #category : #accessing }
WRClassMetadataAnnotation >> metadataOn: aClass [
	^ (super metadataOn: aClass)
		targetClass: self targetClassName;
		yourself
]

{ #category : #accessing }
WRClassMetadataAnnotation >> targetClassName [
	^ pragma arguments first
]
