[_this select 0,
	{
	(_this select 0) removeMagazinesTurret ["rhs_mag_200rnd_127x99_mag_Tracer_Red",[0]];
	for "_i" from 1 to 10 do {(_this select 0) addMagazineTurret ["rhs_mag_200rnd_127x99_SLAP_mag_Tracer_Red",[0]]};
	(_this select 0) addMagazineTurret ["rhsusf_mag_L8A3_16",[0]];
	(_this select 0) loadMagazine [[0], "RHS_M2_CROWS_M151", "rhs_mag_200rnd_127x99_SLAP_mag_Tracer_Red"];
	[_this select 0, 6] call ace_cargo_fnc_setSpace;
	[_this select 0, 20] call ace_cargo_fnc_setSize;
	[_this select 0, 1, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
	}
] call vehicle_fnc_respawnVehicleInitialize;
[_this select 0, 60] call vehicle_fnc_respawnVehicleWhenKilled;
[_this select 0, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;
