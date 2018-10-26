public
toOne: aPropertyName
	^ metadata addProperty: (WRToOneMetadata named: aPropertyName)