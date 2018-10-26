resolving
basicResolveUsing: aResolver
	| resolvedCollection |
	resolvedCollection := (aResolver resolveCollection: self) as: (Smalltalk at: self type).
	self becomeForwardKeepingHash: resolvedCollection.
	^ resolvedCollection