Class {
	#name : #WRUnresolvedCollection,
	#superclass : #WRObjectReference,
	#instVars : [
		'ids',
		'type'
	],
	#category : #'Walrus-Metadata-ObjectReference'
}

{ #category : #'as yet unclassified' }
WRUnresolvedCollection class >> ids: aCollection metadata: aClassMetadata [
	^ self
		type: #OrderedCollection
		ids: aCollection metadata: aClassMetadata
]

{ #category : #'as yet unclassified' }
WRUnresolvedCollection class >> type: aCollectionName ids: aCollection metadata: aClassMetadata [
	^ self new
		type: aCollectionName;
		ids: aCollection;
		metadata: aClassMetadata;
		yourself
]

{ #category : #resolving }
WRUnresolvedCollection >> basicResolveUsing: aResolver [
	| resolvedCollection |
	resolvedCollection := (aResolver resolveCollection: self) as: (Smalltalk at: self type).
	self becomeForwardKeepingHash: resolvedCollection.
	^ resolvedCollection
]

{ #category : #accessing }
WRUnresolvedCollection >> ids [
	^ ids
]

{ #category : #accessing }
WRUnresolvedCollection >> ids: anObject [
	ids := anObject
]

{ #category : #accessing }
WRUnresolvedCollection >> targetClass [
	^ metadata targetClass
]

{ #category : #accessing }
WRUnresolvedCollection >> type [
	^ type
]

{ #category : #accessing }
WRUnresolvedCollection >> type: aTypeName [
	type := aTypeName
]
