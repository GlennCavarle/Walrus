tests
testLazyCollection
	| lazyCollection |
	
	lazyCollection := WRLazyUnresolvedCollection 
		ids: {OID nextOID. OID nextOID } 
		metadata: (WRTestObject walrusMetadata propertyAt:#children).
		
	lazyCollection tryResolveUsing: WRTestObjectResolver new.
	
	self assert: (lazyCollection isKindOf: WRLazyUnresolvedCollection).
	self assert: lazyCollection asArray size = 2.
	self assert: (lazyCollection isKindOf: OrderedCollection ).