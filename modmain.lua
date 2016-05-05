-- set stack maxsize of all items
TUNING.STACK_SIZE_LARGEITEM = GetModConfigData("crsChangeLargeStacksSize");
TUNING.STACK_SIZE_MEDITEM = GetModConfigData("crsChangeMediumStacksSize");
TUNING.STACK_SIZE_SMALLITEM = GetModConfigData("crsChangeSmallStacksSize");

local crsNoDLCEnabled = not GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) and not GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
local crsAnyDLCEnabled = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) or GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
local crsReignOfGiantsEnabled = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local crsShipwreckedEnabled = GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)

local function crsMakeStackable(inst)
 inst:AddComponent("stackable")
 inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
end

local function crsUnmakeFeedable(inst)
 -- inst:RemoveComponent("eater")
 inst:RemoveComponent("perishable")
 inst.components.inventoryitem:SetOnPutInInventoryFn(function(inst)
  if oninventory then
   oninventory(inst)
  end
  end)
 inst.components.inventoryitem:SetOnDroppedFn(function(inst)
  if ondropped then
   ondropped(inst)
  end
  end)
end

local function crsRemoveMurder(inst)
 if inst.components.health then
  inst.components.health.canmurder = false
 end
end
 
 -- make stackable
 AddPrefabPostInit("minotaurhorn", crsMakeStackable)
 AddPrefabPostInit("tallbirdegg", crsMakeStackable)
 AddPrefabPostInit("deerclops_eyeball", crsMakeStackable)
 if crsShipwreckedEnabled then
  AddPrefabPostInit("doydoyegg", crsMakeStackable)
 end
 if GetModConfigData("crsRabbitsCanStackToggle") then
  AddPrefabPostInit("rabbit", crsMakeStackable)
 end
 if GetModConfigData("crsBirdsCanStackToggle")then
  AddPrefabPostInit("crow", crsMakeStackable)
  AddPrefabPostInit("robin", crsMakeStackable)
  AddPrefabPostInit("robin_winter", crsMakeStackable)
 end
 if GetModConfigData("crsMolesCanStackToggle") and (crsAnyDLCEnabled) then
  AddPrefabPostInit("mole", crsMakeStackable)
 end
 if GetModConfigData("crsBirdsCanStackToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("parrot_pirate", crsMakeStackable)
  AddPrefabPostInit("toucan", crsMakeStackable)
  AddPrefabPostInit("seagull", crsMakeStackable)
  AddPrefabPostInit("parrot", crsMakeStackable)
  AddPrefabPostInit("doydoy", crsMakeStackable)
 end
 if GetModConfigData("crsMoqsuitosCanStackToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("mosquito_poison", crsMakeStackable)
 end
 if GetModConfigData("crsCrabsCanStackToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("crab", crsMakeStackable)
  AddPrefabPostInit("lobster", crsMakeStackable)
 end
 if GetModConfigData("crsFishCanStackToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("jellyfish", crsMakeStackable)
 end
 
 -- remove feedable
 if GetModConfigData("crsMolesDontDieToggle") and (crsAnyDLCEnabled) then
  AddPrefabPostInit("mole", crsUnmakeFeedable)
 end
 if GetModConfigData("crsRabbitsDontDieToggle") and (crsAnyDLCEnabled) then
  AddPrefabPostInit("rabbit", crsUnmakeFeedable)
 end
 if GetModConfigData("crsBirdsDontDieToggle") and (crsAnyDLCEnabled) then
  AddPrefabPostInit("crow", crsUnmakeFeedable)
  AddPrefabPostInit("robin", crsUnmakeFeedable)
  AddPrefabPostInit("robin_winter", crsUnmakeFeedable)
 end
 if GetModConfigData("crsBeesDontDieToggle") and (crsAnyDLCEnabled) then
  AddPrefabPostInit("bee", crsUnmakeFeedable)
  AddPrefabPostInit("killerbee", crsUnmakeFeedable)
 end
 if GetModConfigData("crsButterfliesDontDieToggle") and (crsAnyDLCEnabled) then
  AddPrefabPostInit("butterfly", crsUnmakeFeedable)
 end
 if GetModConfigData("crsMosquitosDontDieToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("mosquito_poison", crsUnmakeFeedable)
 end
 if GetModConfigData("crsMosquitosDontDieToggle") and (crsAnyDLCEnabled) then
  AddPrefabPostInit("mosquito", crsUnmakeFeedable)
 end
 if GetModConfigData("crsFishDontDieToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("jellyfish", crsUnmakeFeedable)
 end
 if GetModConfigData("crsBirdsDontDieToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("toucan", crsUnmakeFeedable)
  AddPrefabPostInit("parrot_pirate", crsUnmakeFeedable)
  AddPrefabPostInit("seagull", crsUnmakeFeedable)
  AddPrefabPostInit("parrot", crsUnmakeFeedable)
  AddPrefabPostInit("doydoy", crsUnmakeFeedable)
 end
 if GetModConfigData("crsCrabsDontDieToggle") and crsShipwreckedEnabled then
  AddPrefabPostInit("crab", crsUnmakeFeedable)
  AddPrefabPostInit("lobster", crsUnmakeFeedable)
 end

 -- remove murder
 if GetModConfigData("crsMolesRemoveMurderToggle") == 1 and (crsAnyDLCEnabled) then
  AddPrefabPostInit("mole", crsRemoveMurder)
 end
 if GetModConfigData("crsBirdsRemoveMurderToggle") == 1 and crsShipwreckedEnabled then
  AddPrefabPostInit("toucan", crsRemoveMurder)
  AddPrefabPostInit("parrot_pirate", crsRemoveMurder)
  AddPrefabPostInit("seagull", crsRemoveMurder)
  AddPrefabPostInit("parrot", crsRemoveMurder)
  AddPrefabPostInit("doydoy", crsRemoveMurder)
 end
 if GetModConfigData("crsCrabsRemoveMurderToggle") == 1 and crsShipwreckedEnabled then
  AddPrefabPostInit("crab", crsRemoveMurder)
  AddPrefabPostInit("lobster", crsRemoveMurder)
 end
 if GetModConfigData("crsBeesRemoveMurderToggle") == 1 then
  AddPrefabPostInit("bee", crsRemoveMurder)
  AddPrefabPostInit("killerbee", crsRemoveMurder)
 end
 if GetModConfigData("crsButterfliesRemoveMurderToggle") == 1 then
  AddPrefabPostInit("butterfly", crsRemoveMurder)
 end
 if GetModConfigData("crsRabbitsRemoveMurderToggle") == 1 then
  AddPrefabPostInit("rabbit", crsRemoveMurder)
 end
 if GetModConfigData("crsFishRemoveMurderToggle") == 1 and crsShipwreckedEnabled then
  AddPrefabPostInit("jellyfish", crsRemoveMurder)
 end
 if GetModConfigData("crsBirdsRemoveMurderToggle") == 1 then
  AddPrefabPostInit("crow", crsRemoveMurder)
  AddPrefabPostInit("robin", crsRemoveMurder)
  AddPrefabPostInit("robin_winter", crsRemoveMurder)
 end
 if GetModConfigData("crsMosquitosRemoveMurderToggle") == 1 then
  AddPrefabPostInit("mosquito", crsRemoveMurder)
 end
