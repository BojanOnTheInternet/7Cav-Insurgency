
params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
	_vehicle setvariable ["ace_medical_isMedicalFacility", true, true];
    [_vehicle, 8] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, 40] call ace_cargo_fnc_setSize; //Sets cargo size
    [_vehicle, 1, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts; //Adds spare wheel
    _vehicle setPlateNumber "1/7 Cav"; //Set plate number

	[
	_vehicle,
	[],
	["DUKE_Hide",1]
	] call BIS_fnc_initVehicle; //Handles vehicle appearnence

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    private _inventory = [ //Defines vehicle inventory
        ["ACE_personalAidKit", 32],
        ["ACE_surgicalKit", 8],
        ["ACE_salineIV", 64],
        ["ACE_morphine", 64],
        ["ACE_epinephrine", 64],
        ["ACE_adenosine", 16],
        ["ACE_elasticBandage", 256],
        ["ACE_quikclot", 256],
        ["ACE_CableTie", 32],
        ["ACE_tourniquet", 64],
        ["ACE_splint", 128],
        ["ACE_bodyBag", 16],
        ["ACE_EarPlugs", 8],
        ["ToolKit", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 16],
        ["SmokeShell", 16],
        ["SmokeShellPurple", 16],
        ["Chemlight_red", 32]
    ];

    {
        _x params ["_ammo", "_amount"];
        _vehicle addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;
