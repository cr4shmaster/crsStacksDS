getConfig = GetModConfigData
setPrefab = AddPrefabPostInit

-- local crsNoDLCEnabled = not GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) and not GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
local crsAnyDLCEnabled = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) or GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
-- local crsReignOfGiantsEnabled = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local crsShipwreckedEnabled = GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)

-- set stack maxsize of all items
TUNING.STACK_SIZE_LARGEITEM = getConfig("crsChangeLargeStacksSize");
TUNING.STACK_SIZE_MEDITEM = getConfig("crsChangeMediumStacksSize");
TUNING.STACK_SIZE_SMALLITEM = getConfig("crsChangeSmallStacksSize");


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
setPrefab("glommerwings", crsMakeStackable)
setPrefab("minotaurhorn", crsMakeStackable)
setPrefab("tallbirdegg", crsMakeStackable)
setPrefab("deerclops_eyeball", crsMakeStackable)
if crsShipwreckedEnabled then
	setPrefab("doydoyegg", crsMakeStackable)
end
if getConfig("crsRabbitsCanStackToggle") == 1 then
	setPrefab("rabbit", crsMakeStackable)
end
if getConfig("crsBirdsCanStackToggle") == 1 then
	setPrefab("crow", crsMakeStackable)
	setPrefab("robin", crsMakeStackable)
	setPrefab("robin_winter", crsMakeStackable)
end
if getConfig("crsMolesCanStackToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("mole", crsMakeStackable)
end
if getConfig("crsBirdsCanStackToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("parrot_pirate", crsMakeStackable)
	setPrefab("toucan", crsMakeStackable)
	setPrefab("seagull", crsMakeStackable)
	setPrefab("parrot", crsMakeStackable)
	setPrefab("doydoy", crsMakeStackable)
end
if getConfig("crsMoqsuitosCanStackToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("mosquito_poison", crsMakeStackable)
end
if getConfig("crsCrabsCanStackToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("crab", crsMakeStackable)
	setPrefab("lobster", crsMakeStackable)
end
if getConfig("crsFishCanStackToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("jellyfish", crsMakeStackable)
end

-- remove feedable
if getConfig("crsMolesDontDieToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("mole", crsUnmakeFeedable)
end
if getConfig("crsRabbitsDontDieToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("rabbit", crsUnmakeFeedable)
end
if getConfig("crsBirdsDontDieToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("crow", crsUnmakeFeedable)
	setPrefab("robin", crsUnmakeFeedable)
	setPrefab("robin_winter", crsUnmakeFeedable)
end
if getConfig("crsBeesDontDieToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("bee", crsUnmakeFeedable)
	setPrefab("killerbee", crsUnmakeFeedable)
end
if getConfig("crsButterfliesDontDieToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("butterfly", crsUnmakeFeedable)
end
if getConfig("crsMosquitosDontDieToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("mosquito_poison", crsUnmakeFeedable)
end
if getConfig("crsMosquitosDontDieToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("mosquito", crsUnmakeFeedable)
end
if getConfig("crsFishDontDieToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("jellyfish", crsUnmakeFeedable)
end
if getConfig("crsBirdsDontDieToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("toucan", crsUnmakeFeedable)
	setPrefab("parrot_pirate", crsUnmakeFeedable)
	setPrefab("seagull", crsUnmakeFeedable)
	setPrefab("parrot", crsUnmakeFeedable)
	setPrefab("doydoy", crsUnmakeFeedable)
end
if getConfig("crsCrabsDontDieToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("crab", crsUnmakeFeedable)
	setPrefab("lobster", crsUnmakeFeedable)
end

-- remove murder
if getConfig("crsMolesRemoveMurderToggle") == 1 and crsAnyDLCEnabled then
	setPrefab("mole", crsRemoveMurder)
end
if getConfig("crsBirdsRemoveMurderToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("toucan", crsRemoveMurder)
	setPrefab("parrot_pirate", crsRemoveMurder)
	setPrefab("seagull", crsRemoveMurder)
	setPrefab("parrot", crsRemoveMurder)
	setPrefab("doydoy", crsRemoveMurder)
end
if getConfig("crsCrabsRemoveMurderToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("crab", crsRemoveMurder)
	setPrefab("lobster", crsRemoveMurder)
end
if getConfig("crsBeesRemoveMurderToggle") == 1 then
	setPrefab("bee", crsRemoveMurder)
	setPrefab("killerbee", crsRemoveMurder)
end
if getConfig("crsButterfliesRemoveMurderToggle") == 1 then
	setPrefab("butterfly", crsRemoveMurder)
end
if getConfig("crsRabbitsRemoveMurderToggle") == 1 then
	setPrefab("rabbit", crsRemoveMurder)
end
if getConfig("crsFishRemoveMurderToggle") == 1 and crsShipwreckedEnabled then
	setPrefab("jellyfish", crsRemoveMurder)
end
if getConfig("crsBirdsRemoveMurderToggle") == 1 then
	setPrefab("crow", crsRemoveMurder)
	setPrefab("robin", crsRemoveMurder)
	setPrefab("robin_winter", crsRemoveMurder)
end
if getConfig("crsMosquitosRemoveMurderToggle") == 1 then
	setPrefab("mosquito", crsRemoveMurder)
end

-- fixing naughtiness/krampus when murdering stacks
local function giveadditionalnaughtiness(self, inst)
	local onkilledother_old = self.onkilledother
	self.onkilledother = function(self,victim)
		print("givenaughtiness")
		if victim and victim.prefab then
			local stacksize = 1
			if victim.components.stackable then
				print("stack")
				stacksize = victim.components.stackable.stacksize
				print(stacksize)
				if victim.prefab == "pigman" then
					if not victim.components.werebeast or not victim.components.werebeast:IsInWereState() then
						self:OnNaughtyAction(3 * stacksize)
					end
				elseif victim.prefab == "babybeefalo" then
					self:OnNaughtyAction(6 * stacksize)
				elseif victim.prefab == "teenbird" then
					self:OnNaughtyAction(2 * stacksize)
				elseif victim.prefab == "smallbird" then
					self:OnNaughtyAction(6 * stacksize)
				elseif victim.prefab == "beefalo" then
					self:OnNaughtyAction(4 * stacksize)
				elseif victim.prefab == "crow" then
					self:OnNaughtyAction(1 * stacksize)
				elseif victim.prefab == "robin" then
					self:OnNaughtyAction(2 * stacksize)
				elseif victim.prefab == "robin_winter" then
					self:OnNaughtyAction(2 * stacksize)
				elseif victim.prefab == "butterfly" then
					self:OnNaughtyAction(1 * stacksize)
				elseif victim.prefab == "rabbit" then
					self:OnNaughtyAction(1 * stacksize)
				elseif victim.prefab == "tallbird" then
					self:OnNaughtyAction(2 * stacksize)
				elseif victim.prefab == "bunnyman" then
					self:OnNaughtyAction(3 * stacksize)
				elseif victim.prefab == "penguin" then
					self:OnNaughtyAction(2 * stacksize)
				end
			end
		end
	end
end

AddComponentPostInit("kramped",giveadditionalnaughtiness)
