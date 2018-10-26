public
getById: anId
	^ storage at: anId ifAbsent: [ nil ]