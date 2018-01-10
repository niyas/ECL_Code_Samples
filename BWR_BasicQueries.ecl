IMPORT $;

COUNT($.Persons);
OUTPUT($.Persons,{RecID, FirstName, LastName},NAMED('Limited_Name'));
OUTPUT($.Persons,{RecID, StreetAddress, City, State, ZipCode},NAMED('Address_info'));
