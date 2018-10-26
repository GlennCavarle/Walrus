accessing
metadataOn: aClass
	^ (pragma method valueWithReceiver: aClass arguments: #()) origin: pragma methodClass baseClass name