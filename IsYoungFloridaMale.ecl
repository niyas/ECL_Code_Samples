IMPORT $;

IsFloridian := $.Persons.state = 'FL';
IsMale := $.Persons.gender = 'M';
IsBorn80 := $.Persons.birthdate <> '' and
	(INTEGER4)$.Persons.birthdate[1..4] > 1979;

EXPORT IsYoungFloridaMale := IsFloridian and IsMale and IsBorn80;
