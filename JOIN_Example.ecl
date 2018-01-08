myRec := RECORD
	STRING1 Value1;
	STRING1 Value2;
END;

rightData := DATASET([
		{'x','a'},
		{'g','b'},
		{'c','d'},
		{'f','e'},
		{'n','l'}
	], myRec);
	
leftData := DATASET([
		{'x','y'},
		{'e','b'},
		{'c','o'},
		{'m','e'},
		{'n','y'}
	], myRec);
	
	myOutRec := RECORD
		STRING1 Value1;
		STRING1 LeftValue2;
		STRING1 RightValue2;
	END;
	
	myOutRec joinRec(myRec L, myRec R) := TRANSFORM
		SELF.Value1 := IF(L.Value1 <> '', L.Value1, R.Value1);
		SELF.LeftValue2 := L.Value2;
		SELF.RightValue2 := R.Value2;
	END;
	
InnerJoinedRecs  := JOIN(leftData, rightData, 
	LEFT.Value1 = RIGHT.Value1,
	joinRec(LEFT, RIGHT));
		
LOutJoinedRecs := JOIN(leftData, rightData,
	LEFT.Value1 = RIGHT.Value1,
	joinRec(LEFT, RIGHT),
	LEFT OUTER);
			
ROutJoinedRecs := JOIN(leftData, rightData,
	LEFT.Value1 = RIGHT.Value1,
	joinRec(LEFT, RIGHT),
	RIGHT OUTER);

FOutJoinedRecs := JOIN(leftData, rightData,
	LEFT.Value1 = RIGHT.Value1,
	joinRec(LEFT, RIGHT),
	FULL OUTER);	

LOnlyJoinedRecs := JOIN(leftData, rightData,
	LEFT.Value1 = RIGHT.Value1,
	joinRec(LEFT, RIGHT),
	LEFT ONLY);	
	
ROnlyJoinedRecs := JOIN(leftData, rightData,
	LEFT.Value1 = RIGHT.Value1,
	joinRec(LEFT, RIGHT),
	RIGHT ONLY);

FOnlyJoinedRecs := JOIN(leftData, rightData,
	LEFT.Value1 = RIGHT.Value1,
	joinRec(LEFT, RIGHT),
	FULL ONLY);		
	
OUTPUT(InnerJoinedRecs,,NAMED('Inner'));
OUTPUT(LOutJoinedRecs,,NAMED('LeftOuter'));
OUTPUT(ROutJoinedRecs,,NAMED('RightOuter'));
OUTPUT(FOutJoinedRecs,,NAMED('FullOuter'));
OUTPUT(LOnlyJoinedRecs,,NAMED('LeftOnly'));
OUTPUT(ROnlyJoinedRecs,,NAMED('RightOnly'));
OUTPUT(FOnlyJoinedRecs,,NAMED('FullOnly'));
	