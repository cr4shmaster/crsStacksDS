-- set stack maxsize of all items
TUNING.STACK_SIZE_LARGEITEM = GetModConfigData("crsChangeLargeStacksSize");
TUNING.STACK_SIZE_MEDITEM = GetModConfigData("crsChangeMediumStacksSize");
TUNING.STACK_SIZE_SMALLITEM = GetModConfigData("crsChangeSmallStacksSize");

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
 
if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then
 -- make stackable
 -- tallbirdegg
 if GetModConfigData("crsTallbirdEggsCanStackToggle") then
  AddPrefabPostInit("tallbirdegg", crsMakeStackable)
 end
 -- rabbits
 if GetModConfigData("crsRabbitsCanStackToggle") then
  AddPrefabPostInit("rabbit", crsMakeStackable)
 end
 -- moles
 if GetModConfigData("crsMolesCanStackToggle") then
  AddPrefabPostInit("mole", crsMakeStackable)
 end
 -- birds
 if GetModConfigData("crsBirdsCanStackToggle") then
  AddPrefabPostInit("crow", crsMakeStackable)
  AddPrefabPostInit("robin", crsMakeStackable)
  AddPrefabPostInit("robin_winter", crsMakeStackable)
 end
  
 -- remove feedable
 if GetModConfigData("crsRabbitsDontDieToggle") then
  AddPrefabPostInit("rabbit", crsUnmakeFeedable)
 end
 if GetModConfigData("crsMolesDontDieToggle") then
  AddPrefabPostInit("mole", crsUnmakeFeedable)
 end
 if GetModConfigData("crsBirdsDontDieToggle") then
  AddPrefabPostInit("robin", crsUnmakeFeedable)
  AddPrefabPostInit("robin_winter", crsUnmakeFeedable)
  AddPrefabPostInit("crow", crsUnmakeFeedable)
 end
 if GetModConfigData("crsBeesDontDieToggle") then
  AddPrefabPostInit("bee", crsUnmakeFeedable)
 end
 if GetModConfigData("crsButterfliesDontDieToggle") then
  AddPrefabPostInit("butterfly", crsUnmakeFeedable)
 end
 if GetModConfigData("crsMosquitosDontDieToggle") then
  AddPrefabPostInit("mosquito", crsUnmakeFeedable)
 end

 -- remove murder
 if GetModConfigData("crsBeesRemoveMurderToggle") == 1 then
  AddPrefabPostInit("bee", crsRemoveMurder)
 end
 if GetModConfigData("crsButterfliesRemoveMurderToggle") == 1 then
  AddPrefabPostInit("butterfly", crsRemoveMurder)
 end
 if GetModConfigData("crsRabbitsRemoveMurderToggle") == 1 then
  AddPrefabPostInit("rabbit", crsRemoveMurder)
 end
 if GetModConfigData("crsBirdsRemoveMurderToggle") == 1 then
  AddPrefabPostInit("crow", crsRemoveMurder)
  AddPrefabPostInit("robin", crsRemoveMurder)
  AddPrefabPostInit("robin_winter", crsRemoveMurder)
 end
 if GetModConfigData("crsMolesRemoveMurderToggle") == 1 then
  AddPrefabPostInit("mole", crsRemoveMurder)
 end
 if GetModConfigData("crsMosquitosRemoveMurderToggle") == 1 then
  AddPrefabPostInit("mosquito", crsRemoveMurder)
 end
elseif GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
 -- make stackable
 -- birds
 if GetModConfigData("crsBirdsCanStackToggle") then
  AddPrefabPostInit("toucan", crsMakeStackable)
 end
 -- crabs
 if GetModConfigData("crsCrabsCanStackToggle") then
  AddPrefabPostInit("crab", crsMakeStackable)
 end
 -- remove feedable
 -- birds
 if GetModConfigData("crsBirdsDontDieToggle") then
  AddPrefabPostInit("toucan", crsUnmakeFeedable)
 end
 -- crabs
 if GetModConfigData("crsCrabsDontDieToggle") then
  AddPrefabPostInit("crab", crsUnmakeFeedable)
 end
 -- remove murder
 -- birds
 if GetModConfigData("crsBirdsRemoveMurderToggle") == 1 then
  AddPrefabPostInit("toucan", crsRemoveMurder)
 end
 -- crabs
 if GetModConfigData("crsCrabsRemoveMurderToggle") == 1 then
  AddPrefabPostInit("crab", crsRemoveMurder)
 end
end
