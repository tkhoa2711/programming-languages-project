connect(ew,pasir_ris,tampines).
connect(ew,tampines,simei).
connect(ew,simei,tanah_merah).
connect(ew,tanah_merah,bedok).
connect(ew,bedok,kembangan).
connect(ew,kembangan,eunos).
connect(ew,eunos,paya_lebar).
connect(ew,paya_lebar,aljunied).
connect(ew,aljunied,kallang).
connect(ew,kallang,lavender).
connect(ew,lavender,bugis).
connect(ew,bugis,city_hall).
connect(ew,city_hall,raffles_place).
connect(ew,raffles_place,tanjong_pagar).
connect(ew,tanjong_pagar,outram_park).
connect(ew,outram_park,tiong_bahru).
connect(ew,tiong_bahru,redhill).
connect(ew,redhill,queenstown).
connect(ew,queenstown,commonwealth).
connect(ew,commonwealth,bouna_vista).
connect(ew,bouna_vista,dover).
connect(ew,dover,clementi).
connect(ew,clementi,jurong_east).
connect(ew,jurong_east,chinese_garden).
connect(ew,chinese_garden,lakeside).
connect(ew,lakeside,boon_lay).
connect(ew,boon_lay,pioneer).
connect(ew,pioneer,joo_koon).
connect(cg,tanah_merah,expo).
connect(cg,expo,changi_airport).
connect(ns,jurong_east,bukit_batok).
connect(ns,bukit_batok,bukit_gombak).
connect(ns,bukit_gombak,choa_chu_kang).
connect(ns,choa_chu_kang,yew_tee).
connect(ns,yew_tee,kranji).
connect(ns,kranji,marsiling).
connect(ns,marsiling,woodland).
connect(ns,woodland,admiralty).
connect(ns,admiralty,sembawang).
connect(ns,sembawang,yishun).
connect(ns,yishun,khatib).
connect(ns,khatib,yio_chu_kang).
connect(ns,yio_chu_kang,ang_mo_kio).
connect(ns,ang_mo_kio,bishan).
connect(ns,bishan,braddell).
connect(ns,braddell,toa_payoh).
connect(ns,toa_payoh,novena).
connect(ns,novena,newton).
connect(ns,newton,orchard).
connect(ns,orchard,somerset).
connect(ns,somerset,dhoby_ghaut).
connect(ns,dhoby_ghaut,city_hall).
connect(ns,city_hall,raffles_place).
connect(ns,raffles_place,marina_bay).
connect(cl,dhoby_ghaut,bras_brasah).
connect(cl,bras_brasah,esplanade).
connect(cl,esplanade,promenade).
connect(cl,promenade,nicoll_highway).
connect(cl,nicoll_highway,stadium).
connect(cl,stadium,mountbatten).
connect(cl,mountbatten,dakota).
connect(cl,dakota,paya_lebar).
connect(cl,paya_lebar,macpherson).
connect(cl,macpherson,tai_seng).
connect(cl,tai_seng,bartley).
connect(cl,bartley,serangoon).
connect(cl,serangoon,lorong_chuan).
connect(cl,lorong_chuan,bishan).
connect(cl,bishan,marymount).
connect(cl,marymount,caldecott).
connect(cl,caldecott,botanic_garden).
connect(cl,botanic_garden, farrer_road).
connect(cl,farrer_road, holland_village).
connect(cl,holland_village, bouna_vista).
connect(cl,bouna_vista, one_north).
connect(cl,one_north,kent_ridge).
connect(cl,kent_ridge, haw_par_villa).
connect(cl,haw_par_villa, pasir_panjang).
connect(cl,pasir_panjang, labrador_park).
connect(cl,labrador_park, telok_blangah).
connect(cl,telok_blangah, harbourfront).
connect(cl,promenade, bayfront).
connect(cl,bayfront, marina_bay).
connect(ne,harbourfront,outram_park).
connect(ne,outram_park,chinatown).
connect(ne,chinatown,clarke_quay).
connect(ne,clarke_quay,dhoby_ghaut).
connect(ne,dhoby_ghaut,little_india).
connect(ne,little_india,farrer_park).
connect(ne,farrer_park,boon_keng).
connect(ne,boon_keng,potong_pasir).
connect(ne,potong_pasir,woodleigh).
connect(ne,woodleigh,serangoon).
connect(ne,serangoon,kovan).
connect(ne,kovan,hougang).
connect(ne,hougang,buangkok).
connect(ne,buangkok,sengkang).
connect(ne,sengkang,punggol).

%These are used by findroute
nextto(Line,X,Y) :- connect(Line,X,Y).
nextto(Line,X,Y) :- connect(Line,Y,X).

notinlist(_,[]).
notinlist(X,[Y|T]) :- X\==Y, notinlist(X,T).

% findroute is used by find
findroute(X,Y,[X,Y],Appearlist, Time, Curline) :- nextto(Line,X,Y), notinlist(Y,Appearlist), Curline == Line, Time is 2.
findroute(X,Y,[X,Y],Appearlist, Time, Curline) :- nextto(Line,X,Y), notinlist(Y,Appearlist), Curline \== Line, Time is 7.

findroute(X, Y, [X,Z|T], Appearlist, Time, Curline) :- nextto(Line, X,Z), notinlist(Z,Appearlist),Curline == Line, 
findroute(Z, Y, [Z|T], [Z|Appearlist], Time1, Line), Time is Time1 + 2.

findroute(X, Y, [X,Z|T], Appearlist, Time, Curline) :- nextto(Line, X,Z), notinlist(Z,Appearlist), Curline \== Line,
findroute(Z, Y, [Z|T], [Z|Appearlist], Time1, Line),  Time is Time1 + 7.

% this is to find a route and its travel time between two stations
find(X,Y,Route,Time) :- findroute(X,Y,Route,[X], Time1, nil), Time is Time1 - 2.

% These find all Route between two stations and get the shortest Time and Route
findquickest(X,Y,CurTime,MinTime, ShortestRoute) :- find(X,Y,Route,Time), Time<CurTime, 
!,findquickest(X,Y,Time,MinTime, ShortestRoute).

findquickest(X,Y,CurTime,MinTime, ShortestRoute):- find(X,Y,Route,Time), Time = CurTime, setResult(Route,ShortestRoute, Time, MinTime).

setResult(Route,Route, Time, Time).

% To find the shortest Time and Route between two stations, X,Y are input, MinTime, ShortestRoute are output
shortest(X,Y, MinTime, ShortestRoute) :- findquickest(X,Y,1000,MinTime, ShortestRoute).
