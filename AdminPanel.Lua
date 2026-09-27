local tuer = script.Parent
local offen = false

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.T then
        offen = nicht offen
        if offen then
            tuer.CFrame = tuer.CFrame * CFrame.new(0, 0, -5) -- Tür nach vorne schieben
        else
            tuer.CFrame = tuer.CFrame * CFrame.new(0, 0, 5) -- Tür zurück
        end
    end
end)

local part = script.Parent

part.Touched:Connect(function(hit)
    local mensch = hit.Parent:FindFirstChild("Humanoid")
    if mensch then
        mensch.Health = 0
    end
end)

game.Players.PlayerAdded:Connect(function(spieler)
    local stats = Instance.new("Folder")
    stats.Name = "leaderstats"
    stats.Parent = spieler

    local geld = Instance.new("IntValue")
    geld.Name = "Geld"
    geld.Value = 0
    geld.Parent = stats
end)

local pad = script.Parent
local boostDauer = 5 -- Sekunden

pad.Touched:Connect(function(hit)
    local mensch = hit.Parent:FindFirstChild("Humanoid")
    if mensch and mensch:FindFirstChild("WalkSpeed") then
        mensch.WalkSpeed = 60
        task.wait(boostDauer)
        mensch.WalkSpeed = 16 -- Standardwert
    end
end)

local spawnOrt = Vector3.new(0, 10, 0) -- Koordinaten anpassen

game.Players.PlayerAdded:Connect(function(spieler)
    spieler.CharacterAdded:Connect(function(character)
        character:SetPrimaryPartCFrame(CFrame.new(spawnOrt))
    end)
end)

game.Players.PlayerAdded:Connect(function(spieler)
    spieler.Chatted:Connect(function(nachricht)
        if nachricht == "!feuer" then
            local feuer = Instance.new("Fire")
            feuer.Parent = spieler.Character
            task.wait(10)
            feuer:Destroy()
        end
    end)
end)

local ziel = Vector3.new(100, 50, 100) -- Zielkoordinaten

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        local spieler = game.Players.LocalPlayer
        if spieler.Character then
            spieler.Character:SetPrimaryPartCFrame(CFrame.new(ziel))
        end
    end
end)

local spieler = game.Players.LocalPlayer
local mensch = spieler.Character:WaitForChild("Humanoid")
mensch.UseJumpPower = true
mensch.JumpPower = 100
