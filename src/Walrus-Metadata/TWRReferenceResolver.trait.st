Trait {
	#name : #TWRReferenceResolver,
	#category : #'Walrus-Metadata-Util'
}

{ #category : #'serialize/materialize' }
TWRReferenceResolver >> resolveCollection: aUnresolvedCollection [
	self explicitRequirement
]

{ #category : #'serialize/materialize' }
TWRReferenceResolver >> resolveObject: aUnresolvedObject [
	self explicitRequirement
]
