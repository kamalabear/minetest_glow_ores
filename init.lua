local S = minetest.get_translator("glow_ores")

default_glow_level = tonumber(minetest.settings:get("default_glow_level"))
if default_glow_level == nil then
    default_glow_level = 4
end

minetest.log("[glow_ores]default_glow_level = "..default_glow_level)

for name, reg in pairs(minetest.registered_ores) do
	if reg.ore_type == "scatter" then
        minetest.log("[glow_ores]Found ore "..reg.ore)
        ore = minetest.registered_nodes[reg.ore]
        itemname = ore.name
        itemname = string.gsub(itemname, ":", "_")
        is_setting_key = "is_glow_"..itemname
        is_setting = minetest.settings:get_bool(is_setting_key)
        level_setting_key = itemname.."_glow_level"
        level_setting = tonumber(minetest.settings:get(level_setting_key))
        if is_setting == nil and default_glow_level and default_glow_level > 0 then
            minetest.log("[glow_ores]Using the default glow level")
            ore.light_source = default_glow_level
            description = ore.description
            tiles = ore.tiles
            groups = ore.groups
            drop = ore.drop
            is_ground_content = ore.is_ground_content
            local paramtype = ore.paramtype
            local use_texture_alpha = ore.use_texture_alpha
            local drawtype = ore.drawtype
            local sunlight_propagates = ore.sunlight_propagates
            minetest.register_node(":"..ore.name, {
                description = description,
                tiles = tiles,
                groups = groups,
                drop = drop,
                is_ground_content = is_ground_content,
                light_source = default_glow_level,
                paramtype = paramtype,
                use_texture_alpha = use_texture_alpha,
                drawtype = drawtype,
                sunlight_propagates = sunlight_propagates,
            })
        end
    end
end

local is_glow_coal = minetest.settings:get_bool("is_glow_coal")
local coal_glow_level = tonumber(minetest.settings:get("coal_glow_level"))
local ore = minetest.registered_nodes["default:stone_with_coal"]
if ore and is_glow_coal then
    --Redefine coal ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..coal_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":default:stone_with_coal", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = coal_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

local is_glow_iron = minetest.settings:get_bool("is_glow_iron")
local iron_glow_level = tonumber(minetest.settings:get("iron_glow_level"))
ore = minetest.registered_nodes["default:stone_with_iron"]
if ore and is_glow_iron then
    --Redefine iron ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..iron_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":default:stone_with_iron", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = iron_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

local is_glow_copper = minetest.settings:get_bool("is_glow_copper")
local copper_glow_level = tonumber(minetest.settings:get("copper_glow_level"))
ore = minetest.registered_nodes["default:stone_with_copper"]
if ore and is_glow_copper then
    --Redefine copper ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..copper_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":default:stone_with_copper", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = copper_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

local is_glow_tin = minetest.settings:get_bool("is_glow_tin")
local tin_glow_level = tonumber(minetest.settings:get("tin_glow_level"))
ore = minetest.registered_nodes["default:stone_with_tin"]
if ore and is_glow_tin then
    --Redefine tin ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..tin_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":default:stone_with_tin", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = tin_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

local is_glow_gold = minetest.settings:get_bool("is_glow_gold")
local gold_glow_level = tonumber(minetest.settings:get("gold_glow_level"))
ore = minetest.registered_nodes["default:stone_with_gold"]
if ore and is_glow_gold then
    --Redefine gold ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..gold_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":default:stone_with_gold", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = gold_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

local is_glow_diamond = minetest.settings:get_bool("is_glow_diamond")
local diamond_glow_level = tonumber(minetest.settings:get("diamond_glow_level"))
ore = minetest.registered_nodes["default:stone_with_diamond"]
if ore and is_glow_diamond then
    --Redefine diamond ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..diamond_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":default:stone_with_diamond", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = diamond_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

local is_glow_silver = minetest.settings:get_bool("is_glow_silver")
local silver_glow_level = tonumber(minetest.settings:get("silver_glow_level"))
ore = minetest.registered_nodes["moreores:mineral_silver"]
if ore and is_glow_silver then
    --Redefine silver ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..silver_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":moreores:mineral_silver", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = silver_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

local is_glow_mithril = minetest.settings:get_bool("is_glow_mithril")
local mithril_glow_level = tonumber(minetest.settings:get("mithril_glow_level"))
ore = minetest.registered_nodes["moreores:mineral_mithril"]
if ore and is_glow_mithril then
    -- Redefine mineral_mithril node
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..mithril_glow_level)
    local description = ore.description
    local tiles = ore.tiles
    local groups = ore.groups
    local drop = ore.drop
    local is_ground_content = ore.is_ground_content
    minetest.register_node(":moreores:mineral_mithril", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = mithril_glow_level,
        paramtype = "light",
        use_texture_alpha = true,
        drawtype = "glasslike",
        sunlight_propagates = true,
    })
end

local is_glow_mese = minetest.settings:get_bool("is_glow_mese")
local mese_glow_level = tonumber(minetest.settings:get("mese_glow_level"))
ore = minetest.registered_nodes["default:stone_with_mese"]
if ore and is_glow_mese then
    -- Redefine stone_with_mese node
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..mese_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    minetest.register_node(":default:stone_with_mese", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = mese_glow_level,
        paramtype = "light",
        use_texture_alpha = true,
        drawtype = "glasslike",
        sunlight_propagates = true,
    })
end

local is_glow_rainbow = minetest.settings:get_bool("is_glow_rainbow")
local rainbow_glow_level = tonumber(minetest.settings:get("rainbow_glow_level"))
ore = minetest.registered_nodes["rainbow_ore:rainbow_ore_block"]
if ore and is_glow_rainbow then
    --Redefine Rainbow ore
    minetest.log("[glow_ores]Setting glow level of "..ore.name.." to "..rainbow_glow_level)
    description = ore.description
    tiles = ore.tiles
    groups = ore.groups
    drop = ore.drop
    is_ground_content = ore.is_ground_content
    local paramtype = ore.paramtype
    local use_texture_alpha = ore.use_texture_alpha
    local drawtype = ore.drawtype
    local sunlight_propagates = ore.sunlight_propagates
    minetest.register_node(":rainbow_ore:rainbow_ore_block", {
        description = description,
        tiles = tiles,
        groups = groups,
        drop = drop,
        is_ground_content = is_ground_content,
        light_source = rainbow_glow_level,
        paramtype = paramtype,
        use_texture_alpha = use_texture_alpha,
        drawtype = drawtype,
        sunlight_propagates = sunlight_propagates,
    })
end    

