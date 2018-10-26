serialize/materialize
materializeCollection: rawDataCollection
	^ rawDataCollection collect: [ :eachRawData | self materialize: eachRawData ]