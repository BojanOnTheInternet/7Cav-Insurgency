waitUntil { time > 0 };

//EOS SYSTEM
[]execVM "eos\OpenMe.sqf";

#include "core\modules\cacheScript\fn\fn.sqf"
#include "core\modules\cacheScript\fn\cacheFn.sqf"
#include "core\modules\cacheScript\fn\KRON_Str.sqf"
#ifndef execNow
#define execNow call compile preprocessFileLineNumbers
#endif
execNow "core\init.sqf";