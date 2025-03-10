dir = minetest.get_modpath("glow_ores")
fileName = dir.."/txt"
file = io.open(fileName, "a")

local settings = {}
glow_ores_storage = minetest.get_mod_storage()

function load()
    for key in glow_ores_storage.get_keys() do
        value = glow_ores_storage.get(key)
        settings[key] = value
        glow_ores_storage.set_string(key, "")
    end
end

function write()
    io.output(file)
    io.write(formatFile())
end

function formatSetting(key, value)
    return key.." "..value
end

function formatFile()
    local fileContent = ""
    for key, value in pairs(settings) do
        fileContent = fileContent..formatSetting(key, value).."\n"
    end
    minetest.log("[glow_ores]Writing to txt: "..fileContent)
    return fileContent
end

function add(key, value)
    minetest.log("[glow_ores].. Adding "..key.." as "..value)
    settings[tostring(key)] = value
end

function store()
    for key, value in pairs(settings) do
        if key and value then
            minetest.log("[glow_ores]Storing "..key.." with value "..value)
            glow_ores_storage.set_string(key, tostring(value))
        end
    end
end
