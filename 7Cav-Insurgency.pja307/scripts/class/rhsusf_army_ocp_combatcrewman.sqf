private _state = param [0, "", [""]];

if (_state == "init") then
{
	player setvariable ["ACE_IsEngineer", 2];
	[player] call CLIENT_SetArmorCrewVehiclePermissions;
};

[] call HUD_Infantry_Initialize;

	player setVariable ["SPM_BranchOfService", "infantry"];
	
if (_state == "respawn") then
{
	player setvariable ["ACE_IsEngineer", 2];
};