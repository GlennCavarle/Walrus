resolving
basicResolveUsing: aResolver
	| resolvedObject |
	resolvedObject := aResolver resolveObject: self.
	self becomeForwardKeepingHash: resolvedObject.
	^ resolvedObject