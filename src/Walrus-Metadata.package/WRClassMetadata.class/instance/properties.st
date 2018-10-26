accessing
properties
	^ properties sorted:[:a :b| a class orderPriority > b class orderPriority]