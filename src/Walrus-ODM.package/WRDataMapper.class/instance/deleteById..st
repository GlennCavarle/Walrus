operations
deleteById: anId
	self deleteBy: {(self idField -> anId)}