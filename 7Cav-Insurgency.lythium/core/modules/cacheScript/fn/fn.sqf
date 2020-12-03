SL_cityAreas={
private["_locations","_cityTypes","_randLoc","_x","_i","_cities"];
_i=0;
_cities=[];
_locations=configFile>>"CfgWorlds">>worldName>>"Names";
_cityTypes=["FlatArea","FlatAreaCity","FlatAreaCitySmall","Hill","NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage","StrongpointArea","VegetationFir"];
for "_x" from 0 to(count _locations-1)do{
_randLoc=_locations select _x;

//Get city info
private["_cityName","_cityPos","_cityRadA","_cityRadB","_cityType","_cityAngle"];
_cityName=getText(_randLoc>>"name");
_cityPos=getArray(_randLoc>>"position");
_cityRadA=getNumber(_randLoc>>"radiusA");
_cityRadB=getNumber(_randLoc>>"radiusB");
_cityType=getText(_randLoc>>"type");
_cityAngle=getNumber(_randLoc>>"angle");

if(_cityType in _cityTypes)then{
_cities set[_i,[_cityName,_cityPos,_cityRadA,_cityRadB,_cityType,_cityAngle]];
_i=_i+1;};
};
_cities;};
SL_mkrAreas={
private["_mkrsTotal","_mkrs","_mkr"];
_mkrs=[];
_mkrsTotal=[];
_mkrsTotal=AllMapMarkers;
{_mkr=[_x,3]call KRON_StrLeft;
if(_mkr=="mkr")then{
_mkrs=_mkrs+[_x];};}forEach _mkrsTotal;
_mkrs;};
SL_findHouses={
private["_center","_radius","_houses"];
_center=_this select 0;
_radius=_this select 1;
_cacheHouses=["Land_i_shed_ind_f","Land_jbad_house_c_5_v3","Land_ffaa_casa_af_2","Land_ffaa_casa_af_3","Land_ffaa_casa_af_6","Land_jbad_house1","Land_jbad_house_1","Land_jbad_house3","Land_jbad_house3_old","Land_jbad_house8","Land_jbad_house_c_10","Land_jbad_a_mosque_small_1"];
_houses=nearestObjects[_center,_cacheHouses,_radius];
_houses;};
SL_housePos={
private["_cbPos"];
_house=_this select 0;
_cbPos=0;
for "_x" from 1 to 100 do{
if(format["%1",(_house buildingPos _x)]!="[0,0,0]")then{_cbPos=_cbPos+1;};
};
_cbPos;};
SL_randHousePos={
private["_house","_count","_pos"];
_house=_this select 0;
_count=[_house]call SL_housePos;
if(_count==0)then{
_pos=getPos _house;}else{
_pos=random _count;
_pos=_house buildingPos _pos;};
if((_pos select 0)==0)then{
_pos=getPos _house;};
_pos};