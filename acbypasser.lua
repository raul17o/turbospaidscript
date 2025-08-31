-- Metamethod hook to block the RemoteEvent (Correct)
local mt = getrawmetatable(game)
make_writeable(mt)
local namecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" and tostring(self) == "NoNeedJealousy" then
        return warn("Tried to Ban")
    end
    return namecall(self, table.unpack(args))
end)

-- Get the current player and their character (Correct)
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

-- Find the scripts
local script1 = game:GetService("StarterPlayer").StarterCharacterScripts[" "]
-- CORRECTED LINE: Search inside the 'character' variable, not workspace.character
local script2 = character:FindFirstChild(" ")

-- Disable connections if the scripts were found
if script1 then
    local script1signal = script1.Changed
    for i, connection in next, getconnections(script1signal) do
        connection:Disable()
    end
    script1:Destroy()
end

if script2 then
    local script2signal = script2.Changed
    for i, connection in next, getconnections(script2signal) do
        connection:Disable()
    end
    script2:Destroy()
end