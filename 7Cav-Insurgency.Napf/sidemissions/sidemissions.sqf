if (!isserver) exitwith {};
waitUntil {time > 60};

if (count sidemarkers == 0) exitwith { "All side missions completed" remoteExec ["hint"]; };

systemChat str sidemarkers;
objectives = ["destroy_tower"];
private _newZone = [];

// select mission tye
private _objsel = selectRandom objectives;
systemChat str _objsel;

private _mission_mkr = selectRandom sidemarkers;
private _mkrPos = markerPos _mission_mkr;
private _xcoor = (markerPos _mission_mkr select 0);
private _ycoor = (markerPos _mission_mkr select 1);

{
	_x setMarkerAlpha 0;
} foreach sidemarkers;

publicVariable "sidemarkers";
sleep 2;

_newZone = _newZone + [_xcoor,_ycoor];

switch (_objsel) do
{
	case "destroy_tower": {
		_type = [_newZone, "Land_TTowerBig_1_F"] execVM "sidemissions\destroy_tower.sqf";
	};
};

sidemarkers = sidemarkers - [_mission_mkr];
publicVariable "sidemarkers";
