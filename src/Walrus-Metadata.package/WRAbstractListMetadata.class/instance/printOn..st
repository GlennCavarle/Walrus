printing
printOn: aStream
	aStream
		
		nextPutAll: self class name;
		nextPut: $<;
		nextPutAll: self name asSymbol;
		nextPutAll: ' : ';
		nextPutAll: self type asSymbol;
		nextPutAll: '[]';
		nextPut: $>