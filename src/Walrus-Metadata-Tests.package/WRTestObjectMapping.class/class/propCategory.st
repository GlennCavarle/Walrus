accessing
propCategory
	<walrusPropertyMetadata>
	
	^ (WRToOneMetadata named: #category)
			type: #WRTestCategory;
			beLazy;
			yourself