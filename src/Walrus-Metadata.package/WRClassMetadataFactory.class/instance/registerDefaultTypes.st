private
registerDefaultTypes

	String withAllSubclassesDo: [ :each | 
		cache at: each name put: (WRStringTypeMetadata targetClass: each name) ].
	Number withAllSubclassesDo: [ :each | 
		cache at: each name put: (WRNumberTypeMetadata targetClass: each name) ].
	Boolean withAllSubclassesDo: [ :each | 
		cache at: each name put: (WRBooleanTypeMetadata targetClass: each name) ].
	
	cache at: Date name put: (WRDateTypeMetadata targetClass: Date name).
	cache at: DateAndTime name put: (WRDateTimeTypeMetadata targetClass: DateAndTime name).
	cache at: UndefinedObject name put: (WRNullTypeMetadata targetClass: UndefinedObject name).
	cache at: OID name put: (WRIDTypeMetadata targetClass: OID name)