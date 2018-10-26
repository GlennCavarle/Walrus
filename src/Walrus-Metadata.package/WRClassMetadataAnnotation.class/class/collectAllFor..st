as yet unclassified
collectAllFor: aTargetClass
	^ PragmaCollector new 
		filter: [ :eachPragma | 
			eachPragma keyword = self pragmaSelector and: [eachPragma arguments first = aTargetClass asString asSymbol ] ];
		reset;
		collect: [ :each| self fromPragma: each ]