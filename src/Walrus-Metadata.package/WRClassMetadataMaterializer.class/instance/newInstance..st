private
newInstance: aClassMetadata
	^ aClassMetadata constructorBlock 
		value: (Smalltalk at: aClassMetadata targetClass)
		value: self jsonData