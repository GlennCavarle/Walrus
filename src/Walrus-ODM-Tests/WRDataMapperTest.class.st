Class {
	#name : #WRDataMapperTest,
	#superclass : #TestCase,
	#traits : 'TWRTestWithConnection',
	#classTraits : 'TWRTestWithConnection classTrait',
	#instVars : [
		'listenerSocket'
	],
	#category : #'Walrus-ODM-Tests'
}

{ #category : #tests }
WRDataMapperTest >> test [
	|dbContext dataMapper|
	
	dbContext := self newDbContext.
	dataMapper := WRDataMapper context: dbContext mappedClass: WRTestObject name. 
	
	dataMapper insert: WRTestObject example1.
	dataMapper fetchAll.
	
	dataMapper update: WRTestObject example1.
]
