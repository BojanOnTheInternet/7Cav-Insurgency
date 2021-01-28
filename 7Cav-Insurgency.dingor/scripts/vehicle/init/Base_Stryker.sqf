params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    _vehicle removeMagazinesTurret ["rhs_mag_200rnd_127x99_mag_Tracer_Red",[0]]; //Removes default ball ammo
    _vehicle removeMagazines "RHS_96Rnd_40mm_MK19_M1001"; //Removes canister ammo from Mk19 variants (has high performance cost)
    for "_i" from 1 to 10 do {_vehicle addMagazineTurret ["rhs_mag_200rnd_127x99_SLAP_mag_Tracer_Red",[0]]}; //Adds 10 magazines of SLAP ammo
    _vehicle addMagazineTurret ["rhsusf_mag_L8A3_16",[0]]; //Adds 1 magazine of smoke countermeasure
    _vehicle loadMagazine [[0], "RHS_M2_CROWS_M151", "rhs_mag_200rnd_127x99_SLAP_mag_Tracer_Red"]; //Loads M2 with SLAP ammo
    [_vehicle, 6] call ace_cargo_fnc_setSpace; //Sets cargo space to 6wd
    [_vehicle, 20] call ace_cargo_fnc_setSize; //Sets cargo size to 20
    [_vehicle, 1, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts; //Adds 1 spare wheel (total of 2)

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    private _inventory = [
        ["rhs_weap_fgm148", 2],
        ["rhs_weap_M136_hp", 2],
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
    } forEach _inventory;

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;
