local Core = {
    Player = {
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
    Tools = {},
    Actions = {}
}

Core.CoreFuncs.Notify = function(msg: string)
    if msg == nil then msg = "No message provided" end
    game:GetService("StarterGui"):SetCore("SendNotification", { Title = "mochaFW", Text = msg, Duration = 5 })
end
Core.CoreFuncs.UpdatePlayer = function()
    repeat task.wait() until game.Players.LocalPlayer ~= nil
    repeat task.wait() until game.Players.LocalPlayer.Character ~= nil
    Core.Player.LP = game.Players.LocalPlayer
    Core.Player.Char = game.Players.LocalPlayer.Character
    Core.Player.Hum = game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 10)
    Core.Player.HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 10)
    if Core.Player.LP == nil then Core.CoreFuncs.Notify("Core.Player.LP is nil") return end
    if Core.Player.Char == nil then Core.CoreFuncs.Notify("Core.Player.Char is nil") return end
    if Core.Player.Hum == nil then Core.CoreFuncs.Notify("Core.Player.Hum is nil") return end
    if Core.Player.HRP == nil then Core.CoreFuncs.Notify("Core.Player.HRP is nil") return end
end
Core.CoreFuncs.ValidateLP = function()
    if Core.Player.LP == nil then Core.CoreFuncs.Notify("Core.Player.LP is nil") return end
    if Core.Player.Char == nil then Core.CoreFuncs.Notify("Core.Player.Char is nil") return end
    if Core.Player.Hum == nil then Core.CoreFuncs.Notify("Core.Player.Hum is nil") return end
    if Core.Player.HRP == nil then Core.CoreFuncs.Notify("Core.Player.HRP is nil") return end
    return true
end
Core.CoreFuncs.ValidatePlayer = function(player: Player)
    if player == nil then Core.CoreFuncs.Notify("Provided player returns nil") return end
    repeat task.wait() until player.Character ~= nil
    repeat task.wait() until player.Character:WaitForChild("HumanoidRootPart") ~= nil
    return true
end
Core.CoreFuncs.Init = function()
    Core.CoreFuncs.UpdatePlayer()
    Core.CoreFuncs.Notify("mochaFW Initialized!")
end
Core.Connections.CharacterAdded = game.Players.LocalPlayer.CharacterAdded:Connect(function(char: Model)
    Core.CoreFuncs.UpdatePlayer()
    Core.CoreFuncs.Notify("Updated Player Data!")
end)
Core.HelperFuncs.TeleportToPlr = function(player: Player, teleportabove: boolean?)
    if Core.CoreFuncs.ValidateLP() ~= true then return end
    if Core.CoreFuncs.ValidatePlayer(player) ~= true then return end
    if teleportabove == true then
        Core.Player.HRP.CFrame = player.Character:WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0, 8, 0)
        return
    end
    Core.Player.HRP.CFrame = player.Character:WaitForChild("HumanoidRootPart").CFrame
end
Core.HelperFuncs.TeleportToCFrame = function(cf: CFrame, teleportabove: boolean?)
    if Core.CoreFuncs.ValidateLP() ~= true then return end
    print(typeof(cf))
    print(cf)
    if teleportabove == true then
        Core.Player.HRP.CFrame = cf + Vector3.new(0, 8, 0)
        return
    end
    Core.Player.HRP.CFrame = cf
end

return Core
