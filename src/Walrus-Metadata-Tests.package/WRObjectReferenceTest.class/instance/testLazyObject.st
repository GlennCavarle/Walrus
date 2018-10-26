tests
testLazyObject
	| lazyObject |
	
	lazyObject := WRLazyUnresolvedObject id: OID nextOID metadata: WRTestObject walrusMetadata.
	lazyObject tryResolveUsing: WRTestObjectResolver new.
	
	self assert: (lazyObject isKindOf: WRLazyUnresolvedObject).
	self assert: lazyObject text = WRTestObject example1 text.
	self assert: (lazyObject isKindOf: WRTestObject).