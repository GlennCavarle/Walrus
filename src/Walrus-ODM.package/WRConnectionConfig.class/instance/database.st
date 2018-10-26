accessing
database
	^ database ifNil: [ Error signal: 'connection database must be defined' ]