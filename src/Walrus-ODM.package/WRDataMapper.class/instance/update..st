operations
update: anObject
	| rawData criteria|
	criteria := { self idField -> (self idOf: anObject)}.
	rawData := self serialize: anObject.
	connection withConnection: [ :con | 
		self basicUpdateBy: criteria with: rawData connection: con ]