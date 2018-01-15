IMPORT $;

MenInMStatePersons := $.Persons(State IN $.SetMStates, Gender = 'M');
COUNT(MenInMStatePersons);
