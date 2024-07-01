local S = minetest.get_translator("glow_ores")

-- function printme(i)
--     if not i then
--         return "nil"
--     else
--         local val = "{\n"
--         for k, v in pairs(i) do
--             if type(v) == "table" then
--                 val = val..k.." = {"..printme(v).."}, "
--             else
--                 val = val..k.." = "..tostring(v)..", "
--             end
--         end
--         val = val.."}"
--         return val
--     end
-- end

-- Get the default light_source level from the configuration
default_glow_level = tonumber(minetest.settings:get("default_glow_level"))
if default_glow_level == nil then
    default_glow_level = 4
end

-- The maximum light_source value supported
local MAX = minetest.LIGHT_MAX

-- Reduce the number to something between 4 and LIGHT_MAX (for use as a light_source value)
function reduce(num)
    num = ( math.sqrt (num) / 1000 * MAX * (MAX - 4 + 1) + 4 ) / 2
    if num > MAX then
        num = MAX
    elseif num < 4 then
        num = 4
    end
    return num
end

-- Determine the light_source level for the passed ore.
function get_glow_level(ore)
    minetest.log("info", "[glow_ores]Getting glow level for "..(ore.ore or "nil"))
    if ore == nil then
        minetest.log("debug", "[glow_ores]In get_glow_level... ore is nil")
        return default_glow_level
    elseif ore.clust_scarcity then
        minetest.log("debug", "[glow_ores]In get_glow_level... using clust_scarcity of "..ore.clust_scarcity)
        return reduce(ore.clust_scarcity)
    elseif ore.clust_size then
        minetest.log("debug", "[glow_ores]In get_glow_level... using clust_size of "..ore.clust_size)
        return reduce(ore.clust_size)
    else
        minetest.log("debug", "[glow_ores]In get_glow_level... using default glow level")
        return default_glow_level
    end 
end

minetest.log("[glow_ores]default_glow_level = "..default_glow_level)

-- Rainbow ore doesn't register as an ore until after other mods are loaded (so that it can respect its spawn
-- within configuration).  Therefore, it won't be found in this loop unless we wait too.
minetest.register_on_mods_loaded(function()
    for name, reg in pairs(minetest.registered_ores) do
        if reg.ore_type == "scatter" then
            minetest.log("[glow_ores]Found ore "..reg.ore)
            ore = minetest.registered_nodes[reg.ore]
            itemname = ore.name
            itemname = string.gsub(itemname, ":", "_")
            description = ore.description
            tiles = ore.tiles
            groups = ore.groups
            drop = ore.drop
            is_ground_content = ore.is_ground_content
            local paramtype = ore.paramtype
            local use_texture_alpha = ore.use_texture_alpha
            local drawtype = ore.drawtype
            local sunlight_propagates = ore.sunlight_propagates
            is_setting_key = "is_glow_"..itemname
            is_setting = minetest.settings:get_bool(is_setting_key)
            is_custom = minetest.settings:get_bool("is_custom_"..itemname)
            if is_setting ~= nil and is_custom then
                level_setting_key = itemname.."_glow_level"
                level_setting = tonumber(minetest.settings:get(level_setting_key))
            else
                level_setting = get_glow_level(reg)
            end

            minetest.log("[glow_ores]Setting light_source of "..ore.name.." to "..level_setting)

            minetest.register_node(":"..ore.name, {
                description = description,
                tiles = tiles,
                groups = groups,
                drop = drop,
                is_ground_content = is_ground_content,
                light_source = level_setting,
                paramtype = paramtype,
                use_texture_alpha = use_texture_alpha,
                drawtype = drawtype,
                sunlight_propagates = sunlight_propagates,
            })
        end
    end
end)
