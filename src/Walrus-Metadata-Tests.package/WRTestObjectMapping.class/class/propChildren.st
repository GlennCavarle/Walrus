accessing
propChildren
	<walrusPropertyMetadata>
	
	^ (WRToManyMetadata named: #children)
			type: #WRTestChildObject;
			yourself