examples
walrusMetadata
	^ WRClassMetadata for: self name build: [ :mb | 
			mb
				database:'test-database';
				collection: 'test-object-collection';
				
				fields: [ :fb | 
					
					(fb identifier: #id)
						field:#_id;
						type:#OID.
						
					(fb property: #text)
						type: #String.
						
					(fb embeddedList: #tags)
						type:#Symbol.
						
					(fb toOne: #category)
						type:#WRTestCategory;
						beLazy.
						
					(fb toMany: #children)
						type:#WRTestChildObject 
			] ]