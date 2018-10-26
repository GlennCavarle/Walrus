initialization
initializeDefaultMetadata
	
	String withAllSubclassesDo: [ :each | 
		self registerMetadata: (WRStringTypeMetadata targetClass: each name) ].
	
	Number withAllSubclassesDo: [ :each | 
		self registerMetadata: (WRNumberTypeMetadata targetClass: each name) ].
	
	Boolean withAllSubclassesDo: [ :each | 
		self registerMetadata: (WRBooleanTypeMetadata targetClass: each name) ].
	
	self registerMetadata: (WRDateTypeMetadata targetClass: Date name).
	self registerMetadata: (WRDateTimeTypeMetadata targetClass: DateAndTime name).
	self registerMetadata: (WRNullTypeMetadata targetClass: UndefinedObject name).
	self registerMetadata: (WRIDTypeMetadata targetClass: OID name)