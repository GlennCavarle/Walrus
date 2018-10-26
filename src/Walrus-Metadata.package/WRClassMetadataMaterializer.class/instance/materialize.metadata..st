initialization
materialize: aJsonData metadata: aClassMetadata
	| prevJsonData prevObject|
	prevJsonData := self jsonData.
	prevObject := self object.
	
	[
		self 
			object: nil;
			jsonData: aJsonData;
			visit: aClassMetadata.
		^ self object 
	] ensure:[
		self
			object: prevObject;
			jsonData: prevJsonData
	]