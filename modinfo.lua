-- Stacks allows the customization of the maximum stack size of all stackable items,
--  makes animals and other items stackable, and prevents animals from starving,
--  eliminating the need to feed them.

-- Workshop Page: http://steamcommunity.com/sharedfiles/filedetails/?id=398305540
-- Author: cr4shmaster: http://steamcommunity.com/id/cr4shmaster
-- Contributor: Whismerhill: http://steamcommunity.com/id/whispershill
-- Contributor: JNGeist: http://steamcommunity.com/id/jngeist

-- Notes:
-- Can't handle custom stacks for every single item separately

name = "Stacks v2.0"
description = "Modifies the maximum stack size of all stackable items."
author = "cr4shmaster"
version = "2.0.9.2"
forumthread = ""
api_version = 6
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"

local crsToggle = {
    {description = "Enabled", data = true},
    {description = "Disabled", data = false},
}

local crsStacks = {
    {description = "5", data = 5},
    {description = "10", data = 10},
    {description = "15", data = 15},
    {description = "20", data = 20},
    {description = "25", data = 25},
    {description = "30", data = 30},
    {description = "35", data = 35},
    {description = "40", data = 40},
    {description = "45", data = 45},
    {description = "50", data = 50},
    {description = "55", data = 55},
    {description = "60", data = 60},
    {description = "65", data = 65},
    {description = "70", data = 70},
    {description = "75", data = 75},
    {description = "80", data = 80},
    {description = "85", data = 85},
    {description = "90", data = 90},
    {description = "95", data = 95},
    {description = "99", data = 99},
    {description = "100", data = 100},
    {description = "150", data = 150},
    {description = "200", data = 200},
    {description = "250", data = 250},
    {description = "500", data = 500},
    {description = "999", data = 999},
    {description = "1000", data = 1000},
    {description = "9999", data = 9999},
}

configuration_options = {
    {
        name = "cfgSmallStacks",
        label = "Small Stacks",
        options = crsStacks,
        default = 100,
    },
    {
        name = "cfgMediumStacks",
        label = "Medium Stacks",
        options = crsStacks,
        default = 100,
    },
    {
        name = "cfgLargeStacks",
        label = "Large Stacks",
        options = crsStacks,
        default = 100,
    },
    -- bees --
    {
        name = "cfgBeesNoStarve",
        label = "Bees Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgBeesNoMurder",
        label = "Can't Murder Bees",
        options = crsToggle,
        default = true,
    },
    -- butterflies --
    {
        name = "cfgButterfliesNoStarve",
        label = "Butterflies Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgButterfliesNoMurder",
        label = "Can't Murder Butterflies",
        options = crsToggle,
        default = true,
    },
    -- rabbits --
    {
        name = "cfgRabbitsNoStarve",
        label = "Rabbits Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgRabbitsStack",
        label = "Stackable Rabbits",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgRabbitsNoMurder",
        label = "Can't Murder Rabbits",
        options = crsToggle,
        default = true,
    },
    -- birds --
    {
        name = "cfgBirdsNoStarve",
        label = "Birds Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgBirdsStack",
        label = "Stackable Birds",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgBirdsNoMurder",
        label = "Can't Murder Birds",
        options = crsToggle,
        default = true,
    },
    -- moles --
    {
        name = "cfgMolesNoStarve",
        label = "Moles Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgMolesStack",
        label = "Stackable Moles",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgMolesNoMurder",
        label = "Can't Murder Moles",
        options = crsToggle,
        default = true,
    },
    -- mosquitos --
    {
        name = "cfgMosquitosNoStarve",
        label = "Mosquitos Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgMosquitosNoMurder",
        label = "Can't Murder Mosquitos",
        options = crsToggle,
        default = true,
    },
    -- crabs --
    {
        name = "cfgCrabsNoStarve",
        label = "Crabs Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgCrabsStack",
        label = "Stackable Crabs",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgCrabsNoMurder",
        label = "Can't Murder Crabs",
        options = crsToggle,
        default = true,
    },
    -- fish --
    {
        name = "cfgFishNoStarve",
        label = "Fish Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgFishStack",
        label = "Stackable Fish",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgFishNoMurder",
        label = "Can't Murder Fish",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgTestCheck",
        label = "Installed",
        options = {
            {description = "Yes", data = true},
        },
        default = true,
    },
}
