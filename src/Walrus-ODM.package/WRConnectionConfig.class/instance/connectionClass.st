accessing
connectionClass
	^ connectionClass ifNil: [ connectionClass := self class defaultConnectionClass ]