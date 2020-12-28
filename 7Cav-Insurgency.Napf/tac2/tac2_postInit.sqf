// Init custom Ares modules
[] call tac2_fnc_initAresModules;

// Temp fix for 'god mode' glitch
player addEventHandler ["Respawn", { 
	[player] call ace_common_fnc_resetAllDefaults;
	[TypeFilter_ArmoredVehicles] call utils_fnc_manualDriveInitPlayer;
	}];
