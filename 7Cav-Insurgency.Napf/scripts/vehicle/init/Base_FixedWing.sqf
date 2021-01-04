[_this select 0] call vehicle_fnc_respawnVehicleInitialize;
[_this select 0, 420] call vehicle_fnc_respawnVehicleWhenKilled;
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
			hintC "Only Pilots are allowed to operate this vehicle";
			_unit action ["GetOut", _vehicle];
		};
	};
   }
];