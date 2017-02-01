
const unique REL$RELSchema: ClassName extends  complete;
	
const unique REL$RELSchema.relations: Field ref;
const unique REL$RELSchema.name: Field String;

const unique REL$Relation: ClassName extends  complete;
	
const unique REL$Relation.schema: Field ref;
const unique REL$Relation.attrs: Field ref;
const unique REL$Relation.name: Field String;

const unique REL$RELAttribute: ClassName extends  complete;
	
const unique REL$RELAttribute.relation: Field ref;
const unique REL$RELAttribute.isKey: Field bool;
const unique REL$RELAttribute.name: Field String;

