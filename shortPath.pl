/*path 지정! */
/*p(출발점, 도착점, 비용)*/
/*이 path들은 모두 true*/
p(1, 2, 6).
p(1, 3, 3).
p(2, 1, 6).
p(2, 3, 2).
p(2, 4, 5).
p(3,1,3).
p(3,2,2).
p(3,4,3).
p(3,5,4).
p(4,2,5).
p(4,3,3).
p(4,5,2).
p(4,6,3).
p(5,3,4).
p(5,4,2).
p(5,6,5).
p(6,4,3).
p(6,5,5).


/*도착했을때 true, (세번째 인자)에 길을 반환*/
path([H|R], H, [H|R], Length, Length).

/*S -> D로 가는 모든길 */
/*CPath는 현재까지 가고있는 길 */
/*CL은 현재까지 가는데 모은 비용, L은 총 길이 비용 반환값*/

path([S | CPath ], D, ResltPath, CL, L) :-
    	p(S, Mid, X),			/*S에서 갈 수 있는 true 길! */
    	\+member(Mid, [S | CPath]),	/*이미 지났던 길은 제외! */
    	NewL is CL + X,			/*비용 X 추가 !! */
	/*Mid를 CPath에 추가, Mid부터 갈수 있는길 조사! */	
	path( [ Mid, S | CPath ] ,D , ResltPath ,NewL,L).
	

sp(S, D) :-
    	findall([L, R ],path([S], D, R, 0, L),SET), /*S->D로 모든 경로 SET에 저장*/
    	/*비용순으로 정렬후 가장작은 첫원소 비용과 경로 LEN,PATH */
	sort(SET,[ [ LEN,PATH | DP ]|SORT ]),  
    	reverse(PATH,DPATH), /*경로 추가시 앞에서부터  추가했으므로 다시 역순으로!*/
	/*경로, 길이 출력! */
	write(DPATH),nl,
	write(LEN),nl.


