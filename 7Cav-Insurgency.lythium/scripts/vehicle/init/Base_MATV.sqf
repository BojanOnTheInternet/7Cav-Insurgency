params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    _vehicle removeMagazinesTurret ["rhs_mag_762x51_M240_200",[0]]; //Removes default magzines
    _vehicle removeMagazines "RHS_48Rnd_40mm_MK19_M1001"; //Removes canister ammo from Mk19 variants
    for "_i" from 1 to 4 do {_vehicle addMagazineTurret ["rhs_mag_762x51_M240_1200",[0]]}; //Adds n magazines
    _vehicle loadMagazine [[0], "rhs_weap_m240_m113", "rhs_mag_762x51_M240_1200"]; //Loads turret magazine
    [_vehicle, 4] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, 40] call ace_cargo_fnc_setSize; //Sets cargo size
    [_vehicle, 1, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts; //Adds spare wheel
    _vehicle setPlateNumber "1/7 Cav"; //Set plate number

	[
	_vehicle,
	[], 
	["hide_ogpkover",0,"hide_ogpknet",1,"hide_ogpkbust",0,"hide_rhino",1,"DoorLF",0,"DoorRF",0,"DoorLB",0,"DoorRB",0,"DUKE_Hide",1,"hide_spare",0]
	] call BIS_fnc_initVehicle; //Handles vehicle appearnence

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    private _inventory = [ //Defines vehicle inventory
        ["rhs_weap_M136_hp", 4],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 1],
        ["ACE_Clacker", 1],
        ["SatchelCharge_Remote_Mag", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32],
        ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 8],
        ["rhsusf_100Rnd_762x51_m62_tracer", 8],
        ["rhs_mag_M433_HEDP", 12],
        ["rhs_mag_m713_Red", 4],
        ["ACE_HuntIR_M203", 2],
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _vehicle addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;
