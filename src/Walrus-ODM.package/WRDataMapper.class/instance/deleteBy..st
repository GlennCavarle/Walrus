operations
deleteBy: criteria
	
	connection withConnection: [ :con | 
		self basicDeleteBy: criteria connection: con ]