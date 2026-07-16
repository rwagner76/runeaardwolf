rune.gmcp.subscribe("Char")
rune.gmcp.subscribe("Room")
rune.gmcp.subscribe("Group")

rune.hooks.on("gmcp", function(package, data, raw)
    rune.dbg(package .. " " .. tostring(raw))
end)

if char == nil then char = {} end

rune.gmcp.on("char.vitals", function(data)
    char["vitals"] = data
end)

rune.gmcp.on("char.status", function(data)
    char["status"] = data
end)

rune.gmcp.on("char.base", function(data)
    char["base"] = data
end)

rune.gmcp.on("char.stats", function(data)
    char["stats"] = data
end)

rune.gmcp.on("char.maxstats", function(data)
    char["maxstats"] = data
end)

if room == nil then room = {} end

rune.gmcp.on("room.info", function(data)
    room["info"] = data
end)

rune.gmcp.on("group", function(data)
    group = data
end)