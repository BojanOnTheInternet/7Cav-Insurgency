if (isServer || isDedicated) then {

private["_mkrs", "_x", "_randMkr", "_dist", "_pos", "_m", "_decrease", "_wait", "_cacheHouses", "_tarHouse", "_cachePos", "_string"];

INS_mkrArr = [];
publicVariable "INS_mkrArr";
INS_bluScore=0;
publicVariable "INS_bluScore";

INS_fnCache = {

	if (typeName _this=="ARRAY") then {
		cache = _this select 0;
		cache spawn { sleep 2; deleteVehicle _this;};
		_killer = _this select 1;

		switch (side _killer) do {
			case WEST:{INS_bluScore = INS_bluScore + 1; publicVariable "INS_bluScore"; _this call cacheDie;};
			case EAST:{INS_bluScore = INS_bluScore + 1; publicVariable "INS_bluScore"; _this call cacheDie;};
			case RESISTANCE:{INS_bluScore = INS_bluScore + 1; publicVariable "INS_bluScore"; _this call cacheDie;};
			case CIVILIAN:{INS_bluScore = INS_bluScore + 1; publicVariable "INS_bluScore"; _this call cacheDie;};
			default {INS_bluScore = INS_bluScore + 1; publicVariable "INS_bluScore"; _this call cacheDie;};
		};
	};

	if (count INS_mkrArr > 0) then {
		{deleteMarker _x} forEach INS_mkrArr
	};
	
	publicVariable "INS_mkrArr";
	_cities = call SL_mkrAreas;
	_cacheTown = selectRandom _cities;
	_cityPos = markerPos _cacheTown;
	diag_log format["Placeholder: %1",_cityPos];

	_cityRadA = markerSize _cacheTown select 0;
	diag_log format["Size mkr A: %1",_cityRadA];

	_cityRadB = markerSize _cacheTown select 1;
	diag_log format["Size mkr B: %1",_cityRadB];

	if (_cityRadB >_cityRadA) then {
		_cityRadA = _cityRadB;
	};

	_cacheHouses = [_cityPos, _cityRadA] call SL_findHouses;

	while {count _cacheHouses == 0} do {
		sleep 2;
		diag_log format["Error mkr: %1",count _cacheHouses];

		_cities = call SL_mkrAreas;
		_cacheTown = selectRandom _cities;
		_cityPos = markerPos _cacheTown;
		_cityRadA = markerSize _cacheTown select 0;
		_cityRadB = markerSize _cacheTown select 1;

		if (_cityRadB>_cityRadA) then {
			_cityRadA=_cityRadB;
		};

		_cacheHouses=[_cityPos,_cityRadA]call SL_findHouses;
	
	};

	_tarHouse = _cacheHouses select(random((count _cacheHouses) - 1));
	_cachePos = [_tarHouse] call SL_randHousePos;
	sleep 1;
	cache = createVehicle["Box_FIA_Wps_F",_cachePos,[],0,"NONE"];
	publicVariable "cache";
	cache setDamage 0;
	clearItemCargoGlobal cache;
	cache addMPEventHandler["MPKilled", {_this spawn INS_fnCache}];
	cache setPos _cachePos;
	cache setDamage 0;

	if (INS_bluScore == (paramsArray select 1)) then {
		end_title = {titleText["!All caches have been destroyed!", "PLAIN"];hint "All caches have been destroyed! Mission ending in 20 seconds...";};
		[nil,"end_title",nil,true] spawn BIS_fnc_MP;
		sleep 20;
		"EveryoneWon" remoteExec ["BIS_fnc_endMissionServer", 2]

	};

	if(!isMultiplayer) then {
		sleep 2;
		_m=createMarker[format["box%1",random 1000],getPosATL cache];_m setMarkerShape "ICON";_m setMarkerType "mil_dot";_m setMarkerColor "ColorRed";_m setMarkerAlpha 1;
	};

};

true spawn INS_fnCache;

};