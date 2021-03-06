----------------------------------------------------------------------------------------------------
-- localized Spanish (Spells module) strings
--

--get the add-on engine
local Engine = _G.Cecile_QuickLaunch;

--Spanish or Latin America Spanish
local L = LibStub("AceLocale-3.0"):NewLocale(Engine.Name, "esES")
if not L then
  L = LibStub("AceLocale-3.0"):NewLocale(Engine.Name, "esMX");
  if not L then
    return;
  end
end

--Spells module
L["SPELLS"] = "Hechizo"
L["SPELLS_MODULE"] = "Hechizos"
L["SPELLS_TOKEN"] = "Etiqueta hechizos"
L["SPELLS_TOKEN_DESC"] = "Cambia la etiqueta de hechizos"
L["SPELLS_HELP_ITEM"] = "Pulsa %s para lanzar,\n %s para cancelar."