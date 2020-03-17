nQueen(N) :- 
 	/*길이 N 배열 Solution 생성*/
 	length(Solution, N), 
 	write('n='),write(N),nl,
	/*L 리스트에 모든 해답 저장*/
 	findall(Solution,queen(Solution, N),L), 
	length(L,LEN),
	write("# of answer="),write(LEN),nl,
	write(L),nl.
 
 
 
 
 /* k 부터 N까지 수를 가진 리스트 생성*/
 /* K를 1씩 증가하며 QLIST에 추가하는 재귀 함수 */ 
 qlist(N,N,[N]) :-!. 
 qlist(K,N,[K|CLIST]) :- K < N, K1 is K+1, qlist(K1, N, CLIST). 
 
  
 /*queen을 돌려볼 배열이 비었으면 true */
 queen([],_).
 
 /*Qlist에 Q(col)을 순서대로 입력*/
 queen([Q|Qlist],N) :- 
 
 	queen(Qlist, N), /*나머지 Q를 제외한 N-1개 원소, Qlist에 재귀적으로 실행*/ 
    /*Qlist까지 true하게 nQueen이 놓아졌다면 Q만 잘 놓아지면 된다! */
 	
	/*N개 퀸은 위치 할 수 있는 cal 후보가 1 부터 N, 리스트 생성*/
 	qlist(1,N,Can), 
	
	/*1 부터 N에 들어있는 true로 반환되는 Q가 후보다. ! */
 	member(Q, Can),

 	/*그리고 그 Q는 Qlist에 추가할때 promising도 true 해야됨! */
 	promising(Q,Qlist, 1).
 
 
 
 /*promising할 리스트가 비었으면 true */
 promising(_,[], _). 
 
 /*Q는 현재 놓아보는 col 후보자! Q1은 이미 놓아져서 비교할 col! */
 promising(Q,[Q1|Qlist],Srow) :- 
 	Q =\= Q1,           		/*같은 col 인지 검사!! */
 	Test is abs(Q1-Q),  		/*절대값으로 저장 Q1-Q*/
    /* xdist는 행의 차이,즉 처음은 1, 행차이 = 열차이는 대각선에 위치를 뜻함 */
	Test =\= Srow,  		/* 행차이 != 열차이 */
 	Srow1 is Srow + 1, 		/*다음행 검사를 위한 +1 */ 
 	promising(Q,Qlist,Srow1). 	/* 다음 행들도 promising한지 검사! */

