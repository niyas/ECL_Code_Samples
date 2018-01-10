PersonsRec := RECORD
	INTEGER4 RecID;
	STRING15 FirstName;
	STRING25 LastName;
	STRING15 MiddleName;
	STRING2 NameSuffix;
	STRING8 FileDate;
	UNSIGNED2 BureauCode;
	STRING1 MaritialStatus;
	STRING1 Gender;
	UNSIGNED1 DependentCode;
	STRING8 BirthDate;
	STRING42 StreetAddress;
	STRING20 City;
	STRING2 State;
	STRING5 ZipCode;
END;

EXPORT Persons := DATASET('~ONLINE::MN::Intro::Persons',PersonsRec, THOR);

