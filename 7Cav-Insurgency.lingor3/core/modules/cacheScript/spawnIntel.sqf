
private["_mkrs","_intelItems","_unit","_pos","_selectedItem","_intel","_cacheHouses","_cities","_multi","_iCount","_tarHouse","_iPos","_i","_m","_j","_mkr_name"];
intel=[];
publicVariable "intel";
_intelItems = ["Land_Laptop_unfolded_F","Land_Suitcase_F"];
_cities = call SL_cityAreas;

_j = 0;
{ _j = _j + 1;
_cityName = _x select 0;
_cityPos = _x select 1;
_cityRadA = _x select 2;
_cityRadB = _x select 3;
_cityType = _x select 4;
_cityAngle = _x select 5;
if(_cityRadB > _cityRadA) then {_cityRadA = _cityRadB;};
_cacheHouses = [_cityPos,_cityRadA] call SL_findHouses;
diag_log format["%4 City: %1,%2,%3", _cityName, _cityRadA, count _cacheHouses, _j];

for "_i" from 0 to(random(paramsArray select 2))step 1 do{
if(count _cacheHouses>0)then{
_selectedItem = selectRandom _intelItems;
_tarHouse=_cacheHouses select(random((count _cacheHouses)-1));
_iPos = [_tarHouse]call SL_randHousePos;
_intel = createVehicle[_selectedItem,[(_iPos select 0),(_iPos select 1),(_iPos select 2+0.07)],[],0,"None"];

_mkr_name = format["box%1",random 1000];
_m = createMarker[_mkr_name, getPosATL _intel];
_m setMarkerShape "ICON";_m setMarkerType "hd_dot";_m setMarkerColor "ColorYellow";_m setMarkerText "Intel";};

[_intel, "<t color='#FF0000'>Gather INTEL</t>", _mkr_name] remoteExec ["addActionMP", 0, true];
_intel setPos _iPos;
intel set[count intel, _intel];
publicVariable "intel";

};

} forEach _cities;