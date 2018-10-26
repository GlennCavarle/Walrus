operations
open
	self isOpen
		ifFalse: [ connection open ]