private
privateSelect: criteria onCollection: aCollection
	| results |
	results := OrderedCollection new.
	criteria ifEmpty: [ ^ aCollection asOrderedCollection  ].
	results := (aCollection select: [:each| (each difference: criteria) isEmpty ]) asOrderedCollection.
	
	^ results