serialize/materialize
materialize: rawData
	| m result |
	m := self newMaterializer.
	result := m materialize: rawData metadata: self classMetadata.
	m unresolvedReferences do:[:each| each tryResolveUsing: self].
	^ result