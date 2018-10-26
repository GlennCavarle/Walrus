Class {
	#name : #WRUnresolvedObject,
	#superclass : #WRObjectReference,
	#instVars : [
		'id'
	],
	#category : #'Walrus-Metadata-ObjectReference'
}

{ #category : #accessing }
WRUnresolvedObject class >> id: anId metadata: aClassMetadata [
	^ self new
		id: anId;
		metadata: aClassMetadata;
		yourself
]

{ #category : #resolving }
WRUnresolvedObject >> basicResolveUsing: aResolver [
	| resolvedObject |
	resolvedObject := aResolver resolveObject: self.
	self becomeForwardKeepingHash: resolvedObject.
	^ resolvedObject
]

{ #category : #accessing }
WRUnresolvedObject >> id [
	^ id
]

{ #category : #accessing }
WRUnresolvedObject >> id: anObject [
	id := anObject
]

{ #category : #accessing }
WRUnresolvedObject >> targetClass [
	^ metadata type
]
