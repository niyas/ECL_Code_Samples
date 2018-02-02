IMPORT $;

EXPORT searchPersons(STRING search, BOOLEAN oldies) := MODULE
		f := $.Persons;
		SHARED g := IF(oldies, f((INTEGER)birthdate[1..4] <= 1970),f);
		EXPORT included := g(lastname = search);
		EXPORT excluded := g(lastname <> search);
END;