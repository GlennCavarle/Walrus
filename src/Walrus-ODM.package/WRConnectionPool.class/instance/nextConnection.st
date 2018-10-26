private
nextConnection
	| con |
	con := connections next.
	con open.
	^ con