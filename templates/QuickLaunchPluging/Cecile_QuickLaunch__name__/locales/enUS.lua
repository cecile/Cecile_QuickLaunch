----------------------------------------------------------------------------------------------------
-- localized English ({{name}} module) strings
--

--get the add-on engine
local Engine = _G.Cecile_QuickLaunch;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(Engine.Name, "enUS", true);
if not L then return; end

--Items module
L["{{upper name}}"] = "{{name}}"
L["{{upper name}}_NAME"] = "{{name}}"
L["{{upper name}}_MODULE"] = "{{name}}"
L["{{upper name}}_TOKEN"] = "{{name}} Token"
L["{{upper name}}_TOKEN_DESC"] = "Change the {{name}} Token"
L["{{upper name}}_HELP_ITEM"] = "Press %s to use,\n %s to cancel."
