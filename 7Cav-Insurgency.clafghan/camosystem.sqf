
playerIsMoving = false;
["unitIsMoving", {
    _this params ["_isMoving"];
    if (playerIsMoving == _isMoving) exitWith {};
    playerIsMoving = _isMoving;
    ["unitStatusChangedCheckCamoflage"] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

getPlayerStance = "STAND";
["unitInStance", {
    _this params ["_state"];
    if (getPlayerStance == _state) exitWith {};
    getPlayerStance = _state;
    ["unitStatusChangedCheckCamoflage"] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[{
    if !(isNull objectParent player) exitWith {};
    ["unitIsMoving", [speed player != 0]] call CBA_fnc_localEvent;
    ["unitInStance", [stance player]] call CBA_fnc_localEvent;
}, 0] call CBA_fnc_addPerFrameHandler;


surfaceTypeHash = [[

	['#GdtBeach',['dirt']],
	['#GdtDead',['dirt']],
	['#GdtDesert',['dirt']],
	['#GdtKlField',['dirt']],
	['#GdtRedDirt',['dirt']],
	['#GdtDirt',['dirt']],
	['#GdtStratisBeach',['dirt']],
	['#GdtVolcano',['dirt']],
	['#GdtVolcanoBeach',['dirt']],
	['#GdtGrassTall',['green']],
	['#GdtGrassShort',['green']],
	['#GdtForest',['green']],
	['#GdtAsphalt',['urban']],
	['#sand',['dirt']],
	['#SandDesert',['dirt']],
	['#SandBeach',['dirt']],
	['#SandGeneral',['dirt']],
	['#SandBuilding',['dirt']],
	['#gbr_es_tierra2',['dirt']],
	['#gbr_es_tierra3',['dirt']],
	['#gbr_es_tierra1',['dirt']],
	['#gbr_es_tierra12',['urban']],
	['#gbr_es_tierra11',['urban']],
	['#gbr_es_tierra10',['dirt']],
	['#DBTrava',['green']],
	['#D2Grass',['green']],
	['#TKPole',['green']],
	['#TKPlevel',['green']],
	['#TKTrava',['green']],
	['#TKForest',['green']],
	['#ZRPole',['green']],
	['#ZRPlevel',['green']],
	['#ZRTrava',['green']],
	['#GdtRock',['urban']],
	['#Beton',['urban']],
	['#concrete',['urban']],
	['#concrete_out',['urban']],
	['#CRConcrete',['urban']],
	['#GdtConcrete',['urban']],
	['#road',['urban']],
	['#runway_beton',['urban']],
	['#GdtStratisConcrete',['urban']],
	['#surf_roadconcrete',['urban']],
	['#SurfRoadConcrete',['urban']],
	['#UTConcrete',['urban']],
	['#napf_asfalt',['urban']],
	['#napf_gras1',['green']],
	['#napf_schotter',['urban']],
	['#napf_wald1',['green']],
	['#napf_fels',['urban']],
	['#napf_steingras',['urban']],
	['#duala_sand',['dirt']],
	['#duala_grass',['green']],
	['#duala_wood',['dirt']],
	['#duala_rock',['urban']],
	['#duala_stones',['dirt']],
	['#cla_cg_tpatio2',['dirt']],
	['#cla_cg_pebbs1',['dirt']],
	['#cla_cg_stones',['dirt']],
	['#cla_cg_tied',['dirt']],
	['#cla_cg_nieve',['snow']],
	['#Default',['snow']],
	['#lingor_sand',['dirt']],
	['#lingor_grass',['green']],
	['#lingor_wood',['green']],
	['#lingor_rock',['dirt']],
	['#lingor_stones',['dirt']],
	['#dingor_sand',['dirt']],
	['#dingor_rock',['urban']],
	['#dingor_stones',['dirt']]

]] call CBA_fnc_hashCreate;

if (toLower worldName == 'napfwinter') then {
	{[surfaceTypeHash, _x, ['snow']] call CBA_fnc_hashSet} forEach 
		['#napf_gras1',
		'#napf_schotter',
		'#napf_wald1',
		'#napf_fels',
		'#napf_steingras'] 
};

playerCamoMatrix = [];

//Effectiveness of camo pattern vs different types of terrain, from 0 to 1.
// ['Camo Name', [Dirt, Green, Urban, Snow]]

camoPatternHash = [[
	['m81', [0.2, 0.7, 0.1, 0]],
	['DPM', [0.2, 0.7, 0.1, 0]],
	['Tiger Stripe', [0.2, 0.7, 0.1, 0]],
	['Altis Lizard', [0.2, 0.7, 0.1, 0]],
	['Woodland', [0.2, 0.7, 0.1, 0]],
	['VSR', [0.2, 0.7, 0.1, 0]],
	['OEF', [0.7, 0.5, 0.3, 0]],
	['OCP', [0.7, 0.5, 0.3, 0]],
	['Multicam', [0.7, 0.5, 0.3, 0]],
	['MTP', [0.7, 0.5, 0.3, 0]],
	['Atacs-FG', [0.7, 0.5, 0.3, 0]],
	['UCP', [0.6, 0.0, 0.3, 0.20]],
	['ACU', [0.6, 0.0, 0.3, 0.20]],
	['Atacs-AU', [0.6, 0.0, 0.3, 0.20]],
	['RACS', [0.8, 0.0, 0.3, 0]],
	['6CD', [0.8, 0.0, 0.3, 0]],
	['3CD', [0.8, 0.0, 0.3, 0]],
	['Marpat Desert', [0.8, 0.0, 0.3, 0]],
	['Marpat-D', [0.8, 0.0, 0.3, 0]],
	['Marpat', [0.5, 0.5, 0.3, 0]],
	['Marpat-WD', [0.5, 0.5, 0.3, 0]],
	['Winter', [0.0, 0.0, 0.0, 1]],
	['Lush', [0.4, 0.9, 0.0, 0.0]],
	['Full Ghillie (Arid)', [0.9, 0.2, 0.0, 0.0]],
	['Full Ghillie (Semi-Arid)', [0.8, 0.8, 0.0, 0.0]],
	['Full Ghillie', [0.3,0.3,0.3,0.3]],
	['Ghillie Suit', [0.3,0.3,0.3,0.3]],
	['Tropic', [0.0, 0.9, 0.0, 0.0]],
	['CTRG', [0.0, 0.9, 0.0, 0.0]],
	['CADPAT Temperate', [0.0, 0.9, 0.0, 0.0]],
	['CADPAT Arid', [0.8, 0.0, 0.3, 0]],
	['CADPAT Proototype-J', [0.7, 0.5, 0.3, 0]],
	['CADPAT Prototype-J', [0.7, 0.5, 0.3, 0]],
	['Jungle', [0.0, 0.9, 0.0, 0.0]],
	['Ranger Green',[0.2, 0.8, 0.1, 0]],
	['Green',[0.2, 0.8, 0.1, 0]],
	['Olive',[0.2, 0.8, 0.1, 0]],
	['AOR2',[0.5, 0.8, 0.1, 0]],
	['Tan', [0.8, 0.0, 0.3, 0]],
	['Coyote', [0.8, 0.0, 0.3, 0]],
	['Civilian',[0,0,0,0]],
	['Urban',[0.5,0.3,0.7,0.3]]
	
 ]] call CBA_fnc_hashCreate;

patternNames = [camoPatternHash] call CBA_fnc_hashKeys;

updCamoUniform = {
	private _playerUniform = gettext (configfile >> "CfgWeapons" >> uniform player >> "displayName");
	private _playerPatternsWorn = [];
	ghillieMult = 1;

	{
		if ([_x, _playerUniform] call BIS_fnc_inString) then {
			_playerPatternsWorn pushBack _x;
		};
	} forEach patternNames;

	if (isNil {_playerPatternsWorn select 0}) exitWith{playerCamoMatrix = [0.3,0.3,0.3,0.3]};
	
	private _patternMatrix = [camoPatternHash, _playerPatternsWorn select 0] call CBA_fnc_hashGet;
	private _dirtEff = _patternMatrix select 0;
	private _greenEff = _patternMatrix select 1;
	private _urbanEff = _patternMatrix select 2;
	private _snowEff = _patternMatrix select 3;

	{
		private _patternMatrix = [camoPatternHash, _x] call CBA_fnc_hashGet;
		_dirtEff = [_dirtEff, _patternMatrix select 0] call BIS_fnc_arithmeticMean;
		_greenEff = [_greenEff, _patternMatrix select 1] call BIS_fnc_arithmeticMean;
		_urbanEff = [_urbanEff, _patternMatrix select 2] call BIS_fnc_arithmeticMean;
		_snowEff = [_snowEff, _patternMatrix select 3] call BIS_fnc_arithmeticMean;

		if (_x == 'Full Ghillie') then {
			ghillieMult = 1.8;
		};

				if (_x == 'Ghillie Suit') then {
			ghillieMult = 1.7;
		};
	} forEach _playerPatternsWorn;

	playerCamoMatrix = [_dirtEff*ghillieMult, _greenEff*ghillieMult, _urbanEff*ghillieMult, _snowEff*ghillieMult];
};

[] call updCamoUniform;

updCamoCoeff = {
	private _playerSurfaceType = [surfaceTypeHash, surfaceType position player] call CBA_fnc_hashGet;
	private _defaultCamoCoef = 2.5;
	private _camoMult = 1.75;
	private _stanceMult = 1;

	if (isNil {_playerSurfaceType select 0}) then {
		_playerSurfaceType = ['dirt'];
	};

	if (getPlayerStance == 'PRONE') then {
		_stanceMult = 0.6 * (1/ghillieMult)
	};

		if (getPlayerStance == 'CROUCH') then {
		_stanceMult = 0.75
	};
	
	if (_playerSurfaceType isEqualTo ['dirt']) then {
		player setUnitTrait ['camouflageCoef', ((_defaultCamoCoef - (playerCamoMatrix select 0) * _camoMult) * _stanceMult)]; 
	};

	if (_playerSurfaceType isEqualTo ['green']) then {
		player setUnitTrait ['camouflageCoef', ((_defaultCamoCoef - (playerCamoMatrix select 1) * _camoMult) * _stanceMult)];
	};

	if (_playerSurfaceType isEqualTo ['urban']) then {
		player setUnitTrait ['camouflageCoef', ((_defaultCamoCoef - (playerCamoMatrix select 2) * _camoMult) * _stanceMult)];
	};

	if (_playerSurfaceType isEqualTo ['snow']) then {
		player setUnitTrait ['camouflageCoef', ((_defaultCamoCoef - (playerCamoMatrix select 3) * _camoMult) * _stanceMult)];
	};
};

['ace_arsenal_displayClosed', {
	[] call updCamoUniform;
}] call CBA_fnc_addEventHandler;

['unitStatusChangedCheckCamoflage', {
	[] call updCamoCoeff;
}] call CBA_fnc_addEventHandler;