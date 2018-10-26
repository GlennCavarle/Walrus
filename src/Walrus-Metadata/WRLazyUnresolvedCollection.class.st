Class {
	#name : #WRLazyUnresolvedCollection,
	#superclass : #WRUnresolvedCollection,
	#instVars : [
		'resolver'
	],
	#category : #'Walrus-Metadata-ObjectReference'
}

{ #category : #'reflective operations' }
WRLazyUnresolvedCollection >> doesNotUnderstand: aMessage [
	| resolvedCollection |
	resolvedCollection := self basicResolveUsing: self resolver.
	^ resolvedCollection perform: aMessage selector withArguments: aMessage arguments
]

{ #category : #accessing }
WRLazyUnresolvedCollection >> resolver [
	^ resolver
]

{ #category : #accessing }
WRLazyUnresolvedCollection >> resolver: anObject [
	resolver := anObject
]

{ #category : #resolving }
WRLazyUnresolvedCollection >> tryResolveUsing: aResolver [
	"does nothing, i am lazy"
	resolver := aResolver
]
