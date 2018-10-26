Class {
	#name : #WRLazyUnresolvedObject,
	#superclass : #WRUnresolvedObject,
	#instVars : [
		'resolver'
	],
	#category : #'Walrus-Metadata-ObjectReference'
}

{ #category : #'reflective operations' }
WRLazyUnresolvedObject >> doesNotUnderstand: aMessage [
	| resolvedObject |
	resolvedObject := self basicResolveUsing: self resolver.
	^ resolvedObject perform: aMessage selector withArguments: aMessage arguments
]

{ #category : #accessing }
WRLazyUnresolvedObject >> resolver [
	^ resolver
]

{ #category : #accessing }
WRLazyUnresolvedObject >> resolver: anObject [
	resolver := anObject
]

{ #category : #resolving }
WRLazyUnresolvedObject >> tryResolveUsing: aResolver [
	"does nothing, i am lazy"
	resolver := aResolver
]
