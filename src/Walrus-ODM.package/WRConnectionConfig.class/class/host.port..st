instance creation
host: aHost port: aPort
	^ self 
		host: aHost
		port: aPort
		username: nil
		password: nil
		database: nil