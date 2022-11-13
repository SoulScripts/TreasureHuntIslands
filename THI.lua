getgenv().autoHatch = false;
getgenv().autoSmelt = false;
getgenv().autoSpin = false;
getgenv().thisvalue = 'my name';


local remotePath = game:GetService("ReplicatedStorage").Events;


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Treasure Hunt Islands GUI", "Sentinel")

local a = Window:NewTab("Main")
local Sect = a:NewSection("Information")
Sect:NewLabel("Created by am soul#6331")
Sect:NewLabel("dm for questions maybe idk")






local b = Window:NewTab("Eggs")
local Section = b:NewSection("Auto Hatch")
				Section:NewToggle("Auto Hatch", "qweqew", function(state)
					getgenv().autoHatch = state 
						print("hi");						
			if state then		
		hatchEgg();	
	end
end)





local c = Window:NewTab("Smelting")



local d = Window:NewTab("Spin")
local Section = d:NewSection("Auto Spin")
				Section:NewToggle("Auto Spin", "qweqew", function(state)
					getgenv().autoSpin = state 
						print("hi");						
			if state then		
		spinWheel();	
	end
end)

local e = Window:NewTab("Info")

function hatchEgg()
	spawn(function()
		while autoHatch == true do
			local args = {[1] = "Pirate Egg", [2] = 1}
			remotePath.RequestEggHatch:FireServer(unpack(args))
			wait(1)
		end
	end)
end


function smeltOre(OreType)
	spawn(function()
		while autoSmelt == true do
			local args = {[1] = "SmeltMaterial",[2] = "Copper Ore",[3] = true}
			remotePath.UIAction:FireServer(unpack(args))
		end
	end)
end


function spinWheel()
	spawn(function()
		while autoSpin == true do
			local args = {[1] = 1,[2] = 2,[3] = 3,[4] = 4,[5] = 5,[6] = 6,[7] = 7,[8] = 8,[9] = 9,[10] = 10,[11] = 11,[12] = 12}
			remotePath.ClaimDailyReward:InvokeServer(unpack(args))
		end
	end)
end
		

function getCurrentPlayerPOS()
	local plyr = game.Players.LocalPlayer;
		if plyr.Character then
		return plyr.Character.HumanoidRootPart.Position;
		end
	return false;
end	

function teleportTO(placeCFrame)
	local plyr = game.Players.LocalPlayer;
		if plyr.Character then
		plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
	end
end


function teleportWorld(world)
	if game:GetService("Workspace").AreaItems["Main Island"].Travel then
		teleportTO(game:GetService("Workspace").AreaItems["Main Island"].Travel.CFrame)
	end
end
