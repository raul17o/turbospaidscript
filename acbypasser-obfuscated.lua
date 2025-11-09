local mt = getrawmetatable(game)
setreadonly(mt, false)
local namecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" and tostring(self) == "NoNeedJealousy" then
        return warn("Tried to Ban")
    end
    return namecall(self, table.unpack(args))
end)
