examples
example1
	^ self new
		id: OID nextOID;
		text: 'hello text';
		tags:#(#test #hello);
		category: WRTestChildObject example1;
		children:{
			WRTestChildObject example1.
			WRTestChildObject example1.
		}.