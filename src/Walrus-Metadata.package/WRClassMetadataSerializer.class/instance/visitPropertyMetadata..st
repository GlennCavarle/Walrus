visiting
visitPropertyMetadata: aMetadata
	| refValue|
	refValue := aMetadata readPropertyIn: self object.
	aMetadata writeFieldValue: (self serialize: refValue) in: self jsonData