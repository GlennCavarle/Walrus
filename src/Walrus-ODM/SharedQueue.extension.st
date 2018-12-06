Extension { #name : #SharedQueue }

{ #category : #'*Walrus-ODM' }
SharedQueue >> nextPutIfNotIncluded: anObject [
	monitor
		critical: [ 
			(items includes: anObject)
				ifFalse: [ 
					items addLast: anObject.
					monitor signalAll ] ].
	^ anObject
]
