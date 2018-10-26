public
toMany: aPropertyName
	^ metadata addProperty: (WRToManyMetadata named: aPropertyName)