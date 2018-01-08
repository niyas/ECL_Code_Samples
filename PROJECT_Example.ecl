myRec := RECORD
	STRING1 Value1;
	STRING1 Value2;
END;

myData := DATASET(
		[
				{'a','b'},
				{'c', 'd'},
				{'e','f'},
				{'g','h'},
				{'i','j'}
		],
		myRec
);

myOutRec := RECORD
	myData.Value1;
	myData.Value2;
	string4 CatValue;
END;

myOutRec CatThem(myData L, INTEGER C) := TRANSFORM
	SELF.CatValue := L.Value1 + L.value2 + '-' + (STRING)C;
	SELF := L;
END;

CatRecs := PROJECT(myData, CatThem(LEFT, COUNTER));

OUTPUT(catRecs);