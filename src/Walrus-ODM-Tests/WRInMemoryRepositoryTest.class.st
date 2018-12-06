Class {
	#name : #WRInMemoryRepositoryTest,
	#superclass : #TestCase,
	#category : #'Walrus-ODM-Tests'
}

{ #category : #tests }
WRInMemoryRepositoryTest >> test [
|repo obj1 |
repo := WRInMemoryRepository new.
obj1 := WRTestObject example1.
repo add: obj1.

self assert: (repo selectById: obj1 id) equals: obj1.
self assert: (repo selectBy:{#id -> obj1 id} asDictionary) isCollection.
]
