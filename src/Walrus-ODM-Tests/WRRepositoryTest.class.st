Class {
	#name : #WRRepositoryTest,
	#superclass : #TestCase,
	#traits : 'TWRTestWithConnection',
	#classTraits : 'TWRTestWithConnection classTrait',
	#category : #'Walrus-ODM-Tests'
}

{ #category : #tests }
WRRepositoryTest >> test [
	| dbContext |
	dbContext := self newDbContext.
	WRGenericRepository context: dbContext modelClass: WRTestObject name
]
