#include "macros.hpp"
/*
    Project Reality ArmA 3

    Author: NetFusion

    Description:
    -

    Parameter(s):
    None

    Returns:
    None
*/
[QGVAR(GroupTypes), missionConfigFile >> "PRA3" >> "GroupTypes"] call CFUNC(loadSettings);

GVAR(squadIds) = ("true" configClasses (configFile >> "CfgWorlds" >> "GroupCompany")) apply {getText (_x >> "name")};

GVAR(restirctSideSwitchRestrictionCount) = getNumber(missionConfigFile >> "PRA3" >> "restirctSideSwitchRestrictionCount");
GVAR(restirctSideSwitchRestrictionTime) = getNumber(missionConfigFile >> "PRA3" >> "restirctSideSwitchRestrictionTime");
GVAR(isTimeUnlocked) = 0;