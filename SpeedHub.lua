title = "Speed Hub"
motd = "'Appear weak when you are strong, and strong when you are weak.'- Sun Tzu, The Art of War"
motdTime = 5

local autoFarm = false
local autoRing = false
local dwWorkspace = game:GetService("Workspace")
local dwballs = dwWorkspace.orbFolder.City
local dwrings = dwWorkspace.Hoops

local dwPos = nil

function doFarmRings()
    spawn(function ()
        while wait() do
            if not autoRing then break end
            for i, v in pairs(dwrings:GetChildren()) do
                if not autoRing then break end
                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart , v, 0)
                wait(0.1)
                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart , v, 1)
            end
        end
    end)
end

function doFarmOrb()
    spawn(function ()
        while wait() do
            if not autoFarm then break end
            for i, v in pairs(dwballs:GetChildren()) do
                repeat
                    wait(0.1)
                until v:FindFirstChild('outerOrb') or v:FindFirstChild('outerGem')
                if not autoFarm then break end
                if v:FindFirstChild('outerOrb') or v:FindFirstChild('outerGem') then
                    if v:FindFirstChild('outerOrb') then
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart , v.outerOrb, 0)
                        wait(0.1)
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart , v.outerOrb, 1)
                    else
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart , v.outerGem, 0)
                        wait(0.1)
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart , v.outerGem, 1)
                    end
                end
            end
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

_G.MainColor = Color3.fromRGB(20,20,20);
_G.SecondaryColor = Color3.fromRGB(30,30,30);
_G.TertiaryColor = Color3.fromRGB(30,30,30);
_G.ArrowColor = Color3.fromRGB(205,89,89);
_G.MainTextColor = Color3.fromRGB(255,255,255);
_G.PointerColor = Color3.fromRGB(205,89,89);
_G.ButtonTextColor = Color3.fromRGB(255,255,255);
_G.SliderColor = Color3.fromRGB(30,30,30);
_G.ButtonColor = Color3.fromRGB(30,30,30);
_G.ToggleColor = Color3.fromRGB(205,89,89);
_G.DraggerCircleColor = Color3.fromRGB(255,255,255);

local w = library:CreateWindow("Speed Hub") -- Creates the window

local f= w:CreateFolder("Farming") -- Creates the folder(U will put here your buttons,etc)

local m = w:CreateFolder("Misc")

f:Toggle("Auto farm Orbs", function (bool)
    autoFarm = bool
    doFarmOrb()
end)


f:Toggle("Auto farm Rings", function (bool)
    autoRing = bool
    doFarmRings()
end)

m:Button("Save Position",function ()
    dwPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
end)

m:Button("Load Position",function ()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = dwPos
end)

m:DestroyGui()

game.StarterGui:SetCore("SendNotification", {
    Title = title;
    Text = motd;
    Duration = motdTime;
})