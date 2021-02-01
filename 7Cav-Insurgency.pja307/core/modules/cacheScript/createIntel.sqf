private ["_intel", "_cities", "_city", "_cityName", "_cityPos", "_cityRadA", "_cityRadB", "_cityType", "_cityAngle", "_intelHouses", "_intelItem", "_tarHouse", "_iPos", "_m"];

XD_cityAreas={
private["_locations","_cityTypes","_randLoc","_x","_i","_cities"];
_i=0;
_cities=[];
_locations=configFile>>"CfgWorlds">>worldName>>"Names";
_cityTypes = ["FlatArea","FlatAreaCity","FlatAreaCitySmall","Hill","NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage","StrongpointArea","VegetationFir"];
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

XD_randHousePos={
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

XD_newIntel={
	private["_intelItems", "_intel", "_used", "_ID", "_cases", "_case", "_cache", "_marker"];
	_intelItems=["Land_Laptop_unfolded_F","Land_Suitcase_F","Land_File_research_F"];
	_intel = _this select 0;
	_used =_this select 1;
	_ID =_this select 2;
	_marker = _this select 3;
	deleteMarker _marker;
	_cases=nearestObjects[getPosATL player,_intelItems,3];
	if(count _cases==0)exitWith{};
	_intel removeAction _ID;
	_case=_cases select 0;
	if isNull _case exitWith{};
	deleteVehicle _case;player groupChat "I have obtained Russian intel.";
	_cache=cache;
	if(isNil "_cache")exitWith{hint "Intel suggests this place is clean.  Better check elsewhere.";};
	[nil,"iHint",true,false]spawn BIS_fnc_MP;
	[_cache,"addIMkr",false,false]spawn BIS_fnc_MP;
	[] execVM "core\modules\cacheScript\createIntel.sqf";
};

addPickupAction={
	private["_object", "_screenMsg", "_intel_marker"];
	_object = _this select 0;
	_screenMsg = _this select 1;
	_intel_marker = _this select 2;
	if (isNull _object) exitWith{};
	_object addAction[_screenMsg, "call XD_newIntel", _intel_marker];
};

//////////

_cities = call XD_cityAreas;
_city = selectRandom _cities;
_intelItem = "Land_PCSet_01_case_F";

_cityName = _city select 0;
_cityPos = _city select 1;
_cityRadA = _city select 2;
_cityRadB = _city select 3;
_cityType = _city select 4;
_cityAngle = _city select 5;

if (_cityRadB > _cityRadA) then 
{
	_cityRadA = _cityRadB;
};

_intelHouses = [_cityPos, _cityRadA] call SL_findHouses;

if (count _intelHouses > 0) then {

_tarHouse = _intelHouses select(random((count _intelHouses)-1));
_iPos = [_tarHouse] call XD_randHousePos;
_intel = createVehicle[_intelItem, [(_iPos select 0), (_iPos select 1), (_iPos select 2 + 0.07)], [], 0, "None"];

_m = createMarker["Intel", getPosATL _intel];
_m setMarkerShape "ICON";_m setMarkerType "hd_dot";_m setMarkerColor "ColorRed";_m setMarkerText "Intel";

//[_intel, "<t color='#FF0000'>Gather INTEL</t>", "Intel"] remoteExec ["addPickupAction", 0, true];
[_intel, ["<t color='#FF0000'>Gather INTEL</t>", "core\modules\cacheScript\newIntel.sqf", nil, 2, true, true, "", "true", 3.5, false]] remoteExec ["addAction",0, _intel];

} else {
	[] execVM "core\modules\cacheScript\createIntel.sqf";
};