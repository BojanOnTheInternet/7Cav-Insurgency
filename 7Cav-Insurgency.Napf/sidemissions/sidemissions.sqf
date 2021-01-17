if (!isserver) exitwith {};
waitUntil {time > 60};

//systemChat str sidemarkers;
objectives = ["destroy_tower"];
private _newZone = [];

private _objsel = selectRandom objectives;

{
	_x setMarkerAlpha 0;
} foreach sidemarkers;

sleep 2;

switch (_objsel) do
{
	case "destroy_tower": {
		_type = [] execVM "sidemissions\destroy_tower.sqf";
	};
};
