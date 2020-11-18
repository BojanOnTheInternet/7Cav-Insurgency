EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";null=[] execVM "eos\core\spawn_fnc.sqf";onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};
/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,INDEPENDENT,TRUE,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

//null = [["EOSinf_1","EOSinf_2"],[3,1],[2,3,75],[0,0],[0],[0],[0,0],[0,0,350,INDEPENDENT,TRUE]] call EOS_Spawn;
//null = [["EOSmot_1","EOSmot_2"],[0,0],[0,0],[3,1,90],[2,60],[0],[1,0,90],[0,0,350,INDEPENDENT,FALSE]] call EOS_Spawn;
//null = [["BAS_zone_1"],[0,1],[0,2],[0],[1,2],[0,0,INDEPENDENT,TRUE],[0,2,120,TRUE,FALSE]] call Bastion_Spawn;

null =[["mkr1"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr2"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr3"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr4"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr5"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr6"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr7"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr8"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr9"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr10"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr11"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr12"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr13"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr14"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr15"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr16"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr17"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr18"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr19"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr20"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr21"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr22"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr23"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr24"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr25"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr26"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr27"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr28"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr29"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr30"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr31"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr32"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr33"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr34"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr35"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr36"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr37"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr38"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr39"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr40"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr41"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr42"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr43"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr44"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr45"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr46"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr47"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr48"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr49"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr50"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr51"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr52"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr53"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr54"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr55"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr56"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr57"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr58"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr59"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr60"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr61"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr62"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr63"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr64"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr65"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr66"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr67"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr68"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr69"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr70"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr71"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr72"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr73"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr74"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr75"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr76"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr77"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr78"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr79"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr80"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr81"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr82"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr83"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr84"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr85"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr86"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr87"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr88"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr89"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr90"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr91"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr92"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr93"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr94"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr95"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr96"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr97"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr98"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr99"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr100"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr101"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr102"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr103"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr104"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr105"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr106"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr107"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr108"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr109"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr110"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr111"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr112"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr113"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr114"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr115"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr116"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr117"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr118"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr119"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr120"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr121"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr122"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr123"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr124"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr125"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr126"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr127"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr128"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr129"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;
null =[["mkr130"],[1,1],[1,2],[1,2,50],[1,20],[0],[0,0],[5,0,1000,INDEPENDENT,TRUE,FALSE]] call EOS_Spawn;






