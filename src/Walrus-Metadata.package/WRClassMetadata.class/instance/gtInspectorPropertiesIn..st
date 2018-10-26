as yet unclassified
gtInspectorPropertiesIn: composite
	<gtInspectorPresentationOrder: 0>  
	
	^(composite list)
		title: ['Properties' translated];		 
		display: [ self properties ]; 
		format: [:each | each printString ]