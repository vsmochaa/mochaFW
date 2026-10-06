local Core = {
    PlayerData = {
        LP = nil,
        Char = nil,
        HRP = nil,
        Hum = nil
    },
    HelperFuncs = {},
    CoreFuncs = {},
    Connections = {},
    -- State = {},
    Config = {},
    Actions = {}
}

Core.CoreFuncs.Notify = function(msg: string)
    if msg == nil then msg = "No message provided" end
    game:GetService("StarterGui"):SetCore("SendNotification", { Title = "MochaFW", Text = msg, Duration = 5 })
end
Core.CoreFuncs.UpdatePlayerData = function()
    repeat task.wait() until game.Players.LocalPlayer ~= nil
    repeat task.wait() until game.Players.LocalPlayer.Character ~= nil
    Core.PlayerData.LP = game.Players.LocalPlayer
    Core.PlayerData.Char = game.Players.LocalPlayer.Character
    Core.PlayerData.Hum = game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 10)
    Core.PlayerData.HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 10)
    if Core.PlayerData.LP == nil then Core.CoreFuncs.Notify("Core.PlayerData.LP is nil") return end
    if Core.PlayerData.Char == nil then Core.CoreFuncs.Notify("Core.PlayerData.Char is nil") return end
    if Core.PlayerData.Hum == nil then Core.CoreFuncs.Notify("Core.PlayerData.Hum is nil") return end
    if Core.PlayerData.HRP == nil then Core.CoreFuncs.Notify("Core.PlayerData.HRP is nil") return end
end
Core.CoreFuncs.Init = function()
    Core.CoreFuncs.UpdatePlayerData()
    Core.CoreFuncs.Notify("mochaFW Initialized!")
end
Core.Connections.CharacterAdded = game.Players.LocalPlayer.CharacterAdded:Connect(function(char: Model)
    Core.CoreFuncs.UpdatePlayerData()
    Core.CoreFuncs.Notify("Updated PlayerData!")
end)

return Core
