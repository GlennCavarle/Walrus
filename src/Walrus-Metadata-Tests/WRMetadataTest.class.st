Class {
	#name : #WRMetadataTest,
	#superclass : #TestCase,
	#category : #'Walrus-Metadata-Tests'
}

{ #category : #tests }
WRMetadataTest >> testBasicCreation [

	| clsMetadata |
	clsMetadata := WRClassMetadata new.
	clsMetadata 
		database: #'my-database';
		collection: #'my-collection';
		targetClass: #MyTargetClass;
		
		addProperty: (
			WRIdentifierMetadata new 
				name:#id;
				type: #OID;
				field:#_id);
	   
	   addProperty: (
			WRPropertyMetadata new 
				name:#text;
				type: #String;
				field:#text
				);
				
		addProperty: (
			WREmbeddedMetadata new 
				name:#category;
				type: #Category);
				
		addProperty: (
			WREmbeddedListMetadata new 
				name:#tags;
				collectionType: #OrderedCollection;
				type:#String);
				
		addProperty: (
			WRToOneMetadata new 
				name:#something;
				type: #MyClass);
				
	   addProperty: (
			WRToManyMetadata new 
				name:#things;
				collectionType: #OrderedCollection;
				type:#MyClass;
				field:#things_collection).
		
			
		
]

{ #category : #tests }
WRMetadataTest >> testFromAnnotation [
	|factory|
	factory := WRClassMetadataFactory withAnnotationLoader.
	factory classMetadataFor: #WRTestObject
	
]
