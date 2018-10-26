operations
insert: anObject
	| rawData |
	rawData := self serialize: anObject.
	connection withConnection: [ :con | 
		self basicInsert: rawData connection: con ]