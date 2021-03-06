#include "macros.hpp"
/*
    Project Reality ArmA 3

    Author: joko // Jonas, NetFusion

    Description:
    Init FOB system

    Parameter(s):
    None

    Returns:
    None
*/
[QGVAR(FOB), missionConfigFile >> QPREFIX >> "cfgFOB"] call CFUNC(loadSettings);

/*
 * ACTIONS
 */
 {
     private _objectType = getText (_x >> "FOBBoxObject");
     private _fobObjectTypes = getArray (_x >> "FOBObjects");
     [QLSTRING(PlaceFOB), _objectType, 3, {
         [QGVAR(isFOBPlaceable), FUNC(canPlaceFOB), [_target], 5, QGVAR(ClearFOBPlaceable)] call CFUNC(cachedCall);
     }, {
         [_this select 0] call FUNC(placeFOB);
         {QGVAR(ClearFOBPlaceable) call CFUNC(localEvent);} call CFUNC(execNextFrame);
     }] call CFUNC(addAction);

     [QLSTRING(FOBTakeDown), (_fobObjectTypes select 0) select 0, 3, {
         (_target getVariable [QGVAR(pointId), ""]) != ""
     }, {
         [_this select 0] call FUNC(destroyFOB);
     }] call CFUNC(addAction);
 } forEach ("true" configClasses (missionConfigFile >> QPREFIX >> "Sides"));
