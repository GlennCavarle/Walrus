Class {
	#name : #WRConnectionPoolTest,
	#superclass : #TestCase,
	#traits : 'TWRTestWithConnection',
	#classTraits : 'TWRTestWithConnection classTrait',
	#category : #'Walrus-ODM-Tests'
}

{ #category : #tests }
WRConnectionPoolTest >> test [
	| conPool task1 task2 sem startTime task2StartTime|
	conPool := self newConnectionPoolMockWithSize: 10.
	sem := Semaphore new.	
	task2StartTime := nil.
	
	task1 := [ 
			[conPool withConnection: [ :c | 2 second wait. Transcript crShow: 'task1 done' ]]
				on: Error do: [ Transcript crShow: 'error' . sem signal. Processor activeProcess terminate.].
			sem signal.
	].
	
	task2 := [ 
			[conPool withConnection: [ :c | task2StartTime := DateAndTime now. Transcript crShow: 'task2 done' ]]
				on: Error do: [ Transcript crShow: 'error' . sem signal. Processor activeProcess terminate.].
			sem signal.
	].
	startTime := DateAndTime now.
	20 timesRepeat: [ task1 fork. ].
	task2 fork.
	21 timesRepeat: [ sem wait  ].
	
	self 
		assert: conPool currentSize <= conPool maxSize 
		description: 'current size should not exceed the max size'.
		
	self 
		assert: (task2StartTime-startTime) >= 4 seconds
		description: 'task2 should wait for a connection to be available (after all task1)'
	

	
]
