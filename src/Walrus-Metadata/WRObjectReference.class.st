Class {
	#name : #WRObjectReference,
	#superclass : #Object,
	#instVars : [
		'metadata'
	],
	#category : #'Walrus-Metadata-ObjectReference'
}

{ #category : #resolving }
WRObjectReference >> basicResolveUsing: aResolver [
	^ self subclassResponsibility 
]

{ #category : #private }
WRObjectReference >> becomeForwardKeepingHash: otherObject [
	"Primitive. All variables in the entire system that used to point to the receiver now point to the argument.
	If copyHash is true, the argument's identity hash bits will be set to those of the receiver.
	Fails if either argument is a SmallInteger."

	(Array with: self)
		elementsForwardIdentityTo: (Array with: otherObject)
		copyHash: false
]

{ #category : #accessing }
WRObjectReference >> metadata [
	^ metadata
]

{ #category : #accessing }
WRObjectReference >> metadata: anObject [
	metadata := anObject
]

{ #category : #accessing }
WRObjectReference >> targetClass [
	^ metadata type
]

{ #category : #resolving }
WRObjectReference >> tryResolveUsing: aResolver [
	^ self basicResolveUsing: aResolver
]
