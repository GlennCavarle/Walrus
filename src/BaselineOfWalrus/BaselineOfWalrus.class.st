Class {
	#name : #BaselineOfWalrus,
	#superclass : #BaselineOf,
	#category : #BaselineOfWalrus
}

{ #category : #baselines }
BaselineOfWalrus >> baseline: spec [
	<baseline>

	spec for: #common do: [
		
	self mongoTalk: spec.
	
	spec	
		"Base packages"
		package: #'Walrus-Metadata';
		package: #'Walrus-ODM' with: [ spec requires: #(#'Walrus-Metadata' 'MongoTalk') ];
		
		package: #'Walrus-Metadata-Tests' with: [ spec requires: #(#'Walrus-Metadata') ];
		package: #'Walrus-ODM-Tests' with: [ spec requires: #(#'Walrus-ODM') ].
		
	spec 
		group: 'Core' with: #(#'Walrus-ODM');
		group: 'Tests' with: #(#'Walrus-ODM-Tests' #'Walrus-Metadata-Tests');
		group: 'IntegrationTests' with: #(#'Walrus-ODM-ITests');
		group: 'default' with: #('Core')
	
]
]

{ #category : #'external projects' }
BaselineOfWalrus >> mongoTalk: spec [
	spec 
		baseline: 'MongoTalk' 
			with: [ spec repository: 'github://pharo-nosql/mongotalk:1.15/mc' ];
		import: 'MongoTalk'

]
