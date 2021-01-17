sleep 30;

//systemChat "Loaded Destroy tower script";

private _newZone = [[], 0, -1, 0, 0, 0.1, 0, [], []] call BIS_fnc_findSafePos;
private _towerPos = _newZone;
private _type = 'rhs_prv13';

while {isOnRoad _towerPos} do {
	_towerPos = _newZone findEmptyPosition [2, 30, _type];
	sleep 0.2;
};

_newZone = _towerPos;

_pool = ["rhs_vdv_sergeant","rhs_vdv_aa","rhs_vdv_at","rhs_vdv_RShG2","rhs_vdv_grenadier","rhs_vdv_grenadier_alt","rhs_vdv_medic","rhs_vdv_machinegunner"];

_objmkr = createMarker ["ObjectiveMkr", _newZone];
"ObjectiveMkr" setMarkerShape "ELLIPSE";
"ObjectiveMkr" setMarkerSize [2, 2];
"ObjectiveMkr" setMarkerShape "ICON";
"ObjectiveMkr" setMarkerType "mil_dot";
"ObjectiveMkr" setMarkerColor "ColorRed";
"ObjectiveMkr" setMarkerText "Radar";

// Spawn Objective Object
_tower = createVehicle [_type, _newZone, [], 0, "NONE"];
waitUntil {sleep 1; alive _tower};

_grp = createGroup [EAST, true];
_grpSize = 12;

for "_x" from 1 to _grpSize do {

	_unitType = _pool select (floor(random(count _pool)));
	_unit = _grp createUnit [_unitType, _newZone, [], 6, "FORM"];

};

null = [_grp, _grp, 50, 4, [], true] call lambs_wp_fnc_taskPatrol;
null = [_grp, "INFskill"] call eos_fnc_grouphandlers;

private _antiair = createVehicle ["LOP_SLA_ZSU234", _newZone, [], 20, "NONE"];
createVehicleCrew _antiair;

taskName = format["side%1",random 1000];

[WEST, [taskName], ["Destroy Radar", "Side mission: Destroy Radar", "missionmarker"], _newZone ,1, 2, true] call BIS_fnc_taskCreate;

//systemChat str taskName;

_tower addMPEventHandler["MPKilled", 
{
	[taskName,"SUCCEEDED"] call BIS_fnc_taskSetState;
	//systemChat str taskName;
	execVM "sidemissions\sidemissions.sqf";
	deleteMarker "ObjectiveMkr";
}
];

