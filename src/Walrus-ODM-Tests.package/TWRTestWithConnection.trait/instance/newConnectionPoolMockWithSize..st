mock
newConnectionPoolMockWithSize: aNumber
	^ WRConnectionPool config:
			(WRConnectionConfig local
				connectionClass: WRConnectionMock;
				maxPoolSize: aNumber;
				yourself)