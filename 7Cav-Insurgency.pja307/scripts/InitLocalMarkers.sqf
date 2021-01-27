waitUntil {!isNull player};
_unit = _this select 0;

if ((typeOf _unit == "B_T_Pilot_F") or (typeOf _unit == "B_Helipilot_F") or (typeOf _unit == "rhsusf_army_ocp_helipilot") or (typeOf _unit == "Cav_B_A_Helicopter_Tra_Pilot_F") or (typeOf _unit == "B_helicrew_F")) then
	{
		_mrk101 = createMarkerLocal["RepairCircle",getMarkerPos "marker_86"];
		_mrk101 setMarkerShapeLocal "ellipse";
		_mrk101 setMarkerColorLocal "ColorWEST";
		_mrk101 setMarkerSizeLocal [50, 50];
		_mrk101 setMarkerAlphaLocal .5;
		
		_mrk102 = createMarkerLocal["RepairPad",getMarkerPos "marker_87"];
		_mrk102 setMarkerTypeLocal "mil_square";
		_mrk102 setMarkerColorLocal "ColorBLACK";
		_mrk102 setMarkerTextLocal "Repair Pad";
		_mrk102 setMarkerSizeLocal [.5, .5];
		
		_mrk103 = createMarkerLocal["Rearm1",getMarkerPos "marker_88"];
		_mrk103 setMarkerTypeLocal "mil_square";
		_mrk103 setMarkerColorLocal "ColorBLACK";
		_mrk103 setMarkerTextLocal "Rearm";
		_mrk103 setMarkerSizeLocal [.5, .5];
		
		_mrk104= createMarkerLocal["Rearm2",getMarkerPos "marker_89"];
		_mrk104 setMarkerTypeLocal "mil_square";
		_mrk104 setMarkerColorLocal "ColorBLACK";
		_mrk104 setMarkerTextLocal "Rearm";
		_mrk104 setMarkerSizeLocal [.5, .5];
		
	};