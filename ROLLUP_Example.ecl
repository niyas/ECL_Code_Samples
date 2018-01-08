//Record declaration for myData
myRec := RECORD
	STRING1 Value1;
	STRING1 Value2;
	UNSIGNED1 Value3
END;

//Create Dataset using recordset
myData := DATASET(
	[
		{'a','b',1},
		{'d','k',5},
		{'a','f',8},
		{'h','g',4},
		{'i','c',2},
		{'a','g',9}
	],
	myRec
);

//Sort the data based on value1
sortedData := SORT(myData, Value1);

/**
* Performs Transform operation for two rows
*
* @param {Row} L
* @param {Row} R
*/
RECORDOF(myData) RollThem(myData L, myData R) := TRANSFORM
	SELF.Value3 := IF(L.Value3 < R.value3, R.Value3, L.Value3);
	SELF.Value2 := IF(L.Value2 < R.Value2, L.Value2, R.Value2);
	SELF := L;
END;

/**
* In Rollup the LEFT denotes the First row and the RIGHT denotes the Second row
* For the first iteration assume the LEFT row value is empty
*/
RolledUpRecs := ROLLUP(sortedData, 
	LEFT.Value1 = RIGHT.Value1,
RollThem(LEFT, RIGHT));
	
	
/**
* Add 100 to value3 field of each row
*@param {Data} L
*/
myRec add(myData L):= TRANSFORM
	SELF.Value3 := L.Value3 + 100;
	SELF := L;
END;
	
finalData := PROJECT(RolledUpRecs, add(LEFT));
																							
OUTPUT(finalData);																							
