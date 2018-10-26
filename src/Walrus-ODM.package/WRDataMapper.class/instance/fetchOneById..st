operations
fetchOneById: anId
	^ self fetchOneBy: {(self idField -> anId)}