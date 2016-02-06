-- set stack maxsize of all items
TUNING.STACK_SIZE_LARGEITEM = GetModConfigData("crsChangeAllStacksSize");
TUNING.STACK_SIZE_MEDITEM = GetModConfigData("crsChangeAllStacksSize");
TUNING.STACK_SIZE_SMALLITEM = GetModConfigData("crsChangeAllStacksSize");

-- make stackable
local function MakeStackable(inst)
 inst:AddComponent("stackable")
 inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
end
-- tallbirdegg
if GetModConfigData("crsTallbirdEggsCanStackToggle") then
 AddPrefabPostInit("tallbirdegg", MakeStackable)
end
-- rabbits
if GetModConfigData("crsRabbitsCanStackToggle") then
 AddPrefabPostInit("rabbit", MakeStackable)
end
-- moles
if GetModConfigData("crsMolesCanStackToggle") then
 AddPrefabPostInit("mole", MakeStackable)
end
-- birds
if GetModConfigData("crsBirdsCanStackToggle") then
 AddPrefabPostInit("crow", MakeStackable)
 AddPrefabPostInit("robin", MakeStackable)
 AddPrefabPostInit("robin_winter", MakeStackable)
end
 
-- remove death 
GLOBAL.crsBeesDontDieToggle = GetModConfigData("crsBeesDontDieToggle")
GLOBAL.crsButterfliesDontDieToggle = GetModConfigData("crsButterfliesDontDieToggle")
GLOBAL.crsRabbitsDontDieToggle = GetModConfigData("crsRabbitsDontDieToggle")
GLOBAL.crsBirdsDontDieToggle = GetModConfigData("crsBirdsDontDieToggle")
GLOBAL.crsMolesDontDieToggle = GetModConfigData("crsMolesDontDieToggle")
GLOBAL.crsMosquitosDontDieToggle = GetModConfigData("crsMosquitosDontDieToggle")

-- remove murder
local function RemoveMurder(inst)
 if inst.components.health then
  inst.components.health.canmurder = false
 end
end
if GetModConfigData("crsBeesRemoveMurderToggle") == 1 then
 AddPrefabPostInit("bee", RemoveMurder)
end
if GetModConfigData("crsButterfliesRemoveMurderToggle") == 1 then
 AddPrefabPostInit("butterfly", RemoveMurder)
end
if GetModConfigData("crsRabbitsRemoveMurderToggle") == 1 then
 AddPrefabPostInit("rabbit", RemoveMurder)
end
if GetModConfigData("crsBirdsRemoveMurderToggle") == 1 then
 AddPrefabPostInit("crow", RemoveMurder)
 AddPrefabPostInit("robin", RemoveMurder)
 AddPrefabPostInit("robin_winter", RemoveMurder)
end
if GetModConfigData("crsMolesRemoveMurderToggle") == 1 then
 AddPrefabPostInit("mole", RemoveMurder)
end
if GetModConfigData("crsMosquitosRemoveMurderToggle") == 1 then
 AddPrefabPostInit("mosquito", RemoveMurder)
end

-- custom stack maxsize
-- if GetModConfigData("crsCustomStacksToggle") == 1 then
 -- AddPrefabPostInit("beardhair", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("beardhair")
 -- end)

 -- AddPrefabPostInit("ash", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("ash")
 -- end)

 -- AddPrefabPostInit("bandage", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("bandage")
 -- end)

 -- AddPrefabPostInit("bee", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("bee")
 -- end)

 -- AddPrefabPostInit("beefalowool", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("beefalowool")
 -- end)

 -- AddPrefabPostInit("blowdart_sleep", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("blowdart_sleep")
 -- end)

 -- AddPrefabPostInit("blowdart_fire", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("blowdart_fire")
 -- end)

 -- AddPrefabPostInit("blowdart_pipe", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("blowdart_pipe")
 -- end)

 -- AddPrefabPostInit("boards", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("boards")
 -- end)

 -- AddPrefabPostInit("butter", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("butter")
 -- end)

 -- AddPrefabPostInit("butterfly", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("butterfly")
 -- end)

 -- AddPrefabPostInit("butterflywings", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("butterflywings")
 -- end)

 -- AddPrefabPostInit("charcoal", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("charcoal")
 -- end)

 -- AddPrefabPostInit("cutgrass", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cutgrass")
 -- end)

 -- AddPrefabPostInit("cutlichen", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cutlichen")
 -- end)

 -- AddPrefabPostInit("cutreeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cutreeds")
 -- end)

 -- AddPrefabPostInit("cutstone", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cutstone")
 -- end)

 -- AddPrefabPostInit("eel", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("eel")
 -- end)

 -- AddPrefabPostInit("egg", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("egg")
 -- end)

 -- AddPrefabPostInit("feather_robin_winter", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("feather_robin_winter")
 -- end)

 -- AddPrefabPostInit("feather_robin_winter", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("feather_robin_winter")
 -- end)

 -- AddPrefabPostInit("feather_robin", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("feather_robin")
 -- end)

 -- AddPrefabPostInit("feather_crow", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("feather_crow")
 -- end)

 -- AddPrefabPostInit("fireflies", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("fireflies")
 -- end)

 -- AddPrefabPostInit("fish", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("fish")
 -- end)

 -- AddPrefabPostInit("flint", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("flint")
 -- end)

 -- AddPrefabPostInit("foliage", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("foliage")
 -- end)

 -- AddPrefabPostInit("froglegs", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("froglegs")
 -- end)

 -- AddPrefabPostInit("gears", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("gears")
 -- end)

 -- AddPrefabPostInit("redgem", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("redgem")
 -- end)

 -- AddPrefabPostInit("bluegem", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("bluegem")
 -- end)

 -- AddPrefabPostInit("yellowgem", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("yellowgem")
 -- end)

 -- AddPrefabPostInit("greengem", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("greengem")
 -- end)

 -- AddPrefabPostInit("purplegem", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("purplegem")
 -- end)

 -- AddPrefabPostInit("goldnugget", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("goldnugget")
 -- end)

 -- AddPrefabPostInit("guano", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("guano")
 -- end)

 -- AddPrefabPostInit("gunpowder", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("gunpowder")
 -- end)

 -- AddPrefabPostInit("healingsalve", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("healingsalve")
 -- end)

 -- AddPrefabPostInit("honey", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("honey")
 -- end)

 -- AddPrefabPostInit("honeycomb", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("honeycomb")
 -- end)

 -- AddPrefabPostInit("houndstooth", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("houndstooth")
 -- end)

 -- AddPrefabPostInit("marble", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("marble")
 -- end)

 -- AddPrefabPostInit("lightbulb", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("lightbulb")
 -- end)

 -- AddPrefabPostInit("livinglog", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("livinglog")
 -- end)

 -- AddPrefabPostInit("log", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("log")
 -- end)

 -- AddPrefabPostInit("lureplantbulb", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("lureplantbulb")
 -- end)

 -- AddPrefabPostInit("rocks", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("rocks")
 -- end)

 -- AddPrefabPostInit("mandrake", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("mandrake")
 -- end)

 -- AddPrefabPostInit("manrabbit_tail", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("manrabbit_tail")
 -- end)

 -- AddPrefabPostInit("cookedmeat", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cookedmeat")
 -- end)

 -- AddPrefabPostInit("meat_dried", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("meat_dried")
 -- end)

 -- AddPrefabPostInit("spoiled_food", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("spoiled_food")
 -- end)

 -- AddPrefabPostInit("cookedsmallmeat", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cookedsmallmeat")
 -- end)

 -- AddPrefabPostInit("smallmeat_dried", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("smallmeat_dried")
 -- end)

 -- AddPrefabPostInit("cookedmonstermeat", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cookedmonstermeat")
 -- end)

 -- AddPrefabPostInit("monstermeat_dried", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("monstermeat_dried")
 -- end)

 -- AddPrefabPostInit("drumstick", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("drumstick")
 -- end)

 -- AddPrefabPostInit("drumstick_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("drumstick_cooked")
 -- end)

 -- AddPrefabPostInit("batwing_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("batwing_cooked")
 -- end)

 -- AddPrefabPostInit("plantmeat_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("plantmeat_cooked")
 -- end)

 -- AddPrefabPostInit("mosquito", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("mosquito")
 -- end)

 -- AddPrefabPostInit("mosquitosack", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("mosquitosack")
 -- end)

 -- AddPrefabPostInit("red_cap", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("red_cap")
 -- end)

 -- AddPrefabPostInit("red_cap_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("red_cap_cooked")
 -- end)

 -- AddPrefabPostInit("green_cap", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("green_cap")
 -- end)

 -- AddPrefabPostInit("green_cap_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("green_cap_cooked")
 -- end)

 -- AddPrefabPostInit("blue_cap", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("blue_cap")
 -- end)

 -- AddPrefabPostInit("blue_cap_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("blue_cap_cooked")
 -- end)

 -- AddPrefabPostInit("nightmarefuel", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("nightmarefuel")
 -- end)

 -- AddPrefabPostInit("nitre", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("nitre")
 -- end)

 -- AddPrefabPostInit("papyrus", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("papyrus")
 -- end)

 -- AddPrefabPostInit("petals", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("petals")
 -- end)

 -- AddPrefabPostInit("petals_evil", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("petals_evil")
 -- end)

 -- AddPrefabPostInit("pigskin", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pigskin")
 -- end)

 -- AddPrefabPostInit("pinecone", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pinecone")
 -- end)

 -- AddPrefabPostInit("dug_sapling", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("dug_sapling")
 -- end)

 -- AddPrefabPostInit("dug_berrybush", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("dug_berrybush")
 -- end)

 -- AddPrefabPostInit("dug_grass", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("dug_grass")
 -- end)

 -- AddPrefabPostInit("poop", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("poop")
 -- end)

 -- AddPrefabPostInit("rope", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("rope")
 -- end)

 -- AddPrefabPostInit("seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("seeds")
 -- end)

 -- AddPrefabPostInit("silk", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("silk")
 -- end)

 -- AddPrefabPostInit("slurperpelt", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("slurperpelt")
 -- end)

 -- AddPrefabPostInit("slurtle_shellpieces", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("slurtle_shellpieces")
 -- end)

 -- AddPrefabPostInit("slurtleslime", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("slurtleslime")
 -- end)

 -- AddPrefabPostInit("spidereggsack", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("spidereggsack")
 -- end)

 -- AddPrefabPostInit("spidergland", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("spidergland")
 -- end)

 -- AddPrefabPostInit("stinger", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("stinger")
 -- end)

 -- AddPrefabPostInit("sunken_boat_trinket_1", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("sunken_boat_trinket_1")
 -- end)

 -- AddPrefabPostInit("sunken_boat_trinket_2", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("sunken_boat_trinket_2")
 -- end)

 -- AddPrefabPostInit("sunken_boat_trinket_3", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("sunken_boat_trinket_3")
 -- end)

 -- AddPrefabPostInit("sunken_boat_trinket_4", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("sunken_boat_trinket_4")
 -- end)

 -- AddPrefabPostInit("sunken_boat_trinket_5", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("sunken_boat_trinket_5")
 -- end)

 -- AddPrefabPostInit("tallbirdegg", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("tallbirdegg")
 -- end)

 -- AddPrefabPostInit("tentaclespots", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("tentaclespots")
 -- end)

 -- AddPrefabPostInit("thulecite_pieces", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("thulecite_pieces")
 -- end)

 -- AddPrefabPostInit("trinket_1", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_1")
 -- end)

 -- AddPrefabPostInit("trinket_2", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_2")
 -- end)

 -- AddPrefabPostInit("trinket_3", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_3")
 -- end)

 -- AddPrefabPostInit("trinket_4", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_4")
 -- end)

 -- AddPrefabPostInit("trinket_5", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_5")
 -- end)

 -- AddPrefabPostInit("trinket_6", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_6")
 -- end)

 -- AddPrefabPostInit("trinket_7", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_7")
 -- end)

 -- AddPrefabPostInit("trinket_8", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_8")
 -- end)

 -- AddPrefabPostInit("trinket_9", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_9")
 -- end)

 -- AddPrefabPostInit("trinket_10", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_10")
 -- end)

 -- AddPrefabPostInit("trinket_11", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_11")
 -- end)

 -- AddPrefabPostInit("trinket_12", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trinket_12")
 -- end)

 -- AddPrefabPostInit("trunk_summer", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trunk_summer")
 -- end)

 -- AddPrefabPostInit("trunk_winter", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trunk_winter")
 -- end)

 -- AddPrefabPostInit("trunk_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("trunk_cooked")
 -- end)

 -- AddPrefabPostInit("twigs", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("twigs")
 -- end)

 -- AddPrefabPostInit("walrus_tusk", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("walrus_tusk")
 -- end)

 -- AddPrefabPostInit("turf_road", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_road")
 -- end)

 -- AddPrefabPostInit("turf_rocky", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_rocky")
 -- end)

 -- AddPrefabPostInit("turf_forest", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_forest")
 -- end)

 -- AddPrefabPostInit("turf_marsh", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_marsh")
 -- end)

 -- AddPrefabPostInit("turf_grass", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_grass")
 -- end)

 -- AddPrefabPostInit("turf_savanna", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_savanna")
 -- end)

 -- AddPrefabPostInit("turf_dirt", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_dirt")
 -- end)

 -- AddPrefabPostInit("turf_woodfloor", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_woodfloor")
 -- end)

 -- AddPrefabPostInit("turf_carpetfloor", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_carpetfloor")
 -- end)

 -- AddPrefabPostInit("turf_checkerfloor", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_checkerfloor")
 -- end)

 -- AddPrefabPostInit("turf_cave", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_cave")
 -- end)

 -- AddPrefabPostInit("turf_fungus", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_fungus")
 -- end)

 -- AddPrefabPostInit("turf_fungus_red", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_fungus_red")
 -- end)

 -- AddPrefabPostInit("turf_fungus_green", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_fungus_green")
 -- end)

 -- AddPrefabPostInit("turf_sinkhole", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_sinkhole")
 -- end)

 -- AddPrefabPostInit("turf_underrock", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_underrock")
 -- end)

 -- AddPrefabPostInit("turf_mud", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turf_mud")
 -- end)

 -- AddPrefabPostInit("cave_banana", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cave_banana")
 -- end)

 -- AddPrefabPostInit("carrot", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("carrot")
 -- end)

 -- AddPrefabPostInit("corn", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("corn")
 -- end)

 -- AddPrefabPostInit("pumpkin", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pumpkin")
 -- end)

 -- AddPrefabPostInit("eggplant", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("eggplant")
 -- end)

 -- AddPrefabPostInit("durian", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("durian")
 -- end)

 -- AddPrefabPostInit("pomegranate", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pomegranate")
 -- end)

 -- AddPrefabPostInit("dragonfruit", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("dragonfruit")
 -- end)

 -- AddPrefabPostInit("berries", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("berries")
 -- end)

 -- AddPrefabPostInit("cave_banana_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("cave_banana_cooked")
 -- end)

 -- AddPrefabPostInit("carrot_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("carrot_cooked")
 -- end)

 -- AddPrefabPostInit("carrot_seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("carrot_seeds")
 -- end)

 -- AddPrefabPostInit("corn_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("corn_cooked")
 -- end)

 -- AddPrefabPostInit("corn_seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("corn_seeds")
 -- end)

 -- AddPrefabPostInit("pumpkin_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pumpkin_cooked")
 -- end)

 -- AddPrefabPostInit("pumpkin_seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pumpkin_seeds")
 -- end)

 -- AddPrefabPostInit("eggplant_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("eggplant_cooked")
 -- end)

 -- AddPrefabPostInit("eggplant_seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("eggplant_seeds")
 -- end)

 -- AddPrefabPostInit("durian_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("durian_cooked")
 -- end)

 -- AddPrefabPostInit("durian_seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("durian_seeds")
 -- end)

 -- AddPrefabPostInit("pomegranate_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pomegranate_cooked")
 -- end)

 -- AddPrefabPostInit("pomegranate_seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pomegranate_seeds")
 -- end)

 -- AddPrefabPostInit("dragonfruit_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("dragonfruit_cooked")
 -- end)

 -- AddPrefabPostInit("dragonfruit_seeds", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("dragonfruit_seeds")
 -- end)

 -- AddPrefabPostInit("berries_cooked", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("berries_cooked")
 -- end)

 -- AddPrefabPostInit("wall_stone_item", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("wall_stone_item")
 -- end)

 -- AddPrefabPostInit("wall_wood_item", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("wall_wood_item")
 -- end)

 -- AddPrefabPostInit("wall_hay_item", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("wall_hay_item")
 -- end)

 -- AddPrefabPostInit("wall_ruins_item", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("wall_ruins_item")
 -- end)

 -- AddPrefabPostInit("butterflymuffin", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("butterflymuffin")
 -- end)

 -- AddPrefabPostInit("frogglebunwich", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("frogglebunwich")
 -- end)

 -- AddPrefabPostInit("taffy", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("taffy")
 -- end)

 -- AddPrefabPostInit("pumpkincookie", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("pumpkincookie")
 -- end)

 -- AddPrefabPostInit("stuffedeggplant", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("stuffedeggplant")
 -- end)

 -- AddPrefabPostInit("fishsticks", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("fishsticks")
 -- end)

 -- AddPrefabPostInit("honeynuggets", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("honeynuggets")
 -- end)

 -- AddPrefabPostInit("honeyham", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("honeyham")
 -- end)

 -- AddPrefabPostInit("dragonpie", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("dragonpie")
 -- end)

 -- AddPrefabPostInit("kabobs", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("kabobs")
 -- end)

 -- AddPrefabPostInit("mandrakesoup", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("mandrakesoup")
 -- end)

 -- AddPrefabPostInit("baconeggs", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("baconeggs")
 -- end)

 -- AddPrefabPostInit("meatballs", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("meatballs")
 -- end)

 -- AddPrefabPostInit("bonestew", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("bonestew")
 -- end)

 -- AddPrefabPostInit("perogies", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("perogies")
 -- end)

 -- AddPrefabPostInit("turkeydinner", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("turkeydinner")
 -- end)

 -- AddPrefabPostInit("ratatouille", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("ratatouille")
 -- end)

 -- AddPrefabPostInit("jammypreserves", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("jammypreserves")
 -- end)

 -- AddPrefabPostInit("fruitmedley", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("fruitmedley")
 -- end)

 -- AddPrefabPostInit("fishtacos", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("fishtacos")
 -- end)

 -- AddPrefabPostInit("waffles", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("waffles")
 -- end)

 -- AddPrefabPostInit("monsterlasagna", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("monsterlasagna")
 -- end)

 -- AddPrefabPostInit("powcake", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("powcake")
 -- end)

 -- AddPrefabPostInit("unagi", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("unagi")
 -- end)

 -- AddPrefabPostInit("wetgoop", function(inst)
  -- inst.components.stackable.maxsize = GetModConfigData("wetgoop")
 -- end)
-- end
