[_this select 0,
	{
		(_this select 0) addBackpackCargoGlobal ["B_AssaultPack_rgr_Repair", 3];
		[_this select 0, 31] call ace_cargo_fnc_setSpace;

	}
] call vehicle_fnc_respawnVehicleInitialize;
[_this select 0, 60] call vehicle_fnc_respawnVehicleWhenKilled;
[_this select 0, 300] call vehicle_fnc_respawnVehicleWhenAbandoned;

// Permissions for pilots only
private _helicopter = _this select 0;

_helicopter addEventHandler ["GetIn", {
       _vehicle = _this select 0;
       _seat = _this select 1;
       _unit = _this select 2;

	_pilotSeats = [ "driver", "gunner" ];

	if( ( _seat in _pilotSeats ) ) then {

		if( !( _unit getVariable [ "PilotCanFly", false ] ) ) then {
			
			_unit action ["GetOut", _vehicle];
		};
	};
   }
];