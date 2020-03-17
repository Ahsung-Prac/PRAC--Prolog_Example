/* quicksort 한 배열 출력! */
quickSort(R):- quicksort(R,R1),write(R1),nl.

/*sort할 배열이 없으면 true.하고 끝.*/
quicksort([], []).

/* 리스트 원소가 한개 일때는 SORT에 추가 후 merge로 출력 */
quicksort([F|[]],SORT):-
	write("merge : "),write([F]),nl,
	merge([],[F|[]],SORT).

/* F는 맨앞 원소 피벗, L은 나머지 리스트 SORT는 정렬된 리스트*/
quicksort([F | L], SORT) :- 
	/*F 피벗 기준으로 배열 두개로 나눔*/
	partition(F, L, LEFT, RIGHT),
	write("divide = "), write(F),write("|"), write(LEFT),write(RIGHT),nl, 
	/*나눠진 배열 재귀적으로 quicksort반복*/
 	quicksort(LEFT, SL),
	quicksort(RIGHT, SR),
	/*나눠진 배열을 다시 합침!!*/
	merge(SL, [F| SR], SORT),
	/*합치면 merge출력 */
	write("merge : "),write(SL),write([F]),write(SR),nl.


/* 피벗을 기준으로 리스트를 작은 것과 큰것 두개로 나눠 만든다.*/
/* 리스트가 없으면 true하고 끝*/
partition(PIVOT, [], [], []).

/* 피벗을 뺀  리스트에서  F 값이 피벗보다 작으면 LEFT에 저장*/
partition(PIVOT, [F | L], [F | LEFT], RIGHT) :- F =< PIVOT,
 partition(PIVOT, L, LEFT, RIGHT). /*저장한 원소를 제외하고 나머지 리스트 partition 실행!*/

/*크면 RIGHT에 저장*/
partition(PIVOT, [F | L], LEFT, [F | RIGHT]) :- F > PIVOT,
 partition(PIVOT, L , LEFT, RIGHT).


