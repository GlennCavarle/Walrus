accessing
constructorBlock
	^ constructorBlock ifNil: [ constructorBlock := [ :cls :data | cls new ] ]