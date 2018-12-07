Class {
	#name : #WRConnectionConfig,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'username',
		'password',
		'database',
		'connectionClass',
		'maxPoolSize',
		'minPoolSize'
	],
	#category : #'Walrus-ODM-Connection'
}

{ #category : #configuration }
WRConnectionConfig class >> defaultConnectionClass [
	^ WRConnection
]

{ #category : #configuration }
WRConnectionConfig class >> defaultMaxPoolSize [
	^ 10
]

{ #category : #configuration }
WRConnectionConfig class >> defaultMinPoolSize [
	^ 0
]

{ #category : #'instance creation' }
WRConnectionConfig class >> host: aHost port: aPort [
	^ self 
		host: aHost
		port: aPort
		username: nil
		password: nil
		database: nil
]

{ #category : #'instance creation' }
WRConnectionConfig class >> host: aHost port: aPort database: aDbName [
	^ self
			host: aHost
			port: aPort
			username: nil
			password: nil
			database: aDbName
]

{ #category : #'instance creation' }
WRConnectionConfig class >> host: aHost port: aPort username: aUsername password: aPassword [
	^ self
		host: aHost
		port: aPort
		username: aUsername
		password: aPassword
		database: nil
]

{ #category : #'instance creation' }
WRConnectionConfig class >> host: aHost port: aPort username: aUsername password: aPassword database: aDbName [
	^ super new
			host: aHost
			port: aPort
			username: aUsername
			password: aPassword
			database: aDbName;
		yourself
]

{ #category : #'instance creation' }
WRConnectionConfig class >> local [
	^ self  host: 'localhost' port: 27017
]

{ #category : #accessing }
WRConnectionConfig >> connectionClass [
	^ connectionClass ifNil: [ connectionClass := self class defaultConnectionClass ]
]

{ #category : #accessing }
WRConnectionConfig >> connectionClass: anObject [
	connectionClass := anObject
]

{ #category : #accessing }
WRConnectionConfig >> database [
	^ database ifNil: [ Error signal: 'connection database must be defined' ]
]

{ #category : #accessing }
WRConnectionConfig >> database: aDbName [
	database := aDbName
]

{ #category : #accessing }
WRConnectionConfig >> host [
	^ host  ifNil: [ Error signal: 'connection host must be defined' ]
]

{ #category : #accessing }
WRConnectionConfig >> host: anHost port: aPort [
	host := anHost.
	port := aPort
	
]

{ #category : #private }
WRConnectionConfig >> host: aHost port: aPort username: aUsername password: aPassword database: aDbName [
	host := aHost.
	port := aPort.
	username := aUsername.
	password := aPassword.
	database := aDbName
]

{ #category : #accessing }
WRConnectionConfig >> maxPoolSize [
	^ maxPoolSize ifNil: [ maxPoolSize := self class defaultMaxPoolSize ]
]

{ #category : #accessing }
WRConnectionConfig >> maxPoolSize: anInteger [
	maxPoolSize := anInteger
]

{ #category : #accessing }
WRConnectionConfig >> minPoolSize [
	^ minPoolSize ifNil: [ minPoolSize := self class defaultMinPoolSize ]
]

{ #category : #accessing }
WRConnectionConfig >> minPoolSize: anInteger [
	minPoolSize := anInteger
]

{ #category : #accessing }
WRConnectionConfig >> password [
	^ password
]

{ #category : #accessing }
WRConnectionConfig >> port [
	^ port ifNil: [ Error signal: 'connection port must be defined' ]
]

{ #category : #accessing }
WRConnectionConfig >> username [
	^ username
]

{ #category : #accessing }
WRConnectionConfig >> username: anUsername password: aPwd [
	username := anUsername.
	password := aPwd
]
