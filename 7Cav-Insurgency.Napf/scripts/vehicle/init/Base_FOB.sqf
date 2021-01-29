
params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    [_vehicle, 100] call cScripts_fnc_addFortifyArea;
    [_vehicle, 26] call ace_cargo_fnc_setSpace;
    [_vehicle, 80] call ace_cargo_fnc_setSize;
    [_vehicle, 5000] call ace_refuel_fnc_setFuel;
    [_vehicle, 600] call ace_rearm_fnc_setSupplyCount;
    
	[
	_vehicle,
	[], 
	["DUKE_Hide",1,"hide_spare",0,"hide_ammoboxes",0,"hide_srchlight_cvr",0]
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
        ["ACE_Fortify", 8],
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

[_vehicle, 1500, 1800] call vehicle_fnc_respawnVehicleWhenAbandoned;
