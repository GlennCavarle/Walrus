accessing
port
	^ port ifNil: [ Error signal: 'connection port must be defined' ]