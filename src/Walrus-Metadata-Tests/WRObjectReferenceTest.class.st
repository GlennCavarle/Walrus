Class {
	#name : #WRObjectReferenceTest,
	#superclass : #TestCase,
	#category : #'Walrus-Metadata-Tests'
}

{ #category : #tests }
WRObjectReferenceTest >> testLazyCollection [
	| lazyCollection |
	
	lazyCollection := WRLazyUnresolvedCollection 
		ids: {OID nextOID. OID nextOID } 
		metadata: (WRTestObject walrusMetadata propertyAt:#children).
		
	lazyCollection tryResolveUsing: WRTestObjectResolver new.
	
	self assert: (lazyCollection isKindOf: WRLazyUnresolvedCollection).
	self assert: lazyCollection asArray size = 2.
	self assert: (lazyCollection isKindOf: OrderedCollection ).
]

{ #category : #tests }
WRObjectReferenceTest >> testLazyObject [
	| lazyObject |
	
	lazyObject := WRLazyUnresolvedObject id: OID nextOID metadata: WRTestObject walrusMetadata.
	lazyObject tryResolveUsing: WRTestObjectResolver new.
	
	self assert: (lazyObject isKindOf: WRLazyUnresolvedObject).
	self assert: lazyObject text = WRTestObject example1 text.
	self assert: (lazyObject isKindOf: WRTestObject).
]
