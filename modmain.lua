-- CREATE SHORTCUTS --

getConfig = GetModConfigData
setPrefab = AddPrefabPostInit

-- local noDLC = not GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) and not GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
local anyDLC = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) or GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)
-- local rogDLC = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local swDLC = GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)

-- SET MAX STACK SIZE --

TUNING.STACK_SIZE_LARGEITEM = getConfig("cfgLargeStacks");
TUNING.STACK_SIZE_MEDITEM = getConfig("cfgMediumStacks");
TUNING.STACK_SIZE_SMALLITEM = getConfig("cfgSmallStacks");

-- UPDATE PREFABS --

local prefabs = {
    -- animals --
    {prefab = "mole", dlc = anyDLC, noStarve = getConfig("cfgMolesNoStarve"), stackable = getConfig("cfgMolesStack"), cantMurder = getConfig("cfgMolesNoMurder")},
    {prefab = "crow", dlc = true, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "robin", dlc = true, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "robin_winter", dlc = true, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "rabbit", dlc = true, noStarve = getConfig("cfgRabbitsNoStarve"), stackable = getConfig("cfgRabbitsStack"), cantMurder = getConfig("cfgRabbitsNoMurder")},
    {prefab = "bee", dlc = anyDLC, noStarve = getConfig("cfgBeesNoStarve"), cantMurder = getConfig("cfgBeesNoMurder")},
    {prefab = "killerbee", dlc = anyDLC, noStarve = getConfig("cfgBeesNoStarve"), cantMurder = getConfig("cfgBeesNoMurder")},
    {prefab = "butterfly", dlc = anyDLC, noStarve = getConfig("cfgButterfliesNoStarve"), cantMurder = getConfig("cfgButterfliesNoMurder")},
    {prefab = "mosquito_poison", dlc = swDLC, noStarve = getConfig("cfgMosquitosNoStarve"), cantMurder = getConfig("cfgMosquitosNoMurder")},
    {prefab = "mosquito", dlc = anyDLC, noStarve = getConfig("cfgMosquitosNoStarve"), cantMurder = getConfig("cfgMosquitosNoMurder")},
    {prefab = "jellyfish", dlc = swDLC, noStarve = getConfig("cfgFishNoStarve"), stackable = getConfig("cfgFishStack"), cantMurder = getConfig("cfgFishNoMurder")},
    {prefab = "toucan", dlc = swDLC, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "parrot_pirate", dlc = swDLC, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "seagull", dlc = swDLC, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "parrot", dlc = swDLC, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "doydoy", dlc = swDLC, noStarve = getConfig("cfgBirdsNoStarve"), stackable = getConfig("cfgBirdsStack"), cantMurder = getConfig("cfgBirdsNoMurder")},
    {prefab = "crab", dlc = swDLC, noStarve = getConfig("cfgCrabsNoStarve"), stackable = getConfig("cfgCrabsStack"), cantMurder = getConfig("cfgCrabsNoMurder")},
    {prefab = "lobster", dlc = swDLC, noStarve = getConfig("cfgCrabsNoStarve"), stackable = getConfig("cfgCrabsStack"), cantMurder = getConfig("cfgCrabsNoMurder")},
    
    -- items --
    {prefab = "glommerwings", dlc = true, stackable = true},
    {prefab = "minotaurhorn", dlc = true, stackable = true},
    {prefab = "tallbirdegg", dlc = true, stackable = true},
    {prefab = "deerclops_eyeball", dlc = true, stackable = true},
    {prefab = "doydoyegg", dlc = swDLC, stackable = true},
}

-- add stackable component --
local function makeStackable(inst)
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
end

-- remove murder action --
local function removeMurder(inst)
    if inst.components.health then
        inst.components.health.cantMurder = false
    end
end

-- remove feedable component --
local function unmakeFeedable(inst)
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

for k, v in pairs(prefabs) do
    if v.dlc then -- check if it's DLC is enabled
        if v.noStarve then
            if anyDLC then -- check if RoG or SW are enabled; there's no starving in vanilla 
                setPrefab(v.prefab, unmakeFeedable)
            end
        end
        if v.stackable then
            setPrefab(v.prefab, makeStackable)
        end
        if v.cantMurder then
            setPrefab(v.prefab, removeMurder)
        end
    end
end

-- TWEAK KRAMPED COMPONENT FOR MURDERING STACKS --

local victims = {
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
                for k, v in pairs(victims) do
                    if victim.prefab == v.prefab then
                        self:OnNaughtyAction(v.penalty * stacksize)
                    end
                end
            end
        end
    end
end
AddComponentPostInit("kramped",giveadditionalnaughtiness)
