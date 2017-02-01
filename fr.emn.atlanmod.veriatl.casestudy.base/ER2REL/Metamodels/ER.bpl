
const unique ER$ERSchema: ClassName extends  complete;
	
const unique ER$ERSchema.entities: Field ref;
const unique ER$ERSchema.relships: Field ref;
const unique ER$ERSchema.name: Field String;

const unique ER$Entity: ClassName extends  complete;
	
const unique ER$Entity.name: Field String;
const unique ER$Entity.attrs: Field ref;
const unique ER$Entity.ends: Field ref;
const unique ER$Entity.schema: Field ref;

const unique ER$Relship: ClassName extends  complete;
	
const unique ER$Relship.name: Field String;
const unique ER$Relship.attrs: Field ref;
const unique ER$Relship.ends: Field ref;
const unique ER$Relship.schema: Field ref;

const unique ER$RelshipEnd: ClassName extends  complete;
	
const unique ER$RelshipEnd.name: Field String;
const unique ER$RelshipEnd.relship: Field ref;
const unique ER$RelshipEnd.entity: Field ref;

const unique ER$ERAttribute: ClassName extends  complete;
	
const unique ER$ERAttribute.name: Field String;
const unique ER$ERAttribute.entity: Field ref;
const unique ER$ERAttribute.relship: Field ref;
const unique ER$ERAttribute.isKey: Field bool;

