IMPORT $;

OUTPUT($.Persons);

//Filters only Florida peoples
FloridaPeoples := $.Persons(state IN ['FL']);

//Filter Miami City  in Florida state
MiamiPeoples := FloridaPeoples(city IN ['MIAMI']);

//Filter records with ZipCode 33102
ZIP_33102 := $.Persons(ZipCode = '33102');

//Filter with FirstName starts with 'B'
FirstName_N := $.Persons(FirstName >= 'B' AND FirstName < 'C');

//Filter with year in FileDate field greaterthan 2000
Year_2000 := $.Persons( (INTEGER4)FileDate[1..4] > 2000);

OUTPUT(COUNT(FloridaPeoples), NAMED('Florida_Count'));
OUTPUT(COUNT(MiamiPeoples), NAMED('Miami_Count'));
OUTPUT(COUNT(ZIP_33102), NAMED('Zip_Count'));
OUTPUT(COUNT(FirstName_N), NAMED('Name_Count'));
OUTPUT(COUNT(Year_2000), NAMED('Year_Count'));