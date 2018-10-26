accessing
computeOriginalValues
	| index|
	originalValues := Dictionary new.
	index := object class instSize.
	[index > 0] whileTrue:[
			originalValues at: index put: (object instVarAt: index) copy.
			index := index - 1]