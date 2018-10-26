instance creation
host: aHost port: aPort database: aDbName
	^ self
			host: aHost
			port: aPort
			username: nil
			password: nil
			database: aDbName