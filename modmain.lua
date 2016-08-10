-- CREATE SHORTCUTS --

getConfig = GetModConfigData
setPrefab = AddPrefabPostInit

-- local crsNoDLCEnabled = not GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) and not GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
local crsAnyDLCEnabled = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) or GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
-- local crsReignOfGiantsEnabled = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local crsShipwreckedEnabled = GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)

-- SET MAX STACK SIZE --

TUNING.STACK_SIZE_LARGEITEM = getConfig("crsChangeLargeStacksSize");
TUNING.STACK_SIZE_MEDITEM = getConfig("crsChangeMediumStacksSize");
TUNING.STACK_SIZE_SMALLITEM = getConfig("crsChangeSmallStacksSize");

-- ADD STACKABLE COMPONENT --

local function crsMakeStackable(inst)
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
end

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

-- REMOVE FEEDABLE COMPONENT --

local function crsUnmakeFeedable(inst)
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

-- REMOVE MURDER ACTION --

local function crsRemoveMurder(inst)
    if inst.components.health then
        inst.components.health.canmurder = false
    end
end

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

-- TWEAK KRAMPED COMPONENT FOR MURDERING STACKS --

local crsVictims = {
    {prefab = "babybeefalo", penalty = 6},
    {prefab = "teenbird", penalty = 2},
    {prefab = "smallbird", penalty = 6},
    {prefab = "beefalo", penalty = 4},
    {prefab = "crow", penalty = 1},
    {prefab = "robin", penalty = 2},
    {prefab = "robin_winter", penalty = 2},
    {prefab = "butterfly", penalty = 1},
    {prefab = "rabbit", penalty = 1},
    {prefab = "tallbird", penalty = 2},
    {prefab = "bunnyman", penalty = 3},
    {prefab = "penguin", penalty = 2},
    {prefab = "glommer", penalty = 50},
    {prefab = "catcoon", penalty = 5},
    {prefab = "toucan", penalty = 1},
    {prefab = "parrot", penalty = 2},
    {prefab = "parrot_pirate", penalty = 6},
    {prefab = "seagull", penalty = 1},
    {prefab = "crab", penalty = 1},
    {prefab = "solofish", penalty = 2},
    {prefab = "swordfish", penalty = 4},
    {prefab = "whale_white", penalty = 6},
    {prefab = "whale_blue", penalty = 7},
    {prefab = "jellyfish_planted", penalty = 1},
    {prefab = "ox", penalty = 4},
    {prefab = "lobster", penalty = 2},
    {prefab = "primeape", penalty = 2},
    {prefab = "twister_seal", penalty = 50},
    {prefab = "jellyfish_planted", penalty = 1},
}

local function giveadditionalnaughtiness(self, inst)
    local onkilledother_old = self.onkilledother
    self.onkilledother = function(self,victim)
        if victim and victim.prefab then
            local stacksize = 1
            if victim.components.stackable then
                stacksize = victim.components.stackable.stacksize
            end
            if victim.prefab == "pigman" then
                if not victim.components.werebeast or not victim.components.werebeast:IsInWereState() then
                    self:OnNaughtyAction(3 * stacksize)
                end
            elseif victim.prefab == "doydoy" then
                self:OnNaughtyAction(GetWorld().components.doydoyspawner:GetInnocenceValue() * stacksize)
            else
                for k, v in pairs(crsVictims) do
                    if victim.prefab == v.prefab then
                        self:OnNaughtyAction(v.penalty * stacksize)
                    end
                end
            end
        end
    end
end
AddComponentPostInit("kramped",giveadditionalnaughtiness)
