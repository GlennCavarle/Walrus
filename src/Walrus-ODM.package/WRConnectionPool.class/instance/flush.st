private
flush
	[ connections isEmpty ]
		whileFalse: [ self unpoolConnection: connections next ]