Class {
	#name : #WRTestObjectResolver,
	#superclass : #Object,
	#traits : 'TWRReferenceResolver',
	#classTraits : 'TWRReferenceResolver classTrait',
	#category : #'Walrus-Metadata-Tests'
}

{ #category : #'serialize/materialize' }
WRTestObjectResolver >> resolveCollection: aUnresolvedCollection [
	^ {
		WRTestObject example1.
		WRTestObject example1
	}
]

{ #category : #'serialize/materialize' }
WRTestObjectResolver >> resolveObject: aUnresolvedObject [
	^ WRTestObject example1 
]
