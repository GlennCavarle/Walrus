instance creation
host: aHost port: aPort username: aUsername password: aPassword
	^ self config: 
		(WRConnectionConfig
				host: aHost port: aPort  
				username: aUsername password: aPassword)