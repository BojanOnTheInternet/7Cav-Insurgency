if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiaryRecord ["diary", ["Unit callsigns",
"
<br/><font face=PuristaSemiBold' size='12'>Personnel</font>
<br/>
<font face='EtelkaMonospacePro' size='10'>
<br/>JTAC                           Infidel
<br/>Logistics/FOB Ops              ATLAS-4
<br/>Field Medical                  ATLAS-1/2
<br/>Air traffic control            Telos Tower
<br/></font>
<br/><font face=PuristaSemiBold' size='12'>Transport Aircraft</font>
<br/>
<font face='EtelkaMonospacePro' size='10'>
<br/>UH-60 Blackhawk                Buffalo 1/2
<br/>MH-6 Little Bird               Raven
<br/>CH-47 Chinook                  Grizzly
<br/>V-44X Blackfish (transport)    Titan
</font>
<br/>
<br/><font face=PuristaSemiBold' size='12'>Attack Aircraft</font>
<br/>
<font face='EtelkaMonospacePro' size='10'>
<br/>A-10 Thunderbolt               Hog
<br/>F-16 Fighting Falcon           Eagle
<br/>V-44X Blackfish (armed)        Spectre
<br/>AH-6 Attack Little Bird        Sparrow
<br/>AH-64 Apache                   Raider
</font>
<br/>
<br/>
<br/><font face=PuristaSemiBold' size='12'>Armor</font>
<br/>
<font face='EtelkaMonospacePro' size='10'>
<br/>M1 Abramms                     Sabre 1/2
<br/>Armored personnel carriers     Banshee 1/2/3/4
</font>
<br/>
"
]];

player createDiaryRecord ["diary", ["Radio Channels",
"
<font face='EtelkaMonospacePro' size='10'><br/>01 - Gunslinger Platoon Net</font>
<br/>            Used to communicate between infantry squads in field
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>02 - Aviation</font>
<br/>            Used for air to air communications and CTAF/Air Traffic Control
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>03 thru 09 - Other Platoon Nets</font>
<br/>            Used whenever there is an MCC or multiple platoons, also utilized if a Platoon comes in for a Platoon FTX
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>10 / 11 - IDF-1 and IDF-2</font>
<br/>            Used to conduct indirect fire missions from artillery or mortars
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>12 / 13 - CAS-1 and CAS-2</font>
<br/>            Used to call in fixed-wing or attack rotary close air support
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>14 - Ground-To-Air</font>
<br/>            Used to conduct pick-up requests from logistical aviation units 
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>15 - Logistics</font>
<br/>            Used by ATLAS personnel to dispatch where needed. 
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>16 - FARP Requests</font>
<br/>            Used to communicate with ATLAS personnel when you are inbound to a FARP as to what you need using the FARM acronym. FOXTROT - FUEL (state current fuel state if requesting FOXTROT) / ALPHA - AMMUNITION / ROMEO - REPAIRS / MIKE - MEDICAL (use triage category for multiple casualties) 
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>17 - Convoy</font>
<br/>            Used when conducting a convoy 
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>18 - Zeus</font>
<br/>            Used to communicate with a Zeus if required 
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>19 - CAG</font>
<br/>            Classified 
<br/>
<font face='EtelkaMonospacePro' size='10'><br/>20 - Command</font>
<br/>            Used to coordinate across different platoons or other big picture items 
<br/>
"
]];

if (not (player diarySubjectExists "teamspeak")) then { player createDiarySubject ["teamspeak", "Teamspeak"] };

player createDiaryRecord ["teamspeak", ["Teamspeak server",
"
<br/>Address: ts3.7cav.us
<br/>Password: 7thCavalry
<br/>
<br/>The password is case-sensitive. The first time you connect to the Teamspeak server you must wait for your security level to reach 30 before
you will be able to enter any Teamspeak channels.
<br/>
<br/>Visitors and guests are welcome.
"
]];

player createDiaryRecord ["diary", ["Rules of conduct",
"
<br/>1. No fratricide.
<br/>2. No destruction of friendly equipment.
<br/>3. Players using character slots labelled TEAMSPEAK must be on Teamspeak
<br/>4. Combat Air Patrol and Combat Support must abide by specific rules of engagement
<br/>5. Weapons safe on base
<br/>6. No offensive language, sexual references, drug references, or racism of any kind will be tolerated
<br/>7. No vehicles allowed on runways or landing pads unless it is a support vehicle being used for that purpose
<br/>
<br/>If you see a player in violation of any of the above, contact a moderator or administrator (TeamSpeak).  For more information on these rules, see the billboards at base.
"
]];


player createDiaryRecord ["diary", ["FOB Building",
"
<br/><font face='EtelkaMonospacePro' size='10'>Overview</font>
<br/>Building a FOB involves several modules, which all work together to allow players to build complex and useful FOBs around the map.
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Fortify Truck</font>
<br/>The basic FOB tool is the Fortify Truck, which is an empty flatbed utility vehicle that permits players to place down fortifications using the fortify tool in a radius around it.
In order to place down fortify objects, you must have a fortify tool (looks like a hammer) and be near the Fortify Truck. Proximity to this truck is required for other modules to be activated.
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Ammo Module</font>
<br/>The Ammo Module, a Huron Rearm Pod, allows ATLAS-4 to purchase ammunication crates, similar to the ammo crate spawner at base.
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Vehicle Module</font>
<br/>The Vehicle Module, a Huron Repair Pod, allows ATLAS-4 to purchase limited vehicles for players spawning at the FOB.
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Personnel Module</font>
<br/>The Personnel Module, a Huron Medical Pod, allows ATLAS-4 to enable a mobile spawn, provided enemies are not within 500m of the module. If enemies approach the module, it will disable
and will require manual intervation to renable. Each teleport consumes points, and may be disabled by ATLAS-4 if they are low on supplies.
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Supply Module and Points</font>
<br/>The Supply Module, when activated, adds points to the supply budget. The supply budget is shared by all modules, as well as the fortify items.
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Transporting Modules</font>
<br/>Each crate module can be loaded onto flatbed vehicles, sling loaded by a helicopter, or loaded into certain transport fixed-wing aircraft. They cannot be loaded in the Blackfish.
"
]];

player createDiaryRecord ["diary", ["ZEUS and EOS",
"
<br/><font face='EtelkaMonospacePro' size='10'>Pause AI Spawns</font>
<br/>unitCap = 0;
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Unpause AI Spawns</font>
<br/>unitCap = 150;
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>You may set this to whatever you like, but 0 will prevent new AI from spawning and anything over 150 will allow for bad frames.</font>
<br/><br/>
<br/><font face='EtelkaMonospacePro' size='10'>Please remember to unpause AI before you leave.</font>
"
]];

