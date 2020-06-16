:- module(caldistance, [distance/3]).
:- use_module(facts). /*to use pos function*/

/*used to get distance from city to another using (longitude and latitude) of city*/
distance(City,City1,Dis):-
    pos(City,Lat1,Lon1),
    pos(City1,Lat2,Lon2),
    P is 0.017453292519943295,
    A is (0.5 - cos((Lat2 - Lat1) * P) / 2 + cos(Lat1 * P) * cos(Lat2 * P) * (1 - cos((Lon2 - Lon1) * P)) / 2),
    Dis is (12742 * asin(sqrt(A))).

