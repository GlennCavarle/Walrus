initialization
serialize: anObject metadata: aClassMetadata
	|prevObject prevJsonData|
	prevObject := self object.
	prevJsonData := self jsonData.
	
	[
		^ self 
			object: anObject;
			jsonData: Dictionary new;
			visit: aClassMetadata;
			jsonData
	] ensure:[
		self
			object: prevObject;
			jsonData: prevJsonData
	]