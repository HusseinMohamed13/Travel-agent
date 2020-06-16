:- use_module(searchengine). /* go */
:- use_module(searchflights). /* go1 */

start(Start,Goal,Daysrange):-
/*go function is used to get shortest path (depend on distance) from start city to  destination city*/
/*Search is done using infromed search algorthim(A*) ,which is use Heuristic function that get the distance between city and goal,
in searchengine choose next best state based on smallest TC */
/*go function return List "L" like [['Cairo','London'],['London','SanFrancisco]] ,given Start('Cairo') and Goal('SanFrancisco').*/
go(Start,Goal,L),
/*since days given as range from start day and last day ,get function used to get all days from start day to last day */
get(Daysrange,Dayslist),
(
  (getsolution(Dayslist,L),!); /*using cut to stop getsolution when a solution is found*/
  (increaseDaysrange(Dayslist,NDayslist),
  getsolution(NDayslist,L),!)
).


/*;
  increaseDaysrange(Dayslist,NDayslist),
  getsolution(NDayslist,L)
)).
*/


/*used to call go1 with all days in Dayslist to get solution*/
getsolution([Day|T],L):-
go1(Day,L)  /*go1 function print solution given Day to find and arrange flights in that day
,and given "L" like [['Cairo','London'],['London','SanFrancisco]].*/
;getsolution(T,L).

/*since days given as range from start day and last day
,get function used to get all days from start day to last day using getDayslist function */
get([S,G],L1):-
getDayslist(S,G,L),!,append(L,[G],L1).

/*add day after and before to Dayslist given Dayslist like ['sun','mon']
,then Dayslist become NDayslist like ['sat','sun','mon','tue']*/
increaseDaysrange(Dayslist,N1Dayslist):-
getlastelement(Dayslist,Last),
getfirstelement(Dayslist,First),
nextday(NFirst,First),
nextday(Last,NLast),
append(Dayslist,[NLast],NDayslist),
append([NFirst],NDayslist,N1Dayslist).

/*used to get all days from start day to last day*/
getDayslist(G,G,[]).
getDayslist(S,G,[S|List]):-
nextday(S,NS),
getDayslist(NS,G,List).

/*get last element in list */
getlastelement([Last],Last):-!.
getlastelement([_|T],L):-
getlastelement(T,L).

/*get first element in list*/
getfirstelement([H|_],First):-
First = H.

/****************/
nextday('sat','sun').
nextday('sun','mon').
nextday('mon','tue').
nextday('tue','wed').
nextday('wed','thu').
nextday('thu','fri').
nextday('fri','sat').





