getgenv().autoHatch = false;
getgenv().tripleHatch = false;
getgenv().autoSmelt = false;
getgenv().autoSpin = false;




local remotePath = game:GetService("ReplicatedStorage").Events;


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Treasure Hunt Islands GUI", "Sentinel")

local a = Window:NewTab("Main")
local Sect = a:NewSection("Information")
Sect:NewLabel("Created by am soul#6331")
Sect:NewLabel("dm for questions maybe idk")






local b = Window:NewTab("Eggs")
local Section = b:NewSection("Auto Hatch")
				Section:NewToggle("Auto Hatch", "read the name", function(state)
					getgenv().autoHatch = state 					
			if state then		
		hatchEgg();	
	end
end)

Section:NewToggle("Triple Hatch Egg", "dont ask me what this does", function(state)
	getgenv().tripleHatch = state 						
		if state then		
		triplehatchEgg();	
	end
end)


local selectedEgg;
local oldList = {
    "PRESS UPDATE"
  }
  local newList = {
    "Moonlight Egg",
    "Stranded Egg",
	"Spikey Egg",
	"Jungle Egg",
	"Exotic Egg",
	"Snowy Egg",
	"Glacier Egg",
	"Uncommon Egg",
	"Basic Egg",
	"Buried Treasure Egg",
	"Pirate Egg"
  }
  local dropdown = Section:NewDropdown("Dropdown","Info", oldList, function(value)
	selectedEgg = value;
	print(value)
  end
  
  end)
  Section:NewButton("Update Dropdown", "Refreshes Dropdown", function(value)
    dropdown:Refresh(newList)

  selectedEgg = value;
  print(value)
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
			local args = {[1] = selectedEgg, [2] = 1}
			remotePath.RequestEggHatch:FireServer(unpack(args))
			wait(1)
		end
	end)
end

function triplehatchEgg()
	spawn(function()
		while tripleHatch == true do
			local args = {[1] = selectedEgg, [2] = 3}
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








