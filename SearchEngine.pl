:- module(searchengine,[go/3]).
:- use_module(caldistance). /*to use distance function*/
:- use_module(facts). /*to use move function*/

/*
generateflight(City,City1,Flights):-
random_between(1, 3, Num),
distance(City,City1,Dis),
Time is Dis / 740,
S = 0.0,
E is 24 - Time,
generate(City,City1,Time,Num,S,E,Flights).

generate(_,_,_,0,_,_,[]).

generate(City,City1,Time,Num,S,E,[[D,A]|Flights]):-
Num>0,
random(S,E,D),
Num1 is Num - 1,
random(1,3,N),
S1 is S + N,
A is D + Time,
generate(City,City1,Time,Num1,S1,E,Flights).
*/

go(Start,Goal,L):-

		getHeuristic(Start, H, Goal),

		path([[Start,null, 0, H, H]],[],Goal,List),!,

		reverse(List,L),

		write(L),nl.


%main predicate that takes open list, closed list and goal state

path([], _, _,[]):-

		write('No solution'),nl,!.

path(Open, Closed, Goal,List):-

		getBestChild(Open, [Goal, Parent, PC, H, TC], _),

		write('A solution is found'),  nl ,

		getsolution([Goal,Parent, PC, H, TC], Closed,List),!.

path(Open, Closed, Goal,List):-

		getBestChild(Open, [State, Parent, PC, H, TC], RestOfOpen),

		getchildren(State, Open, Closed, Children, PC, Goal),

		addListToOpen(Children , RestOfOpen, NewOpen),

		path(NewOpen, [[State, Parent, PC, H, TC] | Closed], Goal,List).


%gets Children of State that aren't in Open or Close

getchildren(State, Open ,Closed , Children, PC, Goal):-

		bagof(X, moves( State, Open, Closed, X, PC, Goal), Children).

getchildren(_,_,_, [],_,_).


%adds children to open list (without best child) to form new open list

addListToOpen(Children, [], Children).

addListToOpen(Children, [H|Open], [H|NewOpen]):-

		addListToOpen(Children, Open, NewOpen).


%gets the best state of the open list and another list without this best state

%first parameter is the open list

%second parameter is the best child

%third parameter is the open list without the best child

getBestChild([Child], Child, []).

getBestChild(Open, Best, RestOpen):-

	getBestChild1(Open, Best),

	removeFromList(Best, Open, RestOpen).


%gets the best state of the open list

getBestChild1([State], State).

getBestChild1([State|Rest], Best):-

	getBestChild1(Rest, Temp),

	getBest(State, Temp, Best).


% compares two states with each other (according to their Total cost) and
% returns the state with lowest total cost TC

getBest([State, Parent, PC, H, TC], [_, _, _, _, TC1], [State, Parent, PC, H, TC]):-
/*Best child based on lowest TC*/
	TC < TC1, !.

getBest([_, _, _, _, _], [State1, Parent1, PC1, H1, TC1], [State1, Parent1, PC1, H1, TC1]).


%removes an element (usually the best state) from a list (open list) and returns a new list

removeFromList(_, [], []).

removeFromList(H, [H|T], V):-

	!, removeFromList(H, T, V).

removeFromList(H, [H1|T], [H1|T1]):-

	removeFromList(H, T, T1).


%gets next state given the current state

moves( State, Open, Closed,[Next,State, NPC, H, TC], PC, Goal):-

		move(State,Next,PC,_,NPC),

		\+ member([Next, _, _, _, _],Open),

		\+ member([Next, _, _, _, _],Closed),

		getHeuristic(Next, H, Goal),

		TC is NPC + H.





%Get the path from start state to goal state

getsolution([_, null, _, _, _],_,[]).

getsolution([State, Parent, _, _, _], Closed,[[Parent,State]|List]):-
		member([Parent, GrandParent, PC1, H1, TC1], Closed),
               getsolution([Parent, GrandParent, PC1, H1, TC1], Closed,List).



/*getHeuristic depend on distance between current city to Goal*/
getHeuristic(Start,H,Goal):-
distance(Start,Goal,H).

/*using to reverse list*/
reverse(L1,L2):-
reverse1(L1,[],L2).

reverse1([],L,L).
reverse1([H|T],L,R):-
reverse1(T,[H|L],R).








