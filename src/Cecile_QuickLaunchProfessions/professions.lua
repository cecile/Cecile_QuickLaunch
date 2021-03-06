----------------------------------------------------------------------------------------------------
-- search Professions module

--get the engine and create the module
local Engine = _G.Cecile_QuickLaunch;

--create the modules as submodule of search
local search = Engine.AddOn:GetModule("search");
local mod = search:NewModule("professions");

--debug
local debug = Engine.AddOn:GetModule("debug");

--get the locale
local L=Engine.Locale;

mod.desc = L["PROFESSIONS_MODULE"];

mod.Vars = {
  openToken =  {
    type = "string",
    default = L["PROFESSIONS_OPEN"],
    order = 1,
    label = L["PROFESSIONS_OPEN_TOKEN"],
    desc = L["PROFESSIONS_OPEN_TOKEN_DESC"],
  }
}

--set the mount tooltip
function mod.setTooltip(tooltip,item)

  tooltip:SetSpellByID(item.id);

end

--populate
function mod:PopulateProfessionSpells(profession)

  if profession == nil then
    return;
  end

  --options
  local openToken = mod.Profile.openToken;

  --local vars
  local item , searchableText, remain, start, duration, enable;

  local professionName, icon, rank, numEntries, offset, name;

  local spellID, _;

  professionName, _, _, _, numEntries, offset, _, _, _, _ = _G.GetProfessionInfo(profession);

  for index = offset + 1, offset + numEntries do

    if not _G.IsPassiveSpell(index, _G.BOOKTYPE_PROFESSION) then

      name, rank, icon, _, _, _, spellID = _G.GetSpellInfo(index, _G.BOOKTYPE_PROFESSION);

      if(name) then

        --base text
        searchableText = professionName .. ": ";

        --complete the text
        if rank and not(rank=="") then
          searchableText = searchableText .. name.." ("..rank..")";
        else
          searchableText = searchableText .. name;
        end

        if name == professionName then
          searchableText = searchableText .." ["..openToken.."]";
        end

        --get the cooldown
        start, duration, enable = _G.GetSpellCooldown(index, _G.BOOKTYPE_PROFESSION);

        if start and start>0 and enable==1 then

          remain = duration - (_G.GetTime() - start);
          searchableText = searchableText .. " ["..search.SecondsToClock(remain).."]";
        end

        --add the text and function
        item = { name = name, text = searchableText , id=spellID, type = "spell", icon=icon, tooltipFunc = mod.setTooltip, help=L["PROFESSIONS_HELP_ITEM"]};

        --insert the result
        table.insert(self.items,item);
      end
    end

  end

end

function mod:PopulateProfessionsSpells(...)

  local n = select('#', ...);

  for i = 1, n do
    self:PopulateProfessionSpells(select(i, ...));
  end

end

--refresh the data
function mod:Refresh()

  debug("refreshing Professions data");

  --populate data
  self:PopulateProfessionsSpells(_G.GetProfessions());

  debug("data refreshed");

end
