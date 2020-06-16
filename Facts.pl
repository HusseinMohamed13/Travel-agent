:- module(facts, [move/5,pos/3,getflight/5]).
:- use_module(caldistance). /*for distance*/

/*Move function used in searchengine.pl ,Used to move from city to another and get distance between two cities(Dis) and add distance to previous distance(PC) then return total distance(NPC)*/
move(City,City1,PC,_,NPC):-
    edge(City,City1),
    distance(City,City1,Dis),
    NPC is PC + Dis.
/*used to retrieve city longitude and latitude from position fact*/
pos(City,Lon,Lat):-
    position(City,Lon,Lat).
/*used to retrieve flight information from city to another from flight fact*/
getflight([City,City1],Departure,Arrival,Name,Dayslist):-
   flight(Departure,Arrival,Name,City,City1,Dayslist).


edge('Alexandria' , 'Aswan').
edge('Alexandria' , 'Cairo').
edge('Alexandria' , 'London').
edge('Alexandria' , 'NewYork').
edge('Aswan' , 'Cairo').
edge('Aswan' , 'PortSaid').
edge('Cairo' , 'Alexandria').
edge('Cairo' , 'Aswan').
edge('Cairo' , 'London').
edge('Cairo' , 'NewYork').
edge('Cairo' , 'Paris').
edge('Cairo' , 'PortSaid').
edge('Cairo' , 'Rome').
edge('Cairo' , 'Shanghai').
edge('Chicago' , 'London').
edge('Chicago' , 'Miami').
edge('Chicago' , 'NewYork').
edge('Chicago' , 'Paris').
edge('Chicago' , 'SanFrancisco').
edge('Edinburgh' , 'London').
edge('Edinburgh' , 'Paris').
edge('Edinburgh' , 'SanFrancisco').
edge('Liverpool' , 'London').
edge('London' , 'Alexandria').
edge('London' , 'Cairo').
edge('London' , 'Chicago').
edge('London' , 'Edinburgh').
edge('London' , 'Liverpool').
edge('London' , 'Lyon ').
edge('London' , 'Manchester').
edge('London' , 'NewYork').
edge('London' , 'Paris').
edge('London' , 'Rome').
edge('London' , 'SanFrancisco').
edge('London' , 'Shanghai').
edge('London' , 'Tokyo').
edge('Lyon' , 'Nice').
edge('Lyon' , 'Paris').
edge('Manchester' , 'London').
edge('Miami' , 'Chicago').
edge('Miami' , 'NewYork').
edge('Miami' , 'SanFrancisco').
edge('Milan' , 'London').
edge('Milan' , 'Paris').
edge('Milan' , 'Rome').
edge('NewYork' , 'Chicago').
edge('NewYork' , 'Edinburgh').
edge('NewYork' , 'London').
edge('NewYork' , 'Lyon ').
edge('NewYork' , 'Miami').
edge('NewYork' , 'Paris').
edge('NewYork' , 'Rome').
edge('NewYork' , 'SanFrancisco').
edge('NewYork' , 'Shanghai').
edge('NewYork' , 'Tokyo').
edge('Nice' , 'Lyon ').
edge('Nice' , 'Paris').
edge('Paris' , 'London').
edge('Paris' , 'Lyon ').
edge('Paris' , 'NewYork').
edge('Paris' , 'Nice').
edge('Paris' , 'Rome').
edge('Paris' , 'Shanghai').
edge('PortSaid' , 'Alexandria').
edge('PortSaid' , 'Cairo').
edge('Rome' , 'London').
edge('Rome' , 'Milan').
edge('Rome' , 'NewYork').
edge('Rome' , 'Paris').
edge('Rome' , 'Venice').
edge('SanFrancisco' , 'Chicago').
edge('SanFrancisco' , 'Miami').
edge('SanFrancisco' , 'NewYork').
edge('Shanghai' , 'Cairo').
edge('Shanghai' , 'Chicago').
edge('Shanghai' , 'London').
edge('Shanghai' , 'NewYork').
edge('Shanghai' , 'Paris').
edge('Shanghai' , 'Rome').
edge('Shanghai' , 'Tokyo').
edge('Tokyo' , 'SanFrancisco').
edge('Tokyo' , 'Shanghai').
edge('Venice' , 'Rome').


position('Alexandria' , 31.2 , 29.95).
position('Aswan' , 24.0875 , 32.8989).
position('Cairo' , 30.05 , 31.25).
position('Chicago' , 41.8373 , -87.6862).
position('Edinburgh' , 55.9483 , -3.2191).
position('Liverpool' , 53.416 , -2.918).
position('London' , 51.5 , -0.1167).
position('Lyon' , 45.77 , 4.83).
position('Manchester' , 53.5004 , -2.248).
position('Miami' , 25.7839 , -80.2102).
position('Milan' , 45.47 , 9.205).
position('NewYork' , 40.6943 , -73.9249).
position('Nice' , 43.715 , 7.265).
position('Paris' , 48.8667 , 2.3333).
position('PortSaid' , 31.26 , 32.29).
position('Rome' , 41.896 , 12.4833).
position('SanFrancisco' , 37.7562 , -122.443).
position('Shanghai' , 31.2165 , 121.4365).
position('Tokyo' , 35.685 , 139.7514).
position('Venice' , 45.4387 , 12.335).



flight(11.00 , 12.15 , 'MS005' , 'Alexandria' , 'Aswan' , ['mon', 'tue', 'wed']).
flight(15.15 , 16.30 , 'MS004' , 'Alexandria' , 'Aswan' , ['sat', 'fri']).
flight(9.15 , 10.00 , 'MS003' , 'Alexandria' , 'Cairo' , ['mon', 'tue', 'wed']).
flight(12.30 , 13.15 , 'MS001' , 'Alexandria' , 'Cairo' , ['sat', 'sun']).
flight(17.00 , 17.45 , 'MS002' , 'Alexandria' , 'Cairo' , ['sat', 'mon', 'thu', 'fri']).
flight(19.30 , 0.32 , 'MS006' , 'Alexandria' , 'London' , ['sat', 'sun', 'thu', 'fri']).
flight(2.00 , 15.14 , 'MS007' , 'Alexandria' , 'NewYork' , ['sun', 'tue', 'thu']).
flight(10.20 , 11.40 , 'MS022' , 'Aswan' , 'Cairo' , ['sat', 'sun', 'mon', 'wed']).
flight(7.05 , 8.18 , 'MS023' , 'Aswan' , 'PortSaid' , ['tue', 'thu', 'fri']).
flight(13.00 , 13.45 , 'MS008' , 'Cairo' , 'Alexandria' , ['sun', 'mon', 'wed']).
flight(20.15 , 21.00 , 'MS009' , 'Cairo' , 'Alexandria' , ['thu', 'fri']).
flight(8.00 , 9.20 , 'MS010' , 'Cairo' , 'Aswan' , ['sun', 'wed']).
flight(17.15 , 18.35 , 'MS011' , 'Cairo' , 'Aswan' , ['sat', 'tue', 'thu']).
flight(10.00 , 15.10 , 'MS014' , 'Cairo' , 'London' , ['sun', 'mon', 'tue']).
flight(15.15 , 20.25 , 'MS015' , 'Cairo' , 'London' , ['sat', 'wed', 'thu']).
flight(3.00 , 15.05 , 'MS016' , 'Cairo' , 'NewYork' , ['sat', 'sun', 'wed']).
flight(19.30 , 7.35 , 'MS017' , 'Cairo' , 'NewYork' , ['mon', 'tue', 'fri']).
flight(2.00 , 6.55 , 'MS018' , 'Cairo' , 'Paris' , ['wed', 'thu', 'fri']).
flight(5.00 , 9.55 , 'MS019' , 'Cairo' , 'Paris' , ['sat', 'mon']).
flight(11.00 , 11.20 , 'MS013' , 'Cairo' , 'PortSaid' , ['mon']).
flight(19.30 , 19.50 , 'MS012' , 'Cairo' , 'PortSaid' , ['sat', 'sun', 'wed', 'thu']).
flight(6.00 , 9.30 , 'MS021' , 'Cairo' , 'Rome' , ['sat', 'sun', 'tue', 'thu']).
flight(5.30 , 19.00 , 'MS020' , 'Cairo' , 'Shanghai' , ['sat', 'sun', 'mon', 'wed']).
flight(8.00 , 18.32 , 'DL050' , 'Chicago' , 'London' , ['sun', 'tue', 'thu', 'fri']).
flight(12.10 , 22.42 , 'DL051' , 'Chicago' , 'London' , ['sat', 'mon', 'wed']).
flight(10.00 , 14.20 , 'DL046' , 'Chicago' , 'Miami' , ['sat', 'sun', 'mon' ,'fri']).
flight(17.20 , 21.40 , 'DL047' , 'Chicago' , 'Miami' , ['sun', 'tue']).
flight(9.00 , 11.18 , 'DL044' , 'Chicago' , 'NewYork' , ['sat', 'mon', 'wed', 'fri']).
flight(15.00 , 17.18 , 'DL045' , 'Chicago' , 'NewYork' , ['sun', 'tue']).
flight(5.00 , 16.55 , 'DL052' , 'Chicago' , 'Paris' , ['sat', 'sun', 'tue', 'thu']).
flight(16.00 , 22.10 , 'DL048' , 'Chicago' , 'SanFrancisco' , ['thu', 'fri']).
flight(20.00 , 2.10 , 'DL049' , 'Chicago' , 'SanFrancisco' , ['sun', 'mon', 'tue']).
flight(7.00 , 8.15 , 'BA128' , 'Edinburgh' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(19.15 , 20.30 , 'BA129' , 'Edinburgh' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(14.00 , 15.50 , 'BA130' , 'Edinburgh' , 'Paris' , ['sat', 'mon', 'tue', 'wed', 'fri']).
flight(3.00 , 15.10 , 'BA131' , 'Edinburgh' , 'SanFrancisco' , ['sat', 'sun', 'mon', 'thu']).
flight(4.30 , 5.30 , 'BA125' , 'Liverpool' , 'London' , ['wed', 'thu', 'fri']).
flight(10.00 , 11.00 , 'BA123' , 'Liverpool' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(16.00 , 17.00 , 'BA124' , 'Liverpool' , 'London' , ['sat', 'sun', 'mon']).
flight(6.00 , 11.20 , 'BA149' , 'London' , 'Alexandria' , ['sun', 'mon', 'wed']).
flight(10.00 , 14.40 , 'BA143' , 'London' , 'Cairo' , ['sat', 'sun', 'tue', 'fri']).
flight(20.00 , 0.40 , 'BA144' , 'London' , 'Cairo' , ['tue', 'thu']).
flight(4.00 , 12.50 , 'BA147' , 'London' , 'Chicago' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(5.00 , 6.15 , 'BA134' , 'London' , 'Edinburgh' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(17.00 , 18.15 , 'BA135' , 'London' , 'Edinburgh' , ['sun', 'wed', 'fri']).
flight(8.40 , 9.40 , 'BA132' , 'London' , 'Liverpool' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(21.00 , 22.00 , 'BA133' , 'London' , 'Liverpool' , ['sun', 'mon', 'thu', 'fri']).
flight(15.00 , 16.35 , 'BA150' , 'London' , 'Lyon ' , ['tue', 'wed', 'thu', 'fri']).
flight(10.00 , 11.00 , 'BA136' , 'London' , 'Manchester' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(5.00 , 13.00 , 'BA138' , 'London' , 'NewYork' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(14.00 , 22.00 , 'BA145' , 'London' , 'NewYork' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(6.30 , 7.40 , 'BA140' , 'London' , 'Paris' , ['mon', 'tue', 'thu', 'fri']).
flight(16.00 , 17.10 , 'BA139' , 'London' , 'Paris' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(17.00 , 19.20 , 'BA141' , 'London' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(15.30 , 2.30 , 'BA146' , 'London' , 'SanFrancisco' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(4.30 , 15.30 , 'BA142' , 'London' , 'Shanghai' , ['mon', 'tue', 'fri']).
flight(11.00 , 22.00 , 'BA137' , 'London' , 'Shanghai' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(14.00 , 1.40 , 'BA148' , 'London' , 'Tokyo' , ['sat', 'sun', 'wed', 'thu']).
flight(2.10 , 3.00 , 'AF122' , 'Lyon' , 'Nice' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(13.30 , 14.20 , 'AF121' , 'Lyon' , 'Nice' , ['sat', 'tue', 'wed', 'thu', 'fri']).
flight(9.00 , 10.05 , 'AF119' , 'Lyon' , 'Paris' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(18.00 , 19.05 , 'AF120' , 'Lyon' , 'Paris' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(11.30 , 12.30 , 'BA126' , 'Manchester' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(18.30 , 19.30 , 'BA127' , 'Manchester' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed']).
flight(8.00 , 12.20 , 'DL056' , 'Miami' , 'Chicago' , ['mon', 'wed', 'fri']).
flight(10.00 , 12.55 , 'DL053' , 'Miami' , 'NewYork' , ['sun', 'mon' ,'tue']).
flight(16.00 , 18.55 , 'DL054' , 'Miami' , 'NewYork' , ['wed', 'thu', 'fri']).
flight(10.00 , 16.25 , 'DL055' , 'Miami' , 'SanFrancisco' , ['sat', 'sun', 'mon', 'wed']).
flight(14.00 , 15.50 , 'AZ103' , 'Milan' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(10.00 , 11.20 , 'AZ101' , 'Milan' , 'Paris' , ['sat', 'sun', 'tue', 'wed']).
flight(16.00 , 17.20 , 'AZ102' , 'Milan' , 'Paris' , ['mon', 'fri']).
flight(1.00 , 2.05 , 'AZ104' , 'Milan' , 'Rome' , ['mon', 'thu', 'fri']).
flight(7.00 , 8.05 , 'AZ099' , 'Milan' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(17.00 , 18.05 , 'AZ100' , 'Milan' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(7.00 , 9.18 , 'DL028' , 'NewYork' , 'Chicago' , ['sat', 'mon', 'tue']).
flight(13.20 , 15.38 , 'DL029' , 'NewYork' , 'Chicago' , ['sat', 'sun', 'thu']).
flight(6.00 , 15.05 , 'DL038' , 'NewYork' , 'Edinburgh' , ['sun', 'wed', 'fri']).
flight(4.00 , 10.50 , 'DL037' , 'NewYork' , 'London' , ['sat', 'mon', 'tue', 'thu']).
flight(13.00 , 22.12 , 'DL041' , 'NewYork' , 'Lyon ' , ['sat', 'mon', 'tue']).
flight(1.00 , 3.55 , 'DL036' , 'NewYork' , 'Miami' , ['tue']).
flight(7.15 , 10.10 , 'DL035' , 'NewYork' , 'Miami' , ['wed', 'thu', 'fri']).
flight(12.00 , 14.55 , 'DL034' , 'NewYork' , 'Miami' , ['sat', 'sun', 'mon']).
flight(11.00 , 17.50 , 'DL040' , 'NewYork' , 'Paris' , ['sun', 'wed', 'thu', 'fri']).
flight(10.15 , 18.30 , 'DL039' , 'NewYork' , 'Rome' , ['sat', 'mon', 'tue', 'thu']).
flight(8.00 , 14.32 , 'DL030' , 'NewYork' , 'SanFrancisco' , ['sun', 'mon']).
flight(10.00 , 16.32 , 'DL031' , 'NewYork' , 'SanFrancisco' , ['wed', 'fri']).
flight(18.00 , 0.32 , 'DL032' , 'NewYork' , 'SanFrancisco' , ['thu']).
flight(23.30 , 6.02 , 'DL033' , 'NewYork' , 'SanFrancisco' , ['sat', 'tue']).
flight(5.00 , 19.50 , 'DL043' , 'NewYork' , 'Shanghai' , ['sat', 'mon', 'wed', 'fri']).
flight(0.00 , 13.45 , 'DL042' , 'NewYork' , 'Tokyo' , ['sat', 'sun', 'tue', 'thu']).
flight(20.00 , 20.50 , 'AF118' , 'Nice' , 'Lyon ' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(5.00 , 6.20 , 'AF117' , 'Nice' , 'Paris' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(14.30 , 15.50 , 'AF116' , 'Nice' , 'Paris' , ['sat', 'sun', 'fri']).
flight(9.00 , 10.05 , 'AF105' , 'Paris' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(22.00 , 23.05 , 'AF106' , 'Paris' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(7.00 , 8.10 , 'AF114' , 'Paris' , 'Lyon ' , ['mon', 'tue', 'wed', 'thu']).
flight(14.00 , 15.10 , 'AF115' , 'Paris' , 'Lyon ' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(12.00 , 20.30 , 'AF107' , 'Paris' , 'NewYork' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(17.30 , 2.00 , 'AF108' , 'Paris' , 'NewYork' , ['sat', 'sun', 'fri']).
flight(11.00 , 12.20 , 'AF112' , 'Paris' , 'Nice' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(16.00 , 17.20 , 'AF113' , 'Paris' , 'Nice' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(10.00 , 12.00 , 'AF110' , 'Paris' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(18.00 , 20.00 , 'AF109' , 'Paris' , 'Rome' , ['sun', 'tue', 'wed', 'fri']).
flight(4.00 , 15.55 , 'AF111' , 'Paris' , 'Shanghai' , ['sat', 'mon']).
flight(12.00 , 12.30 , 'MS026' , 'PortSaid' , 'Alexandria' , ['sun', 'mon', 'wed']).
flight(14.45 , 15.15 , 'MS027' , 'PortSaid' , 'Alexandria' , ['sat', 'tue', 'thu']).
flight(11.00 , 11.20 , 'MS024' , 'PortSaid' , 'Cairo' , ['sat', 'mon']).
flight(14.10 , 14.30 , 'MS025' , 'PortSaid' , 'Cairo' , ['wed', 'fri']).
flight(1.00 , 3.30 , 'AZ091' , 'Rome' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(11.30 , 14.00 , 'AZ090' , 'Rome' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(8.00 , 9.05 , 'AZ094' , 'Rome' , 'Milan' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(22.00 , 23.05 , 'AZ095' , 'Rome' , 'Milan' , ['mon', 'wed', 'thu', 'fri']).
flight(4.00 , 13.48 , 'AZ088' , 'Rome' , 'NewYork' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(17.00 , 2.48 , 'AZ089' , 'Rome' , 'NewYork' , ['tue', 'wed', 'fri']).
flight(8.00 , 10.00 , 'AZ086' , 'Rome' , 'Paris' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(20.00 , 22.00 , 'AZ087' , 'Rome' , 'Paris' , ['mon', 'tue', 'thu', 'fri']).
flight(11.00 , 12.00 , 'AZ092' , 'Rome' , 'Venice' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(18.00 , 19.00 , 'AZ093' , 'Rome' , 'Venice' , ['sat', 'mon', 'wed', 'fri']).
flight(7.00 , 13.10 , 'DL059' , 'SanFrancisco' , 'Chicago' , ['tue', 'wed', 'thu']).
flight(14.00 , 20.10 , 'DL060' , 'SanFrancisco' , 'Chicago' , ['sat', 'sun', 'fri']).
flight(11.00 , 17.25 , 'DL061' , 'SanFrancisco' , 'Miami' , ['sun', 'mon' ,'wed', 'thu']).
flight(6.00 , 12.32 , 'DL057' , 'SanFrancisco' , 'NewYork' , ['wed', 'thu', 'fri']).
flight(13.00 , 19.32 , 'DL058' , 'SanFrancisco' , 'NewYork' , ['sat', 'sun', 'mon']).
flight(2.00 , 16.30 , 'CA070' , 'Shanghai' , 'Cairo' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(7.00 , 21.30 , 'CA068' , 'Shanghai' , 'Cairo' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(13.30 , 4.00 , 'CA069' , 'Shanghai' , 'Cairo' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(6.00 , 19.45 , 'CA080' , 'Shanghai' , 'Chicago' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(15.00 , 4.45 , 'CA081' , 'Shanghai' , 'Chicago' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(0.40 , 13.20 , 'CA071' , 'Shanghai' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(5.30 , 18.10 , 'CA072' , 'Shanghai' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(14.00 , 2.40 , 'CA073' , 'Shanghai' , 'London' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(1.00 , 15.50 , 'CA079' , 'Shanghai' , 'NewYork' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(10.00 , 0.50 , 'CA078' , 'Shanghai' , 'NewYork' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(2.00 , 14.25 , 'CA076' , 'Shanghai' , 'Paris' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(8.00 , 20.25 , 'CA077' , 'Shanghai' , 'Paris' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(6.00 , 19.10 , 'CA074' , 'Shanghai' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(17.00 , 6.10 , 'CA075' , 'Shanghai' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(5.00 , 7.50 , 'CA085' , 'Shanghai' , 'Tokyo' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(12.00 , 14.50 , 'CA082' , 'Shanghai' , 'Tokyo' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(16.00 , 18.50 , 'CA083' , 'Shanghai' , 'Tokyo' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(21.00 , 23.50 , 'CA084' , 'Shanghai' , 'Tokyo' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(12.00 , 21.05 , 'JL066' , 'Tokyo' , 'SanFrancisco' , ['sat', 'sun', 'mon', 'wed', 'thu']).
flight(22.00 , 7.05 , 'JL067' , 'Tokyo' , 'SanFrancisco' , ['sat', 'mon', 'tue', 'thu', 'fri']).
flight(0.00 , 2.50 , 'JL063' , 'Tokyo' , 'Shanghai' , ['sun', 'tue', 'thu', 'fri']).
flight(6.10 , 9.00 , 'JL064' , 'Tokyo' , 'Shanghai' , ['sun', 'mon', 'tue', 'wed']).
flight(9.00 , 11.50 , 'JL065' , 'Tokyo' , 'Shanghai' , ['sat', 'thu', 'fri']).
flight(20.00 , 22.50 , 'JL062' , 'Tokyo' , 'Shanghai' , ['sat', 'sun', 'mon', 'wed']).
flight(5.00 , 6.00 , 'AZ096' , 'Venice' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(14.00 , 15.00 , 'AZ097' , 'Venice' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
flight(19.40 , 20.40 , 'AZ098' , 'Venice' , 'Rome' , ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']).
