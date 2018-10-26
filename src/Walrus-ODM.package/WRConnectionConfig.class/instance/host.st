accessing
host
	^ host  ifNil: [ Error signal: 'connection host must be defined' ]