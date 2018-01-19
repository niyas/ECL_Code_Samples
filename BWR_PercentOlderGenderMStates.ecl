IMPORT $;

IsOlderPerson := $.Persons.BirthDate[1..4] < '1980' AND $.Persons.BirthDate <> '';

//Male
AllOlderMale := COUNT($.Persons(IsOlderPerson, 
	gender='M'));
OlderMalesInMStates := COUNT($.MenInMStatePersons(IsOlderPerson));
PracOlderMalesInMStates := (DECIMAL5_2)(OlderMalesInMStates/AllOlderMale * 100);

//Female
AllOlderFemale := COUNT($.Persons(IsOlderPerson, 
	gender='F'));
OlderFemalesInMStates := COUNT($.Persons(State in $.SetMStates, 
	Gender = 'F', 
	IsOlderPerson));
PracOlderFemalesInMStates := (DECIMAL5_2)(OlderFemalesInMStates/AllOlderFemale * 100);

OUTPUT(PracOlderMalesInMStates,NAMED('MStateMalePercentage'));
OUTPUT(PracOlderFemalesInMStates,NAMED('MStateFemalePercentage'));