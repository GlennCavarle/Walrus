as yet unclassified
allPragmaSelectors
	^ {self pragmaSelector} , (self allSubclasses collect: [ :each | each pragmaSelector ])