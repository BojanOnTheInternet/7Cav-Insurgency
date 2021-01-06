[_this select 0,{
	_this select 0 setPylonLoadOut ["pylon3", "rhsusf_mag_gau19_melb_right", true];
	_this select 0 setPylonLoadOut ["pylon2", "rhsusf_mag_gau19_melb_left", true];
	_this select 0 removeweaponTurret ["RHS_weap_m134_pylon",[-1]];
}] call vehicle_fnc_respawnVehicleInitialize;
[_this select 0, 300] call vehicle_fnc_respawnVehicleWhenKilled;
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