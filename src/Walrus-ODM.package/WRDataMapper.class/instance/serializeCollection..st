serialize/materialize
serializeCollection: anObjectCollection

	^ anObjectCollection
		collect: [ :eachObject | self serialize: eachObject ]
		as: OrderedCollection