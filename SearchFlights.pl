:- module(searchflights,[go1/2]).
:- use_module(facts).


move1([[A,B],_Departure,Arrival,_Name,_Dayslist],[[NA,NB],NDeparture,NArrival,NName,NDayslist],PC,_,NPC,List,Days):-
getnextstate([A,B],[NA,NB],List),/*get next cities in list of steps which is
[[Cairo,London],[London,SanFrancisco]] like [cairo,london] this function return [london,sanfrancisco]*/
getflight([NA,NB],NDeparture,NArrival,NName,NDayslist),/*get flight from NA to NB city*/
member(Days,NDayslist),/*check that travel day in days list of flight*/
NDeparture > Arrival,/*check that next flight Departure time > current flight arrival time*/
Time is abs(NArrival - NDeparture),/*get travel time*/
Waiting is abs(NDeparture - Arrival),/*get waiting time*/
NPC is PC + Time + Waiting.

getnextstate([_,B],[B,S],[[B,S]|_]):-!.
getnextstate([A,B],N,[[_,_]|T]):-
getnextstate([A,B],N,T).

/*search for all next flights (next step) from current flight (current step)
and put Mindep based on minimum time of difference between (the arrival of current flight and departure of next flights)*/
getHeuristic1([[A,B],_,Arrival,_,_],Mindep,List,Days,PC):-
findall(NDeparture,move1([[A,B],_Departure,Arrival,_Name,_Dayslist],[[_NA,_NB],NDeparture,_NArrival,_NName,_NDayslist],PC,_,_NPC,List,Days),Deplist),
getdiflist(Deplist,Arrival,NewDeplist),/*return new list of differnece between Deplist(contain departure time of all next flights) and Arrival time of current flight)*/
getminDeparture(NewDeplist,Mindep). /*return minimum of list*/

/*return new list of differnece between every element of list and element*/
getdiflist([],_,[]).
getdiflist([D|T],A,[S|T1]):-
S is abs(D - A),
getdiflist(T,A,T1).

/*get a flight from city to another*/
getfirstflight([A,B],L,Days,[[[A,B],Departure,Arrival,Name,Dayslist],null, PC, Mindep, TC],[A1,B1]):-
getflight([A,B],Departure,Arrival,Name,Dayslist),
member(Days,Dayslist),
PC is Arrival - Departure,
((A = A1,B1 = B)-> Mindep = 0;getHeuristic1([[A,B],_,Arrival,_,_],Mindep,L,Days,PC)) ,
TC is PC + Mindep.

/*get last step of list [[Cairo,London],[London,SanFrancisco]] like [london,sanfrancisco]*/
getGoal([Last],Last).
getGoal([H|T],Last):-
getGoal(T,Last).

go1(Days,[[A,B]|L]):-
        getGoal([[A,B]|L],Goal),
	findall(X,getfirstflight([A,B],L,Days,X,Goal),Open),
        /*get all possible flights from city to another*/
        getBestChild1(Open,[State, Parent, PC, H, TC], _),
        path1([[State, Parent, PC, H, TC]],[],Goal,L,Days,R1,R),!.


%main predicate that takes open list, closed list and goal state
/*['nyc', 'sanfrancisco']*/
path1([], _, _,_,_,_,_):-

		write('No solution'),nl,!.


path1(Open, _Closed, Goal,_List,_Days,R,R):-

                getBestChild1(Open, [[Goal,D,A,N,Dayslist], _, PC, _, _], _),
		write('A solution is found'),  nl ,
                append(R,[[Goal,D,A,N,Dayslist]],R2)
                ,printsolution(R2),
                write('Total travel time: '),write(PC),write(' hours'),nl.

path1(Open, Closed, Goal,List,Days,R,R1):-

		getBestChild1(Open, [State, Parent, PC, H, TC], RestOfOpen),

                append(R,[State],NR),

		getchildren1(State, Open, Closed, Children, PC, Goal,List,Days),

		addListToOpen1(Children , RestOfOpen, NewOpen),

		path1(NewOpen, [[State, Parent, PC, H, TC] | Closed], Goal,List,Days,NR,R1).


%gets Children of State that aren't in Open or Close

getchildren1(State, Open ,Closed , Children, PC, Goal,List,Days):-

		bagof(X, moves1( State, Open, Closed, X, PC, Goal,List,Days), Children).


getchildren1(_,_,_, [],_,_,_,_).


%adds children to open list (without best child) to form new open list

addListToOpen1(Children, [], Children).

addListToOpen1(Children, [H|Open], [H|NewOpen]):-

		addListToOpen1(Children, Open, NewOpen).


%gets the best state of the open list and another list without this best state

%first parameter is the open list

%second parameter is the best child

%third parameter is the open list without the best child

getBestChild1([Child], Child, []).

getBestChild1(Open, Best, RestOpen):-

	getBestChild2(Open, Best),

	removeFromList1(Best, Open, RestOpen).


%gets the best state of the open list

getBestChild2([State], State).

getBestChild2([State|Rest], Best):-

	getBestChild2(Rest, Temp),

	getBest1(State, Temp, Best).


% compares two states with each other (according to their Total cost) and
% returns the state with highest total cost TC

getBest1([State, Parent, PC, H, TC], [_, _, _, _, TC1], [State, Parent, PC, H, TC]):-
/*Best child based on smallest Total*/
	TC < TC1, !.

getBest1([_, _, _, _, _], [State1, Parent1, PC1, H1, TC1], [State1, Parent1, PC1, H1, TC1]).


%removes an element (usually the best state) from a list (open list) and returns a new list

removeFromList1(_, [], []).

removeFromList1(H, [H|T], V):-

	!, removeFromList1(H, T, V).

removeFromList1(H, [H1|T], [H1|T1]):-

	removeFromList1(H, T, T1).


%gets next state given the current state

moves1( State, Open, Closed,[Next,State, NPC, H, TC], PC, Goal, List ,Days):-

		move1(State,Next,PC,_,NPC,List,Days),

		\+ member([Next, _, _, _, _],Open),

		\+ member([Next, _, _, _, _],Closed),

                ( member(Goal,Next)-> H = 0;getHeuristic1(Next, H,List,Days,PC)) ,

		TC is NPC + H.





printsolution([]).
printsolution([H|T]):-
print(H),
printsolution(T).

print([[S,E],D,A,N,_]):-
write(S),write('->'),write(E),nl,
write('Departure: '),write(D),nl,
write('Arrival: '),write(A),nl,
write('Flight Name: '),write(N),nl.

/*Used to get min of list*/
getminDeparture([X], X).
getminDeparture([X|Xs], X) :- getminDeparture(Xs, Y), X < Y.
getminDeparture([X|Xs], Y) :- getminDeparture(Xs, Y), X >= Y.














