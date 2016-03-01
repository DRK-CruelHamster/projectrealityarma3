#include "macros.hpp"
/*
    Project Reality ArmA 3 - [Script Path]

    Author: joko // Jonas

    Description:
    [Description]

    Parameter(s):
    0: Argument Name <TYPE>

    Returns:
    0: Return Name <TYPE>

    Example:
    -
*/
params [["_event", "", [""]], ["_function", {},[{}]]];

_event = format ["Event_PRA3_", _event];
private _eventFunctions = GVAR(EventNamespace) getVariable _event;
if (isNil "_eventFunctions") then {
    _eventFunctions = [_function];
} else {
    _eventFunctions pushBack _function;
};

GVAR(EventNamespace) setVariable [_event, _eventFunctions];
nil
