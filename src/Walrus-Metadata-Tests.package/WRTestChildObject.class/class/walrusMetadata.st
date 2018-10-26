examples
walrusMetadata
	^ WRClassMetadata for: self name build: [ :mb | 
			mb
				database:'test-database';
				collection: 'test-child-collection';
				
				fields: [ :fb | 
					
					(fb identifier: #id)
						field:#_id;
						type:#OID.
						
					(fb property: #text)
						type: #String.
					
			] ]