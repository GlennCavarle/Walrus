as yet unclassified
collectFrom: startClass to: endClass
	^ (Pragma allNamed: self pragmaSelector from: startClass to: endClass)
		collect: [ :each | self fromPragma: each ]