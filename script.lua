--Disable Errors
if getconnections then
   for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
       v:Disable()
   end
   for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
       v:Disable()
   end
   
end
--Config
--Teleport Section
getgenv().CtrlTp = false
getgenv().CtrlTween = false
--Fruit Section
getgenv().GetFruits = false
-- Only Bring Fruit In Small Distance 
getgenv().BringFruit = true
--Will Stop AutoFarming If You Turn On These Two Below
getgenv().TeleportFruit = false
getgenv().NaturalFruit = false
getgenv().AutoBuyRandomFruit = false
--Loading Game
repeat wait()
until game:IsLoaded()
repeat wait()
until game.Players.LocalPlayer
repeat wait()
until game.Players.LocalPlayer.Character
--Check PlaceId
if game.PlaceId == 2753915549 then
   FirstSea = true
elseif game.PlaceId == 4442272183 then
   SecondSea = true
elseif game.PlaceId == 7449423635 then
   ThirdSea = true
end
--Define Vars
VirtualUser = game:GetService("VirtualUser")
VIM =game:GetService("VirtualInputManager")
ReplStorage = game:GetService("ReplicatedStorage");

Players = game:GetService("Players")
spawn(function()
   while wait() do
      LP = game:GetService("Players").LocalPlayer
      Char = LP.Character
      HumanoidRootPart = Char:FindFirstChild("HumanoidRootPart")
      Humanoid = Char:FindFirstChild("Humanoid")
      PlrLevel = LP.Data.Level.Value
      MyFragment = LP.Data.Fragments.Value
      placeId = game.PlaceId
      MyBeli = LP.Data.Beli.Value
      MyDevilFruit = LP.Data.DevilFruit.Value
   end
end)
LP = game:GetService("Players").LocalPlayer
Char = LP.Character
HumanoidRootPart = Char:FindFirstChild("HumanoidRootPart")
Humanoid = Char:FindFirstChild("Humanoid")
filename = "IslandSetting.lua";
http = game:GetService('HttpService') 
req =  http_request or request or HttpPost or syn.request -- get request
Mouse = LP:GetMouse()
themes = {
   Background = Color3.fromRGB(15,15,15), 
   Glow = Color3.fromRGB(255, 255, 255), 
   Accent = Color3.fromRGB(10, 10, 10), 
   LightContrast = Color3.fromRGB(20, 20, 20), 
   DarkContrast = Color3.fromRGB(0.05,0.05,0.05),  
   TextColor = Color3.fromRGB(255, 255, 255)
}
CanTween = true
MaxLevelSea = 0
Weapon = ""
PLrWeapons = {}
SpecialMob = "JustAranDOmString"
PlayerTable = {}
HighestLvToFarm =  0
ServerPlayers = 6
TableBoss = {}
BossesTable ={}
ListMelee = {
   "Combat",
   "Black Leg";
   "Electro";
   "Fishman Karate";
   "Dragon Claw";
   "Superhuman";
   "DeathStep";
   "SharkmanKarate";
   "Electric Claw";
}

--Require
ClickMod = require(LP.PlayerScripts.CombatFramework)
CamMod = require(game.ReplicatedStorage.Util.CameraShaker)

--Anti AFK V1
LP.Idled:connect(function()
   VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
--Anti AFK V2
for i,v in pairs(getconnections(LP.Idled)) do
   v:Disable()
end
--Define getgenv
getgenv().SilentAimMob = false
getgenv().SilentAimPlr = false
getgenv().AutoSaber = false
getgenv().AFDistance = 500
getgenv().AF2Distance = 500 
getgenv().HealthMastery = 25
--Default Setting
getgenv().AutoFarmQuest = true
getgenv().AutoFarmBring = true
getgenv().AutoSetSpawn = false
getgenv().AutoFarmSafeMode = false
getgenv().AutoFarmHealthSafeMode = 30
getgenv().FastAttack = true

getgenv().SkillZ = true
getgenv().SkillZHold = 0
getgenv().SkillX = true
getgenv().SkillXHold = 0
getgenv().SkillC = true
getgenv().SkillCHold = 0
getgenv().SkillV = true
getgenv().SkillVHold = 0
getgenv().SkillF = true
getgenv().SkillFHold = 0

getgenv().SkillZGun = true
getgenv().SkillXGun = true


getgenv().RecommendedSpeed = true
getgenv().TweenSpeedAutoFarm = 200
getgenv().TweenSpeedQuest = 350
getgenv().TweenSpeedTeleportPlace = 350
getgenv().TweenSpeedAutoChest = 350
getgenv().NearNextIsland = false
getgenv().AutoBuso = true
getgenv().AutoObservation = false
--Default Setting
getgenv().Setting = {
   getgenv().AutoFarmQuest;
   getgenv().AutoFarmBring;
   getgenv().AutoSetSpawn;
   getgenv().AutoFarmSafeMode ;
   getgenv().AutoFarmHealthSafeMode ;
   getgenv().FastAttack;
   getgenv().SkillZ ;
   getgenv().SkillZHold ;
   getgenv().SkillX ;
   getgenv().SkillXHold;
   getgenv().SkillC ;
   getgenv().SkillCHold ;
   getgenv().SkillV ;
   getgenv().SkillVHold ;
   getgenv().SkillF ;
   getgenv().SkillFHold ;
   getgenv().SkillZGun ;
   getgenv().SkillXGun ;
   getgenv().RecommendedSpeed;
   getgenv().TweenSpeedAutoFarm ;
   getgenv().TweenSpeedQuest;
   getgenv().TweenSpeedTeleportPlace;
   getgenv().TweenSpeedAutoChest;
   getgenv().AutoBuso;
   getgenv().AutoObservation;
}
--Define Functions
function SeatsFunction()
   
   for i,v in pairs(game:GetService("Workspace").Boats:GetDescendants()) do
      if v:IsA("Seat") then
         v.Disabled = not v.Disabled
      end
   end

   if ThirdSea then
      game:GetService("Workspace").Game.P1.Disabled = not game:GetService("Workspace").Game.P1.Disabled
      game:GetService("Workspace").Game.P2.Disabled = not game:GetService("Workspace").Game.P2.Disabled
      game:GetService("Workspace").Map.Turtle.TradeTable.P1.Disabled = not game:GetService("Workspace").Map.Turtle.TradeTable.P1.Disabled
      game:GetService("Workspace").Map.Turtle.TradeTable.P2.Disabled = not game:GetService("Workspace").Map.Turtle.TradeTable.P2.Disabled

      for i,v in pairs(game:GetService("Workspace").Map.Turtle:GetDescendants()) do
         if v:IsA("Seat") then
            v.Disabled = not v.Disabled
         end
      end
   end
   if SecondSea then
      game:GetService("Workspace").Game.P1.Disabled = not game:GetService("Workspace").Game.P1.Disabled
      game:GetService("Workspace").Game.P2.Disabled = not game:GetService("Workspace").Game.P2.Disabled
      game:GetService("Workspace").Map.Dressrosa.TradeTable.P1.Disabled = not game:GetService("Workspace").Map.Dressrosa.TradeTable.P1.Disabled
      game:GetService("Workspace").Map.Dressrosa.TradeTable.P2.Disabled = not game:GetService("Workspace").Map.Dressrosa.TradeTable.P2.Disabled
      for i,v in pairs(game:GetService("Workspace").Map.Dressrosa.Tavern:GetDescendants()) do
         if v:IsA("Seat") then
            v.Disabled = not v.Disabled
         end
      end

   end
end

function Alive()
   if LP and Char then
      if Humanoid and HumanoidRootPart then
         if Humanoid.Health > 0 then
            return true
         end 
      end
   end
   return false
end
function EnterCode(Code)
   game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Code)
end

function Click()
   pcall(function()
      --ClickMod.activeController:attack()
      VirtualUser:CaptureController()
      VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
   end)
end
function Equip(Tool)
   pcall(function()
      spawn(function()
         local ToolEquip =  game.Players.LocalPlayer.Backpack:FindFirstChild(Tool)
         if Humanoid then
            Humanoid:EquipTool(ToolEquip)
         end
      end)
   end)
end



function FastAttack()
   pcall(function()
      if getgenv().FastAttack then
         ClickMod.activeController.attacking = false 
         ClickMod.activeController.active = false
         ClickMod.activeController.timeToNextAttack = 0
         ClickMod.activeController.increment = 5
     end
   end)
end
getgenv().HitBox  = true
function HitBoxPlr()
   pcall(function()
      if getgenv().HitBox then
         if ClickMod.activeController.hitboxMagnitude ~= 60 then
            ClickMod.activeController.hitboxMagnitude = 60 
         end
      end
   end)
end
--Simulation
function Simulation()
   if setsimulationradius then
      sethiddenproperty(LP, "SimulationRadius", 10000)
   end
   if setsimulationradius then
      sethiddenproperty(LP, "MaxSimulationRadius", math.huge)
   end
   if setsimulationradius then
      sethiddenproperty(LP, "SimulationRadius", math.huge)
   end
end
--KillAura
function KillAuraF()
   for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Parent and v:FindFirstChild("LowerTorso") and v:FindFirstChild("Head") and v:FindFirstChild("UpperTorso") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
         Simulation()
         pcall(function()
            if (v.HumanoidRootPart.Position - HumanoidRootPart.Position).magnitude < 1000 then
              v:FindFirstChild("LowerTorso"):Destroy()
              v:FindFirstChild("UpperTorso"):Destroy()
              v:FindFirstChild("Head"):Destroy()
              v:breakJoints()
              v.Humanoid.Health = 0
              v.Humanoid.Health =  v.Humanoid.MaxHealth
              v.Humanoid.Health = 0
            end
         end)
      end
   end   
end


local function refreshPlayers()
  table.clear(PlayerTable)
  for i,v in pairs(game.Players:GetChildren()) do
      if not table.find(PlayerTable, v.Name) then
          table.insert(PlayerTable, v.Name)
     
      end
  end
end
local function refreshBosses()
   table.clear(BossesTable)
   for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if string.find(v.Name, "Boss") then
         table.insert(BossesTable, v.Name)
      end
   end
 end

function CheckQuestBoss()
   if FirstSea then
      if getgenv().ChosenBoss == "Saber Expert [Lv. 200] [Boss]" then
         BossName = "Saber Expert [Lv. 200] [Boss]"
         QuestNameBoss = nil
      elseif getgenv().ChosenBoss == "The Gorilla King [Lv. 25] [Boss]" then
         BossName = "The Gorilla King [Lv. 25] [Boss]"
         QuestNameBoss = "JungleQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732)
      elseif getgenv().ChosenBoss == "Bobby [Lv. 55] [Boss]" then
         BossName = "Bobby [Lv. 55] [Boss]"
         QuestNameBoss = "BuggyQuest1"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211)
      elseif getgenv().ChosenBoss == "Yeti [Lv. 110] [Boss]" then
         BossName = "Yeti [Lv. 110] [Boss]"
         QuestNameBoss = "SnowQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825)
      elseif getgenv().ChosenBoss == "Mob Leader [Lv. 120] [Boss]" then
         BossName = "Mob Leader [Lv. 120] [Boss]"
         QuestNameBoss = nil
      elseif getgenv().ChosenBoss == "Vice Admiral [Lv. 130] [Boss]" then
         BossName = "Vice Admiral [Lv. 130] [Boss]"
         QuestNameBoss = "MarineQuest2"
         LvQuestBoss = 2
         QuestCFrameBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293)
      elseif getgenv().ChosenBoss == "Warden [Lv. 175] [Boss]" then
         BossName = "Warden [Lv. 175] [Boss]"
         QuestNameBoss = "ImpelQuest"
         LvQuestBoss = 1
         QuestCFrameBoss = CFrame.new(4851.35059, 5.68744135, 743.251282)
      elseif getgenv().ChosenBoss == "Chief Warden [Lv. 200] [Boss]" then
         BossName = "Chief Warden [Lv. 200] [Boss]"
         QuestNameBoss = "ImpelQuest"
         LvQuestBoss = 2
         QuestCFrameBoss = CFrame.new(4851.35059, 5.68744135, 743.251282)
      elseif getgenv().ChosenBoss == "Flamingo [Lv. 225] [Boss]" then
         BossName = "Flamingo [Lv. 225] [Boss]"
         QuestNameBoss = "ImpelQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(4851.35059, 5.68744135, 743.251282)
      elseif getgenv().ChosenBoss == "Magma Admiral [Lv. 350] [Boss]" then
         BossName = "Magma Admiral [Lv. 350] [Boss]"
         QuestNameBoss = "MagmaQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699)
      elseif getgenv().ChosenBoss == "Fishman Lord [Lv. 425] [Boss]" then
         BossName = "Fishman Lord [Lv. 425] [Boss]"
         QuestNameBoss = "FishmanQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018)
      elseif getgenv().ChosenBoss == "Wysper [Lv. 500] [Boss]" then
         BossName = "Wysper [Lv. 500] [Boss]"
         QuestNameBoss = "SkyExp1Quest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954)
      elseif getgenv().ChosenBoss == "Thunder God [Lv. 575] [Boss]" then
         BossName = "Thunder God [Lv. 575] [Boss]"
         QuestNameBoss = "SkyExp2Quest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706)
      elseif getgenv().ChosenBoss == "Cyborg [Lv. 675] [Boss]" then
         BossName = "Cyborg [Lv. 675] [Boss]"
         QuestNameBoss = "FountainQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166)
      end
   elseif SecondSea then
      if getgenv().ChosenBoss == "Diamond [Lv. 750] [Boss]" then
         BossName = "Diamond [Lv. 750] [Boss]"
         QuestNameBoss = "Area1Quest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589)
      elseif getgenv().ChosenBoss == "Jeremy [Lv. 850] [Boss]" then
         BossName = "Jeremy [Lv. 850] [Boss]"
         QuestNameBoss = "Area2Quest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(632.698608, 73.1055908, 918.666321)
      elseif getgenv().ChosenBoss == "Fajita [Lv. 925] [Boss]" then
         BossName = "Fajita [Lv. 925] [Boss]"
         QuestNameBoss = "MarineQuest3"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523)
      elseif getgenv().ChosenBoss == "Don Swan [Lv. 1000] [Boss]" then
         BossName = "Don Swan [Lv. 1000] [Boss]"
         QuestNameBoss = nil
      elseif getgenv().ChosenBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
         BossName = "Smoke Admiral [Lv. 1150] [Boss]"
         QuestNameBoss = "IceSideQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373)
      elseif getgenv().ChosenBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
         BossName = "Cursed Captain [Lv. 1325] [Raid Boss]"
      elseif getgenv().ChosenBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
         BossName = "Awakened Ice Admiral [Lv. 1400] [Boss]"
         QuestNameBoss = "FrostQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908)
      elseif getgenv().ChosenBoss == "Tide Keeper [Lv. 1475] [Boss]" then
         BossName = "Tide Keeper [Lv. 1475] [Boss]"
         QuestNameBoss = "ForgottenQuest"             
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324)
      end
      
   elseif ThirdSea then
      if getgenv().ChosenBoss == "Stone [Lv. 1550] [Boss]" then
         BossName = "Stone [Lv. 1550] [Boss]"
         QuestNameBoss = "PiratePortQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-288.003815, 43.7675667, 5573.12012)
      elseif getgenv().ChosenBoss == "Island Empress [Lv. 1675] [Boss]" then
         BossName = "Island Empress [Lv. 1675] [Boss]"
         QuestNameBoss = "AmazonQuest2"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(5444.14355, 601.603821, 751.306763)
      elseif getgenv().ChosenBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
         BossName = "Kilo Admiral [Lv. 1750] [Boss]"
         QuestNameBoss = "MarineTreeIsland"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(2223.3645, 28.7049141, -6719.18408)
      elseif getgenv().ChosenBoss == "Captain Elephant [Lv. 1875] [Boss]" then
         BossName = "Captain Elephant [Lv. 1875] [Boss]"
         QuestNameBoss = "DeepForestIsland"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-13231.1602, 333.744446, -7624.40723)
      elseif getgenv().ChosenBoss == "Cake Queen" then
         BossName = "Cake Queen"
         QuestNameBoss = "IceCreamIslandQuest"
         LvQuestBoss = 3
         QuestCFrameBoss = CFrame.new(-821.71612548828, 65.819519042969, -10965.169921875)
      end
	end 
end
function BringMob()
   if getgenv().AutoFarmBring and DoMagnet then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
         if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0  and not Tweening  then
            if v.Parent and Alive() and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and not Tweening and (v.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude <=  350 and not Tweening then 
               if v.Name == NameMob or (string.find(v.Name,CurrentMobName) and string.find(v.Name,HighestLvToFarm) ) or string.find(v.Name,SpecialMob) and not string.find(v.name,"Boss") then
                  Simulation()
                  HitBoxPlr()
                  v.Humanoid.WalkSpeed = 0
                  v.HumanoidRootPart.Transparency = 1
                  v.HumanoidRootPart.CanCollide = false
                  v.HumanoidRootPart.Size = Vector3.new(10, 2, 10)
                  if BringCFrame~= nil and BringPos ~= nil  and  (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                     Simulation()
                     v.HumanoidRootPart.CFrame = BringCFrame
                     v.HumanoidRootPart.Position = BringPos
                  end
               end
            end
         end
      end
   end
end
function BringMobBone()
   if getgenv().AutoFarmBring and DoMagnet then
       if ThirdSea then
           for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
               if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0  and not Tweening then
                   if  v.Parent and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and not Tweening and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=  2500 then -- and string.find(v.Name,HighestLvToFarm) and not BringBone  
                       Simulation()
                       --Spawn(function()
                         --if getgenv().AutoFarmBone then
                             --for i2,v2 in pairs(v:GetChildren()) do
                                --if v2:IsA("BasePart") or v2.ClassName == "MeshPart" or v2.Name == "Head" and getgenv().AutoFarmBone then
                                   --v2.Transparency = 0.9
                               -- elseif v2.ClassName == "Accessory"  and getgenv().AutoFarmBone then
                                   --v2.Handle.Transparency = 0.9
                               -- end
                            -- end
                          --end
                      --end)
                       --v.Humanoid.Sit = true
                       --if v.Parent ~= nil  then
                          --for _, child in pairs(v:GetDescendants()) do
                             --if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                                --child.CanCollide = false
                             --end
                          --end
                       --end
                       --v.Humanoid.PlatformStand = true
                       v.Humanoid.WalkSpeed = 1
                       v.HumanoidRootPart.Transparency = 1
                       --v.HumanoidRootPart.CanCollide = false
                       --v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                       if BringCFrame~= nil and BringPos ~= nil  and  (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                          Simulation()
                          v.HumanoidRootPart.CFrame = BringCFrame
                          v.HumanoidRootPart.Position = BringPos
                       else 
                         -- BringCFrame = v.HumanoidRootPart.CFrame
                         -- BringPos = v.HumanoidRootPart.Position
                       end
                   end
               end
           end
       end
   end
end
function BringMobEctoplasm()
  if getgenv().AutoFarmBring and DoMagnet then
      if SecondSea then
          for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0  and not Tweening then
                  if  v.Parent and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and not Tweening and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=  2500 then -- and string.find(v.Name,HighestLvToFarm) and not BringBone  
                      Simulation()
                      --Spawn(function()
                        --if getgenv().AutoFarmBone then
                            --for i2,v2 in pairs(v:GetChildren()) do
                               --if v2:IsA("BasePart") or v2.ClassName == "MeshPart" or v2.Name == "Head" and getgenv().AutoFarmBone then
                                  --v2.Transparency = 0.9
                              -- elseif v2.ClassName == "Accessory"  and getgenv().AutoFarmBone then
                                  --v2.Handle.Transparency = 0.9
                              -- end
                           -- end
                         --end
                     --end)
                      --v.Humanoid.Sit = true
                      --if v.Parent ~= nil  then
                         --for _, child in pairs(v:GetDescendants()) do
                            --if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                               --child.CanCollide = false
                            --end
                         --end
                      --end
                      --v.Humanoid.PlatformStand = true
                      v.Humanoid.WalkSpeed = 1
                      v.HumanoidRootPart.Transparency = 1
                      --v.HumanoidRootPart.CanCollide = false
                      --v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      if BringCFrame~= nil and BringPos ~= nil  and  (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                         Simulation()
                         v.HumanoidRootPart.CFrame = BringCFrame
                         v.HumanoidRootPart.Position = BringPos
                      else 
                        -- BringCFrame = v.HumanoidRootPart.CFrame
                        -- BringPos = v.HumanoidRootPart.Position
                      end
                  end
              end
          end
      end
  end
end
function refreshWeapon1()

  table.clear(PLrWeapons)
  for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
     if not table.find(PLrWeapons, v.name) then
        if v:IsA("Tool") then
           table.insert(PLrWeapons ,v.Name)
        end
     end
 end

  for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
     if not table.find(PLrWeapons, v.name) then
        if v:IsA("Tool") then
           table.insert(PLrWeapons ,v.Name)
        end
     end
  end

end
loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/BloxFruit/main/Functions.lua"))()

--Do Functions
local mt = getrawmetatable(game)
local oldindex = mt.__index
setreadonly(mt, false)
mt.__index = newcclosure(function(t, k)
   if t:IsA("Mouse") and (k == "Hit") then
     if getgenv().SilentAimPlr then 
        if plr ~= nil and plr ~= "" then
           if plr and plr:FindFirstChild("HumanoidRootPart") and plr:FindFirstChild("Humanoid") and plr:FindFirstChild("Humanoid").Health > 0 and getgenv().SilentAimPlr then
              return (k == "Hit" and plr.HumanoidRootPart.CFrame or plr.HumanoidRootPart)
           end
        end
     end
   end
   return oldindex(t, k)
end)
setreadonly(mt, true)
local mt = getrawmetatable(game)
local oldindex = mt.__index
setreadonly(mt, false)
mt.__index = newcclosure(function(t, k)
    if t:IsA("Mouse") and (k == "Hit" ) then
      if getgenv().SilentAimMob then 
         if MobSilent ~= nil and MobSilent ~= "" then
            if MobSilent and MobSilent:FindFirstChild("HumanoidRootPart") and MobSilent:FindFirstChild("Humanoid") and MobSilent:FindFirstChild("Humanoid").Health > 0 then
               return (k == "Hit" and MobSilent.HumanoidRootPart.CFrame or MobSilent.HumanoidRootPart)
            end
         end
      end
    end
    return oldindex(t, k)
end)
setreadonly(mt, true)
CamMod:Stop()
LoadSetting()

--Extra Functions
spawn(function()
   while game:GetService("RunService").RenderStepped:wait(0.1) do
       pcall(function()
           for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
               if v:FindFirstChild("Humanoid") ~= nil  and v:FindFirstChild("HumanoidRootPart") ~= nil and v:IsA("Model") then
                   v.Parent = game:GetService("Workspace").Enemies
               end
           end
           for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
               if v:FindFirstChild("Humanoid") ~= nil  and v:FindFirstChild("HumanoidRootPart") ~= nil and v:IsA("Model") then
                   v.Parent = game:GetService("Workspace").Enemies
               end
           end
       end)
   end
end)
for i,v in pairs(LP.Backpack:GetChildren()) do  
   if v:IsA("Tool") then
       table.insert(PLrWeapons ,v.Name)
   end
end

for i,v in pairs(Char:GetChildren()) do  
  if v:IsA("Tool") then
     table.insert(PLrWeapons ,v.Name)
  end
end

for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
   if string.find(v.Name, "Boss") then
      table.insert(BossesTable, v.Name)
   end
end

for i,v in pairs(game.Players:GetChildren()) do  
  table.insert(PlayerTable ,v.Name)
end

if SecondSea then
  MaxLevelSea = 1450
elseif ThirdSea then
  MaxLevelSea = 2150
elseif FirstSea then
   MaxLevelSea = 675
end
--Get Boss
for i,v in pairs(require(game:GetService("ReplicatedStorage").Quests)) do
   local PlrLevel = game.Players.localPlayer.Data.Level.Value

   if typeof(v) == "table" then
       for i2,v2 in pairs(v) do
           IsBoss = false
           for i3,v3 in pairs(v2) do
               
               if i3 == "Task" then    
                   for i4,v4 in pairs(v3) do
                       if v4 == 1 then
                          IsBoss = true
                       end
                   end
               end
               if IsBoss then
                   if i3 == "Name" then    
                       if not table.find(TableBoss, v3) then
                           table.insert(TableBoss, v3)
                       end
                   end
                   if i3 == "LevelReq" then  
                   end
               end
           end
       end
   end
end
--Ui
loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/Island_Game/main/version.lua"))()
lib:Notify("Island","Ui Made by Denosaur")
wait(1)
lib:Notify("Island","Loading Functions + Data")

local MainPage = lib:addPage("Main")
local AutoFarm = MainPage:addSection("Auto Farm")
AutoFarm:addToggle("Auto Farm",getgenv().AutoFarm,function(boolen)
   getgenv().AutoFarm  = boolen
   --Check Quest
      CheckLv()
      repeat wait() until not CheckingMob

   --Equip
   spawn(function()
      while getgenv().AutoFarm and game:GetService("RunService").RenderStepped:wait(0.1) do
         
         if Char:FindFirstChild(Weapon) then
            Click()
         else
            Equip(Weapon)
         end
      end
   end)
   if getgenv().AutoFarm and getgenv().AutoFarmQuest then 
      CancelQuest()
   end

   if getgenv().AutoFarm then
      TweenFloat()
   else 
      DisabledNoClip = false
      RemoveFloat()
   end

   while getgenv().AutoFarm and game:GetService("RunService").RenderStepped:wait() do
      pcall(function()
         local SmallestDistance = math.huge
         if Alive() then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
               if not FirstSea then
                  if not Tweening and not string.find(v.Name,"Boss") and getgenv().AutoFarm and string.find(v.Name,CurrentMobName) and string.find(v.Name,HighestLvToFarm) then
                     if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                        if SmallestDistance > (v.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude then
                           SmallestDistance = (v.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude
                           MobToFarm = v
                        end
                     end
                  
                  end
               else
                  
                  if not Tweening and getgenv().AutoFarm and v.Name == NameMob  then
                     if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                        if SmallestDistance > (v.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude then
                           SmallestDistance = (v.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude
                           MobToFarm = v
                           
                        end
                     end
                  end
               end
            end

                  --Check Specific Mobs
                  TPSpecificPlace()
                  --Define Vars
                  OldY = MobToFarm.HumanoidRootPart.Position.Y
                  OldCFrame = MobToFarm.HumanoidRootPart.CFrame
                  DoMagnet = false
                  SecondPassed = 0
                  Simulation()
                  FastAttack()
                  --Get Bring Pos
                  if Alive() and MobToFarm:FindFirstChild("Humanoid") and MobToFarm.Humanoid.Health > 0 and MobToFarm.Parent and MobToFarm:FindFirstChild("HumanoidRootPart") then
                     BringCFrame = MobToFarm.HumanoidRootPart.CFrame
                     BringPos = MobToFarm.HumanoidRootPart.Position
                  end
                  DoTween(BringCFrame*CFrame.new(0,30,0),getgenv().TweenSpeedAutoFarm)
                  --Set Spawn
                  if getgenv().AutoSetSpawn then
                     if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and getgenv().AutoFarm and game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value ~= SpawnPoint and CanTween then
                        DoTween(SpawnCFrame,getgenv().TweenSpeedTeleportPlace)
                        local args = {
                           [1] = "SetSpawnPoint"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        wait(0.1)
                     end
                  end
                  --Get Quest
                  if getgenv().AutoFarmQuest then
                     if Alive() and getgenv().AutoFarm and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,CurrentMobName) then
                        if not FirstSea then
                           for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                              if v:FindFirstChild("Head") then
                                 if v.Head:FindFirstChild("Talk") and v.Head:FindFirstChild("QuestBBG") then
                                    if v.Head:FindFirstChild("QuestBBG").Title.Text == "QUEST" then
                                       QuestCFrame = v:FindFirstChild("HumanoidRootPart").CFrame
                                    end
                                 end
                              end
                           end
                        end
                        DoTween(QuestCFrame,getgenv().TweenSpeedQuest)
                        wait(0.1)
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- Vector3.new(QuestCFrame)).magnitude < 50 then
                           game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", CurrentQuestMob, CurrentQuestLevelMob)
                           wait(0.5)
                        elseif getgenv().AutoFarmQuest and getgenv().AutoFarm then 
                           DoTween(QuestCFrame,getgenv().TweenSpeedQuest)
                           game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", CurrentQuestMob, CurrentQuestLevelMob)
                           wait(0.5)
                        end
                     end
                  end
                  --Tp To Mob
                  if MobToFarm.Parent and MobToFarm:FindFirstChild("Humanoid") and MobToFarm:FindFirstChild("Humanoid").Health > 0 and  MobToFarm:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and getgenv().AutoFarm then
                     DisabledNoClip = true
                     DoTween(MobToFarm.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
                     DisabledNoClip = false
                  end
                  
                  --[[spawn(function()
                     CurrentKillMob = MobToFarm
                     while wait(1) do
                        if CurrentKillMob == MobToFarm then
                        SecondPassed = SecondPassed + 1
                        end
                        if SecondPassed == 20 then
                           SecondPassed = 0
                           if CurrentKillMob == MobToFarm and MobToFarm.Parent and MobToFarm:FindFirstChild("Humanoid") and MobToFarm:FindFirstChild("Humanoid").Health > 0 and  MobToFarm:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and MobToFarm:FindFirstChild("Humanoid").Health > 0 then
                              pcall(function()
                                 MobToFarm:FindFirstChild("LowerTorso"):Destroy()
                                 MobToFarm:FindFirstChild("UpperTorso"):Destroy()
                                 MobToFarm:FindFirstChild("Head"):Destroy()
                                 MobToFarm:breakJoints()
                                 MobToFarm.Humanoid.Health = 0
                                 MobToFarm.Humanoid.Health =  MobToFarm.Humanoid.MaxHealth
                                 MobToFarm.Humanoid.Health = 0
                              end)
                              break
                           else break;
                           end
                        end
                     end
                  end)]]--
                  repeat game:GetService("RunService").RenderStepped:wait()
                     if Alive() then
                        TPSpecificPlace()
                        TweenFloat()
                        Simulation()
                        FastAttack()
                        HitBoxPlr()
                        DisabledNoClip = true

                        if MobToFarm and MobToFarm:FindFirstChild("Humanoid") and MobToFarm:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and MobToFarm:FindFirstChild("Humanoid").Health > 0 and (MobToFarm.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude <= 300 then
                           spawn(function()
                              if not BringFarm then
                                 BringFarm = true    
                                 BringMob()
                                 --wait(1)
                                 BringFarm = false
                              end
                           end)
                           if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y >= MobToFarm.HumanoidRootPart.Position.y then
                              if MobToFarm.HumanoidRootPart.Position.Y - OldY >= 0 then
                                 spawn(function()
                                    wait()
                                    if getgenv().AutoFarm and MobToFarm.Parent and MobToFarm:FindFirstChild("Humanoid") and MobToFarm:FindFirstChild("HumanoidRootPart") ~= nil then
                                       if Alive() and MobToFarm:FindFirstChild("Humanoid").Health > 0 and (MobToFarm.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude <= 300 then
                                          TweenFloat()
                                          HumanoidRootPart.CFrame = MobToFarm.HumanoidRootPart.CFrame * CFrame.new(0, 20, 10)
                                       else
                                          DoTween(MobToFarm.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
                                       end
                                    end

                                 end)
                              else 
                                 Simulation() 
                                 MobToFarm.HumanoidRootPart.CFrame = OldCFrame
                                 wait(1)
                                 DoTween(MobToFarm.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
                              end
                           elseif getgenv().AutoFarm then
                              randomnumber = math.random(1,3)
                              if randomnumber == 1 then
                                 HumanoidRootPart.CFrame = MobToFarm.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                              elseif randomnumber ==2 then
                                 HumanoidRootPart.CFrame = MobToFarm.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                              elseif randomnumber ==3 then
                                 HumanoidRootPart.CFrame = MobToFarm.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                              end    
                           end
                        

                        elseif not Tweening and MobToFarm:FindFirstChild("HumanoidRootPart") ~= nil and MobToFarm.Parent and MobToFarm:FindFirstChild("Humanoid") and MobToFarm:FindFirstChild("Humanoid").Health > 0 and Alive() then  
                           BringCFrame = MobToFarm.HumanoidRootPart.CFrame
                           BringPos = MobToFarm.HumanoidRootPart.Position
                           DoTween(MobToFarm.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                           if MobToFarm.Parent and MobToFarm:FindFirstChild("Humanoid") and MobToFarm:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and MobToFarm:FindFirstChild("Humanoid").Health > 0 and (MobToFarm.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                              DoTween(MobToFarm.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                           end
                        end
                        DoMagnet = true
                     else wait(5)
                     end
                  until not MobToFarm.Parent or MobToFarm:FindFirstChild("Humanoid") == nil or MobToFarm.Humanoid.Health <= 0 or MobToFarm:FindFirstChild("HumanoidRootPart") == nil or not Alive() or getgenv().AutoFarm == false
                  SecondPassed = 0
                  DisabledNoClip = false
                  CheckLv()

         else wait(5)
         end
      end)
   end
   RemoveFloat()
end)

AutoFarm:addToggle("Auto Farm Fruit Mastery(Current Support Sea 2,3)",getgenv().AutoFarmFruitMastery,function(boolen)
   getgenv().AutoFarmFruitMastery = boolen
   --Check Level
      CheckLv()
      CheckQuestMob()
   if getgenv().AutoFarmFruitMastery and getgenv().AutoFarmQuest then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest") end
   if getgenv().AutoFarmFruitMastery then
      TweenFloat()
   else 
      DisabledNoClip = false
      RemoveFloat()
   end
   while getgenv().AutoFarmFruitMastery and game:GetService("RunService").RenderStepped:wait() do
      if getgenv().AutoFarmFruitMastery then
         FastAttack()
         if Alive() then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
               if string.find(v.Name,HighestLvToFarm) and not string.find(v.Name,"Boss") then

                  getgenv().SilentAimMob = true
                  local MobHumanoid = v:FindFirstChild("Humanoid")
                  local MobHRP = v:FindFirstChild("HumanoidRootPart")
                  local MobP = v.Parent
                  DoMagnet = false
                  OldY = MobHRP.Position.Y
                  OldCFrame = MobHRP.CFrame
                  MobSilent = v
                  Clicking = false
                  BringFarmFruit = false
                  if MobHumanoid and MobHRP and getgenv().AutoFarmFruitMastery then
                     if MobHumanoid.Health > 0 and Alive() then
                        DisabledNoClip = true
                        DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                        DisabledNoClip = false
                     end
                  end
                  if MobHumanoid and MobHRP and getgenv().AutoFarmFruitMastery then
                     if MobHumanoid.Health > 0 then
                        BringCFrame = v.HumanoidRootPart.CFrame
                        BringPos = v.HumanoidRootPart.Position
                     end
                  end
                  Equip(Weapon)
                  HitBoxPlr()
                  repeat game:GetService("RunService").RenderStepped:wait(0.1)
                     TweenFloat()
                     Clicking = true
                     spawn(function()
                        if not BringFarmFruit then
                           BringFarmFruit = true
                           BringMob()
                           --wait(0.2)
                           BringFarmFruit = false
                        end
                     end)
                     if MobHumanoid and MobHRP and getgenv().AutoFarmFruitMastery then
                        
                        if MobHumanoid.Health > 0 then
                           if MobHumanoid.Health > (MobHumanoid.MaxHealth*getgenv().HealthMastery)/100 then
                              Click()
                              if HumanoidRootPart.Position.y >= v.HumanoidRootPart.Position.y then
                                 if v.HumanoidRootPart.Position.Y - OldY >= 0 then
                                    spawn(function()
                                       wait()
                                       if getgenv().AutoFarmFruitMastery then
                                          if MobP and MobHumanoid and MobHRP then
                                             if Alive() and MobHumanoid.Health > 0 and (MobHRP.Position-HumanoidRootPart.Position).magnitude <= 300 then
                                                TweenFloat()
                                                HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                             else
                                                DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                             end
                                          end
                                       end
                                    end)
                                 else 
                                    
                                    v.HumanoidRootPart.CFrame = OldCFrame
                                    wait()
                                    DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                 end
                              else                                 
                                 if getgenv().AutoFarmFruitMastery then
                                    TweenFloat()
                                    local randomnumber = math.random(1,3)
                                    if randomnumber == 1 then
                                       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                                    elseif randomnumber ==2 then
                                       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                                    elseif randomnumber ==3 then
                                       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                                    end    
                                 end
                              end
                              DoMagnet = true
                           else
                              Equip(MyDevilFruit)
                              getgenv().UsingFruitMas = true
                              MobSilent = v
                              getgenv().SilentAimMob = true
                              spawn(function()
                                 while getgenv().UsingFruitMas == true and getgenv().AutoFarmFruitMastery and  v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 do
                                    wait()
                                    pcall(function()
                                       TweenFloat()
                                       HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                                    end)
                                 end
                              end)
                              
                              --Equip DevilFruit
                              --pcall(function()
                              --end)
                           
                              if game.Players.LocalPlayer.Data.DevilFruit.Value == "Control-Control" then
                                 pcall(function()
                                 if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillZ and not UsingSkill then
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).TextureId ~= "rbxassetid://4900750433" then
                                       VIM:SendKeyEvent(true,"Z",false,game)
                                       wait(getgenv().SkillZHold/10)
                                       VIM:SendKeyEvent(false,"Z",false,game)
                                    end

                                 end
                                 if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillX and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].X.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then
                                    VIM:SendKeyEvent(true,"X",false,game)
                                    wait(getgenv().SkillXHold/10)
                                    VIM:SendKeyEvent(false,"X",false,game)
                                 end
                                 if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillC and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].C.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then
                                    VIM:SendKeyEvent(true,"C",false,game)
                                    wait(getgenv().SkillCHold/10)
                                    VIM:SendKeyEvent(false,"C",false,game)
                                 end
                                 if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillV and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].V.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then
                                    VIM:SendKeyEvent(true,"V",false,game)
                                    wait(getgenv().SkillVHold/10)
                                    VIM:SendKeyEvent(false,"V",false,game)
                                 end
                              end)
                              
                              elseif game.Players.LocalPlayer.Data.DevilFruit.Value ~= "Control-Control" then

                                 pcall(function()
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                       Click()
                                    end
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillZ and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].Z.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then
                                       
                                       UsingSkill = true
                                       VIM:SendKeyEvent(true,"Z",false,game)
                                       wait(getgenv().SkillZHold/10)
                                       VIM:SendKeyEvent(false,"Z",false,game)
                                       UsingSkill = false
                                    end
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillX and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].X.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then
                                       UsingSkill = true
                                       VIM:SendKeyEvent(true,"X",false,game)
                                       wait(getgenv().SkillXHold/10)
                                       VIM:SendKeyEvent(false,"X",false,game)
                                       UsingSkill = false
                                    end
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillC and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].C.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then                                       
                                       UsingSkill = true
                                       VIM:SendKeyEvent(true,"C",false,game)
                                       wait(getgenv().SkillCHold/10)
                                       
                                       VIM:SendKeyEvent(false,"C",false,game)
                                       UsingSkill = false
                                    end
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillV and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].V.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then
                                       UsingSkill = true
                                       VIM:SendKeyEvent(true,"V",false,game)
                                       wait(getgenv().SkillVHold/10)
                                       VIM:SendKeyEvent(false,"V",false,game)
                                       UsingSkill = false
                                    end
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and getgenv().SkillF and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game.Players.LocalPlayer.Data.DevilFruit.Value].F.Cooldown.AbsoluteSize.X == 0 and not UsingSkill then
                                       UsingSkill = true
                                       VIM:SendKeyEvent(true,"F",false,game)
                                       wait(getgenv().SkillFHold/10)
                                       VIM:SendKeyEvent(false,"F",false,game)
                                       UsingSkill = false
                                    end
                                 end)
                              end
                           end
                        end
                     end
                  until not MobHumanoid or not MobHRP or not MobP or not getgenv().AutoFarmFruitMastery or MobHumanoid.Health <= 0 or not Alive()
                  --DeActive Control Room
                  if game.Players.LocalPlayer.Data.DevilFruit.Value == "Control-Control" then
                     repeat wait()
                        Equip(game.Players.LocalPlayer.Data.DevilFruit.Value)
                        VIM:SendKeyEvent(true,"Z",false,game)
                        wait()
                        VIM:SendKeyEvent(false,"Z",false,game)
                     until game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).TextureId ~= "rbxassetid://4900750433" 
                  end 
                  MobSilent = nil
                  DisabledNoClip = false
                  getgenv().UsingFruitMas = false
                  getgenv().SilentAimMob = false
                     CheckLv()
                     CheckQuestMob()
               end
            end
         end
      end
   end
   RemoveFloat()
end)
AutoFarm:addToggle("Auto Farm Gun Mastery(Current Support Sea 2,3)",getgenv().AutoFarmGunMastery,function(boolen)
   getgenv().AutoFarmGunMastery = boolen
      CheckLv()
      CheckQuestMob()

   if getgenv().AutoFarmGunMastery then
      TweenFloat()
   else
      DisabledNoClip = false
      RemoveFloat()
   end
   while getgenv().AutoFarmGunMastery and game:GetService("RunService").RenderStepped:wait() do
      if getgenv().AutoFarmGunMastery then
         FastAttack()
         if Alive() then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
               if string.find(v.Name,HighestLvToFarm) and string.find(v.Name, CurrentMobName) and not string.find(v.Name,"Boss") then
                  Equip(Weapon)
                  HitBoxPlr()
                  getgenv().SilentAimMob = true
                  local MobHumanoid = v:FindFirstChild("Humanoid")
                  local MobHRP = v:FindFirstChild("HumanoidRootPart")
                  local MobP = v.Parent
                  DoMagnet = false
                  OldY = MobHRP.Position.Y
                  OldCFrame = MobHRP.CFrame
                  MobSilent = v
                  Clicking = false
                  BringFarmGun = false
                  if MobHumanoid and MobHRP and getgenv().AutoFarmGunMastery then
                     if MobHumanoid.Health > 0 and Alive() then
                        DisabledNoClip = true
                        DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                        DisabledNoClip = false
                     end
                  end
                  if MobHumanoid and MobHRP and getgenv().AutoFarmGunMastery then
                     if MobHumanoid.Health > 0 then
                        BringCFrame = v.HumanoidRootPart.CFrame
                        BringPos = v.HumanoidRootPart.Position
                     end
                  end
                  repeat game:GetService("RunService").RenderStepped:wait(0.1)
                     TweenFloat()
                     Clicking = true
                     spawn(function()
                        if not BringFarmGun then
                           BringFarmGun = true
                           BringMob()
                           --wait(0.2)
                           BringFarmGun = false
                        end
                     end)
                     if MobHumanoid and MobHRP and getgenv().AutoFarmGunMastery then
                        
                        if MobHumanoid.Health > 0 then
                           if MobHumanoid.Health > (MobHumanoid.MaxHealth*getgenv().HealthMastery)/100 then
                              Click()
                              HitBoxPlr()
                              if HumanoidRootPart.Position.y >= v.HumanoidRootPart.Position.y then
                                 if v.HumanoidRootPart.Position.Y - OldY >= 0 then
                                    TweenFloat()
                                    spawn(function()
                                       wait()
                                       if getgenv().AutoFarmGunMastery then
                                          if MobP and MobHumanoid and MobHRP then
                                             if Alive() and MobHumanoid.Health > 0 and (MobHRP.Position-HumanoidRootPart.Position).magnitude <= 300 then
                                                TweenFloat()
                                                HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                             else
                                                DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                             end
                                          end
                                       end
                                    end)
                                 else 
                                    
                                    v.HumanoidRootPart.CFrame = OldCFrame
                                    wait()
                                    DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                 end
                              else                                 
                                 if getgenv().AutoFarmGunMastery then
                                    TweenFloat()
                                    local randomnumber = math.random(1,3)
                                    if randomnumber == 1 then
                                       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                                    elseif randomnumber ==2 then
                                       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                                    elseif randomnumber ==3 then
                                       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                                    end    
                                 end
                              end
                              DoMagnet = true
                           else
                              for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
                                 if v:IsA("Tool") then
                                    if v:FindFirstChild("RemoteFunctionShoot") then 
                                       GunFarmMas = v.Name
                                    end
                                 end
                              end
                              Equip(GunFarmMas)
                              getgenv().UsingGunMas = true
                              MobSilent = v
                              getgenv().SilentAimMob = true
                              spawn(function()
                                 while getgenv().UsingGunMas == true and getgenv().AutoFarmGunMastery and  v.Parent and v:FindFirstChild("Humanoid") and  v:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 do
                                    wait()
                                    pcall(function()
                                       wait(0.1)
                                       TweenFloat()
                                       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                                    end)
                                 end
                              end)
                              
                              --pcall(function()
                                 
                                 if Char:FindFirstChild(GunFarmMas) then
                                    Click()
                                    
                                 end
                                 if Char:FindFirstChild(GunFarmMas) and getgenv().SkillZGun and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 then
                                    VIM:SendKeyEvent(true,"Z",false,game)
                                    VIM:SendKeyEvent(false,"Z",false,game)
                                 end
                                 if Char:FindFirstChild(GunFarmMas) and getgenv().SkillXGun and v.Humanoid.Health <= (v:FindFirstChild("Humanoid").MaxHealth*getgenv().HealthMastery)/100 then
                                    VIM:SendKeyEvent(true,"X",false,game)
                                    VIM:SendKeyEvent(false,"X",false,game)
                                 end
                                 wait(0.5)
                              --end)
                        
                           end
                        end
                     end
                  until not MobHumanoid or not MobHRP or not MobP or not getgenv().AutoFarmGunMastery or MobHumanoid.Health <= 0 or not Alive()
                  --DeActive Control Room
                  MobSilent = nil
                  DisabledNoClip = false
                  
                  getgenv().UsingGunMas = false
                  getgenv().SilentAimMob = false
                  CheckLv()
                  CheckQuestMob()
               end
            end
         end
      end
   end
   RemoveFloat()
end)
AutoFarm:addSlider("Health Mastery (%) ",getgenv().HealthMastery,0,100,function(Value)
   getgenv().HealthMastery = Value
end)

AutoFarm:addTextbox("MaxLevelMob",MaxLevelSea,function(Value)
   if Alive() then
      CheckLv()
      if Value ~= nil then
         ValueChanged = tonumber(Value)
         
         if typeof(ValueChanged) == nil or typeof(ValueChanged) == "nil" then
            if not NotifyBoolen then
               NotifyBoolen = true
               lib:Notify("MaxLevelMob","Please Enter Number")
               wait(1)
               NotifyBoolen = false
            end
         elseif ThirdSea then
            if ValueChanged > 1499 then
            MaxLevelSea = ValueChanged
            HighestLvToFarm = 0
            CheckLv()
            elseif not NotifyBoolen then 
               NotifyBoolen = true 
               lib:Notify("MaxLevelMob","Please enter number over 1499")                       
               wait(1)
               NotifyBoolen = false        
            end
         elseif SecondSea then
            if ValueChanged > 699 and ValueChanged < 1500 then
               MaxLevelSea = ValueChanged
               HighestLvToFarm = 0
               CheckLv()
            elseif not NotifyBoolen then 
               NotifyBoolen = true 
               lib:Notify("MaxLevelMob","Pls enter number Between 700 and 1499")
               wait(1)
               NotifyBoolen = false     
            end
         elseif FirstSea then
            if ValueChanged >= 0 and ValueChanged <= 675 then
               MaxLevelSea = ValueChanged
               HighestLvToFarm = 0
               CheckLv()
            elseif not NotifyBoolen then 
               NotifyBoolen = true 
               lib:Notify("MaxLevelMob","Pls enter number Between 0 and 675")
               wait(1)
               NotifyBoolen = false     
            end
         end
      end
   end
end)

--Bosses Section
local AutoFarmBoss = MainPage:addSection("Auto Farm Boss")

local BossDropdown = AutoFarmBoss:addDropdown("Select Boss",BossesTable,function(Value)
   getgenv().ChosenBoss = Value
end)
AutoFarmBoss:addToggle("Kill Boss",false,function(boolen)
   getgenv().KillingBoss = boolen
   CheckQuestBoss()
   spawn(function()
      while getgenv().KillingBoss do
         wait()
         
         if Char:FindFirstChild(Weapon) then
            Click()
         else
            Equip(Weapon)
         end
      end
   end)
   if getgenv().KillingBoss and getgenv().AutoFarmQuest then 
      CancelQuest()
   end

   if getgenv().KillingBoss then
      TweenFloat()
   else 
      DisabledNoClip = false
      RemoveFloat()
   end
   while getgenv().KillingBoss and wait() do
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
         if v.Name == BossName then
            OldY = v.HumanoidRootPart.Position.Y
            OldCFrame = v.HumanoidRootPart.CFrame
            Simulation()
            FastAttack()
            --Get Quest
            if getgenv().AutoFarmQuest and QuestNameBoss then
               if Alive() and getgenv().KillingBoss and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                  if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and getgenv().KillingBoss then
                     DoTween(QuestCFrameBoss,getgenv().TweenSpeedQuest)
                     CancelQuest()
                     wait(0.1)
                     if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- Vector3.new(QuestCFrameBoss)).magnitude < 50 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QuestNameBoss, LvQuestBoss)
                        wait(0.5)
                     elseif getgenv().AutoFarmQuest and getgenv().KillingBoss then 
                        DoTween(QuestCFrameBoss,getgenv().TweenSpeedQuest)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QuestNameBoss, LvQuestBoss)
                        wait(0.5)
                     end
                  end
               end
            end
            --Tp To Boss
            if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and getgenv().KillingBoss then
               DisabledNoClip = true
               DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
               DisabledNoClip = false
            end
            repeat game:GetService("RunService").RenderStepped:wait()
               if Alive() then
                  TweenFloat()
                  Simulation()
                  FastAttack()
                  HitBoxPlr()
                  DisabledNoClip = true

                  if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude <= 300 then

                     if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y >= v.HumanoidRootPart.Position.y then
                        if v.HumanoidRootPart.Position.Y - OldY >= 0 then
                           spawn(function()
                              wait()
                              if getgenv().KillingBoss and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                 if Alive() and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude <= 300 then
                                    TweenFloat()
                                    HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 10)
                                 else
                                    DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
                                 end
                              end

                           end)
                        else 
                           wait()
                           DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
                        end
                     elseif getgenv().KillingBoss then
                        randomnumber = math.random(1,3)
                        if randomnumber == 1 then
                           HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                        elseif randomnumber ==2 then
                           HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                        elseif randomnumber ==3 then
                           HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                        end    
                     end
                  

                  elseif not Tweening and v:FindFirstChild("HumanoidRootPart") ~= nil and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and Alive() then  
                     DoTween(v.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                     if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                        DoTween(v.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                     end
                  end
               else wait(5)
               end
            until not v.Parent or v:FindFirstChild("Humanoid") == nil or v.Humanoid.Health <= 0 or v:FindFirstChild("HumanoidRootPart") == nil or not Alive() or getgenv().KillingBoss == false
         end
      end
   end
   RemoveFloat()
end)
AutoFarmBoss:addButton("Refresh Boss",function()
   AutoFarmBoss:updateDropdown(BossDropdown,"Refresh Boss",refreshBosses(),function()
   end)
end)
local AutoWeapon = MainPage:addSection("Auto Equip Weapon")

local WeaponDropdown = AutoWeapon:addDropdown("Select A Weapon",PLrWeapons,function(Value)
   Weapon = Value
end)
AutoWeapon:addButton("Refresh Weapon Dropdown",function()
   AutoWeapon:updateDropdown(WeaponDropdown,"Refresh Weapon",refreshWeapon1(),function()
   end)
end)
local AutoFarmEvent = MainPage:addSection("Auto Farm Event")
if SecondSea then
   AutoFarmEvent:addToggle("Auto Ectoplasm",getgenv().AutoEctoplasm,function(boolen)
      getgenv().AutoEctoplasm  = boolen
      if getgenv().AutoEctoplasm then
         TweenFloat()
         if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(923.21252441406, 125.05710601807, 32852.83203125)).magnitude < 3000 then

         else
            local args = {
               [1] = "requestEntrance",
               [2] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
            }

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))            wait(3)
         end
      else
         DisabledNoClip = false   
         RemoveFloat()
      end
      spawn(function()
         while getgenv().AutoEctoplasm and game:GetService("RunService").RenderStepped:wait(0.1) do
            Equip(Weapon)
            Click()
         end
      end)
      while getgenv().AutoEctoplasm and game:GetService("RunService").RenderStepped:wait() do
         DisabledNoClip = true

         --pcall(function()
            --if getgenv().AutoFarmSafeMode and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * getgenv().AutoFarmHealthSafeMode)/100 then DoTween(QuestCFrameMob,getgenv().TweenSpeedQuest) repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health >= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 50)/100 end
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
               if SecondSea then
                  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                     if (string.find(v.Name,1250) or string.find(v.Name,1275) or string.find(v.Name,1300) or string.find(v.Name,1325)) and not Tweening and not string.find(v.Name,"Boss") and getgenv().AutoEctoplasm then
                        DoMagnet = false
   
                        FastAttack()
                        Simulation()
                        if not Tweening then
                           if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and getgenv().AutoEctoplasm then
                              DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                           end
                           if Alive() and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                              BringCFrame = v.HumanoidRootPart.CFrame
                              BringPos = v.HumanoidRootPart.Position
                           end
                           if Alive() and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(923.21252441406, 125.05710601807, 32852.83203125)).magnitude < 3000 then

                           else
                              local args = {
                                 [1] = "requestEntrance",
                                 [2] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                              }
                  
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))                              wait(3)
                           end
                        end
                        OldY = v.HumanoidRootPart.Position.Y
                        OldCFrame = v.HumanoidRootPart.CFrame
                        repeat 
                           TweenFloat()

                           game:GetService("RunService").RenderStepped:wait()
                           --if getgenv().AutoFarmSafeMode and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * getgenv().AutoFarmHealthSafeMode)/100 then DoTween(QuestCFrameMob,getgenv().TweenSpeedQuest) repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health >= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 50)/100 end
   
                           if Alive() and getgenv().AutoEctoplasm then
                              if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(923.21252441406, 125.05710601807, 32852.83203125)).magnitude < 3000 then

                              else
                                 local args = {
                                    [1] = "requestEntrance",
                                    [2] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                                 }
                     
                                 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))                                 wait(3)
                              end
                              Simulation()
                              if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                 spawn(function()
                                    if not BringEctoplasm then
                                       BringEctoplasm = true
                                       BringMobEctoplasm()
                                       wait(0.2)
                                       BringEctoplasm = false
                                    end
                                 end)
                                 
   
                                    HitBoxPlr()
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(923.21252441406, 125.05710601807, 32852.83203125)).magnitude < 3000 then
                                       if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y > v.HumanoidRootPart.Position.y then
                                          if v.HumanoidRootPart.Position.Y - OldY >= 0 then
                                             spawn(function()
                                                wait(1)
                                                if getgenv().AutoEctoplasm and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                   if Alive() and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                      TweenFloat()
                                                      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                                   else
                                                      DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                                   end
                                                end
         
                                             end)
                                          else 
                                             Simulation() 
                                             v.HumanoidRootPart.CFrame = OldCFrame
                                             wait(1)
                                             DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                          end
                                       else
                                          randomnumber = math.random(1,3)
                                          if randomnumber == 1 and getgenv().AutoEctoplasm  then
                                             TweenFloat()
                                             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                                          elseif randomnumber ==2 and getgenv().AutoEctoplasm   then
                                             TweenFloat()
                                             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                                          elseif randomnumber ==3 and getgenv().AutoEctoplasm  then
                                             TweenFloat()
                                             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                                          end  
                                       end
                                    else
                                       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(923.21252441406, 125.05710601807, 32852.83203125)
                                       wait(3)
                                    end
                                 end
                              elseif not Tweening and v:FindFirstChild("HumanoidRootPart") ~= nil and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then  
                           --      if getgenv().AutoFarmSafeMode and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * getgenv().AutoFarmHealthSafeMode)/100 then DoTween(QuestCFrameMob,getgenv().TweenSpeedQuest) repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health >= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 50)/100 end
                                 BringCFrame = v.HumanoidRootPart.CFrame
                                 BringPos = v.HumanoidRootPart.Position
                                 DoTween(v.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                              end
                              DoMagnet = true
                           --end
                        until not v.Parent or v:FindFirstChild("Humanoid") == nil or v.Humanoid.Health <= 0 or v:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") == nil or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 or getgenv().AutoEctoplasm == false
                        RemoveFloat()
                     end
                  end
               end
            else wait(5)
            end
         --end)
      end
   end)
end

if ThirdSea then
   AutoFarmEvent:addToggle("Auto Farm Bone",getgenv().AutoFarmBone,function(boolen)
   
      getgenv().AutoFarmBone  = boolen
      if getgenv().AutoFarmBone then
         TweenFloat()
      else
         DisabledNoClip = false   
         RemoveFloat()
      end
      spawn(function()
         while getgenv().AutoFarmBone do
            wait()
            Equip(Weapon)
            Click()
         end
      end)
      while getgenv().AutoFarmBone do
         game:GetService("RunService").RenderStepped:wait()
         DisabledNoClip = true
         --pcall(function()
            --if getgenv().AutoFarmSafeMode and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * getgenv().AutoFarmHealthSafeMode)/100 then DoTween(QuestCFrameMob,getgenv().TweenSpeedQuest) repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health >= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 50)/100 end
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
               if ThirdSea then
                  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                     if (string.find(v.Name,2050) or string.find(v.Name,2025) or string.find(v.Name,2000) or string.find(v.Name,1975)) and not Tweening and not string.find(v.Name,"Boss") and getgenv().AutoFarmBone then
                        DoMagnet = false
   
                        FastAttack()
                        Simulation()
                        if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and getgenv().AutoFarmBone then
                           Tweening = true
                           DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                        end
                        Tweening = false
                        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                           BringCFrame = v.HumanoidRootPart.CFrame
                           BringPos = v.HumanoidRootPart.Position
                        end
                        OldY = v.HumanoidRootPart.Position.Y
                        OldCFrame = v.HumanoidRootPart.CFrame
                        repeat 
                           game:GetService("RunService").RenderStepped:wait()
                           TweenFloat()
                           --if getgenv().AutoFarmSafeMode and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * getgenv().AutoFarmHealthSafeMode)/100 then DoTween(QuestCFrameMob,getgenv().TweenSpeedQuest) repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health >= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 50)/100 end
   
                           if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and getgenv().AutoFarmBone then
   
                              Simulation()
                              if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                 spawn(function()
                                    if not BringBone then
                                    BringBone = true
                                    BringMobBone()
                                    wait(0.2)
                                    BringBone = false
                                    end
                                 end)
                                 
   
                                    HitBoxPlr()
                                    if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y > v.HumanoidRootPart.Position.y then
                                       if v.HumanoidRootPart.Position.Y - OldY >= 0 then
                                          spawn(function()
                                             wait(1)
                                             if getgenv().AutoFarmBone and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                   game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                                else
                                                   DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                                end
                                             end
      
                                          end)
                                       else 
                                          Simulation() 
                                          v.HumanoidRootPart.CFrame = OldCFrame
                                          wait(1)
                                          Tweening = true
                                          DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                          Tweeeing = false
                                       end
                                    else
                                        randomnumber = math.random(1,3)
                                       if randomnumber == 1 and getgenv().AutoFarmBone  then
                                          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                                       elseif randomnumber ==2 and getgenv().AutoFarmBone   then
                                          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                                       elseif randomnumber ==3 and getgenv().AutoFarmBone  then
                                          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                                       end  
                                    end
    
                                 end
                              elseif not Tweening and v:FindFirstChild("HumanoidRootPart") ~= nil and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then  
                           --      if getgenv().AutoFarmSafeMode and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * getgenv().AutoFarmHealthSafeMode)/100 then DoTween(QuestCFrameMob,getgenv().TweenSpeedQuest) repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health >= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 50)/100 end
                                 BringCFrame = v.HumanoidRootPart.CFrame
                                 BringPos = v.HumanoidRootPart.Position
                                 DoTween(v.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                              end
                              DoMagnet = true
                              Tweening = false
                           --end
                        until not v.Parent or v:FindFirstChild("Humanoid") == nil or v.Humanoid.Health <= 0 or v:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") == nil or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 or getgenv().AutoFarmBone == false
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                           if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityBody") then
                              game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityBody:Destroy()
                           end
                        end
                     end
                  end
               end
            else wait(5)
            end
         --end)
      end
   end)

   AutoFarmEvent:addToggle("Auto Elite Quest",getgenv().AutoElite,function(boolen)
      getgenv().AutoElite = boolen
      while getgenv().AutoElite do
         wait()
         for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Diablo")) or
            (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Urban")) or
            (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Deandre")) then
               DoTween(CFrame.new(-5418.51904, 312.803192, -2828.00854, -0.93788892, -1.12303145e-08, -0.346935779, -2.19377014e-08, 1, 2.69352807e-08, 0.346935779, 3.28732739e-08, -0.93788892),getgenv().TweenSpeedAutoFarm)
               wait(0.5)
               local args = {[1] = "EliteHunter"}
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               if v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and getgenv().AutoElite then
                  DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0),getgenv().TweenSpeedAutoFarm)
                  repeat wait()
                     Equip(Weapon)
                     game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                     HitBoxPlr()
                     v.HumanoidRootPart.Transparency = 1
                     v.HumanoidRootPart.CanCollide = false
                     spawn(function()
                        Click()
                     end)
                  until not v.Parent or v.Humanoid.Health <= 0 or getgenv().AutoElite == false
                  wait(10)
               end
            end
         end
      end
   end)
end
local AutoStoryQuest = MainPage:addSection("Auto Story Quest")
if FirstSea then
   AutoStoryQuest:addToggle("Auto Saber",getgenv().AutoSaber,function(boolen)
      getgenv().AutoSaber = boolen
      local PlrLevel = game.Players.localPlayer.Data.Level.Value

      while getgenv().AutoSaber do
         wait()
         if PlrLevel >= 200 then
            getgenv().AutoFarm = false
            getgenv().AutoFarmGunMastery = false
            getgenv().AutoFarmFruitMastery = false
            SaberProgress()
            if KilledShanks then return lib:Notify("Auto Saber","You Already Done Saber Quest") end
            ---1180.0397949219, 22.599720001221, 187.29235839844
            if Plates ~= 5 and getgenv().AutoSaber then
               NoClip = true
               Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
               local Plate1 = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button
               local Plate2 = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button
               local Plate3 = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button
               local Plate4 = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button
               local Plate5 = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button

               DoTween(Plate1.CFrame,getgenv().TweenSpeedTeleportPlace)
               wait(0.3)
               DoTween(Plate2.CFrame,getgenv().TweenSpeedTeleportPlace)
               wait(0.3)
               DoTween(Plate3.CFrame,getgenv().TweenSpeedTeleportPlace)
               wait(0.3)
               DoTween(Plate4.CFrame,getgenv().TweenSpeedTeleportPlace)
               wait(0.3)
               DoTween(Plate5.CFrame,getgenv().TweenSpeedTeleportPlace)
            end

            SaberProgress()
            if Plates == 5 and getgenv().AutoSaber and not UsedTorch then
               wait(0.3)
               if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Torch") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") then
               DoTween(CFrame.new(-1610.1174316406, 12.890041351318, 162.84405517578),getgenv().TweenSpeedTeleportPlace)
               end
               wait(0.3)
               DoTween(CFrame.new(1113.9545898438, 4.9214663505554, 4350.1416015625),getgenv().TweenSpeedTeleportPlace)
               Equip("Torch")
               wait(2)
               local args = {
                  [1] = "ProQuestProgress",
                  [2] = "DestroyTorch"
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            end
            SaberProgress()
            if not UsedCup and UsedTorch and getgenv().AutoSaber then
               if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Cup") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") then
                  DoTween(CFrame.new(1113.0310058594, 5.9840507507324, 4365.9165039063),getgenv().TweenSpeedTeleportPlace)
                  local args = {
                     [1] = "ProQuestProgress",
                     [2] = "GetCup"
                  }
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               
                  wait(0.3)
               end
            Equip("Cup")
            DoTween(CFrame.new(1395.6701660156, 37.347969055176, -1320.1994628906),getgenv().TweenSpeedTeleportPlace)
            wait(2)
            local args = {
               [1] = "ProQuestProgress",
               [2] = "FillCup",
               [3] = game:GetService("Players").LocalPlayer.Character.Cup
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait(0.2)
            DoTween(CFrame.new(1459.4638671875, 88.619407653809, -1389.8334960938),getgenv().TweenSpeedTeleportPlace)
            local args = {
               [1] = "ProQuestProgress",
               [2] = "SickMan"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      
            end
            SaberProgress()
            if not TalkedSon and UsedCup and  getgenv().AutoSaber and UsedTorch then
               DoTween(CFrame.new(-910.07012939453, 13.752033233643, 4077.490234375),getgenv().TweenSpeedTeleportPlace)

               local args = {
                  [1] = "ProQuestProgress",
                  [2] = "RichSon"
               }

               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            SaberProgress()
            -- Mising part above below is fisnished part
            if TalkedSon and not KilledMob and getgenv().AutoSaber and UsedTorch and UsedCup then
               if game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                  local MobLeader = game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]")
                  DoTween(MobLeader.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
   
                  repeat wait(.1)
                     if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                        Equip(Weapon)
                     end
                     spawn(function()
                        Click()
                     end)
                     pcall(function()
                        HitBoxPlr()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = MobLeader.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                        MobLeader.HumanoidRootPart.Transparency = 0.5
                        MobLeader.HumanoidRootPart.BrickColor = BrickColor.new("White")
                        MobLeader.HumanoidRootPart.CanCollide = false
                     end)
                  until  not MobLeader.Parent or MobLeader.Humanoid.Health <= 0 or getgenv().AutoSaber == false
               end
            end
            SaberProgress()
            if not UsedRelic and getgenv().AutoSaber and UsedTorch and UsedCup and KilledMob then
               DoTween(CFrame.new(-910.07012939453, 13.752033233643, 4077.490234375),getgenv().TweenSpeedTeleportPlace)

               local args = {
                  [1] = "ProQuestProgress",
                  [2] = "RichSon"
               }

               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               DoTween(CFrame.new(-1405.31445, 29.8519974, 4.34172916, 0.870163321, 2.4032718e-09, 0.49276346, 5.68156899e-09, 1, -1.49101247e-08, -0.49276346, 1.57739137e-08, 0.870163321),getgenv().TweenSpeedTeleportPlace)
               Equip("Relic")
               local SaberDoor = game:GetService("Workspace").Map.Jungle.Final.Invis
               SaberDoor.CanCollide = false
               SaberDoor.Size = Vector3.new(20,20,20)
         
               local args = {
                  [1] = "ProQuestProgress",
                  [2] = "PlaceRelic"
               }
            
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            SaberProgress()
            if not KilledShanks and getgenv().AutoSaber and UsedRelic and UsedTorch and UsedCup and KilledMob  then
               if game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                  local Shank = game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]")
                  DoTween(Shank.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)

                  repeat wait(.1)
                     if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                        Equip(Weapon)
                     end
                     spawn(function()
                        Click()
                     end)
                     pcall(function()
                        HitBoxPlr()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Shank.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                        Shank.HumanoidRootPart.Transparency = 0.5
                        Shank.HumanoidRootPart.BrickColor = BrickColor.new("White")
                        Shank.HumanoidRootPart.CanCollide = false
                     end)
                  until  not Shank.Parent or Shank.Humanoid.Health <= 0 or getgenv().AutoSaber == false
               end
            end
            if Noclipping and NoClip then
               NoClip = false
               Noclipping:Disconnect()
           end
            --[[
               local args = {
    [1] = "ProQuestProgress"
}

for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
if typeof(v) == "Table"then
for i2,v2 in pairs(v) do
    print(i2,v2)
end
else
print(i,v)
end
end]]--
         end
      end
   end)
   AutoStoryQuest:addToggle("Auto Second Sea",getgenv().AutoSecondSea,function(boolen)
      local PlrLevel = game.Players.localPlayer.Data.Level.Value
      getgenv().AutoSecondSea = boolen
      while getgenv().AutoSecondSea do
         wait()
         if PlrLevel >= 700 then
            getgenv().AutoFarm = false
            getgenv().AutoFarmGunMastery = false
            getgenv().AutoFarmFruitMastery = false

            wait(0.5)

            SecondSeaProgress()
            if not UsedKey then
               DoTween(CFrame.new(4850.42383, 5.65139151, 718.804382, 0.195783511, 9.26219599e-08, -0.980647147, -7.3901596e-08, 1, 7.96955817e-08, 0.980647147, 5.68683127e-08, 0.195783511),getgenv().TweenSpeedTeleportPlace)
               local args = {
                  [1] = "DressrosaQuestProgress",
                  [2] = "Detective"
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               
               wait(0.5)
            
               Equip("Key")
               DoTween(CFrame.new(1347.7124, 37.3751602, -1325.6488),getgenv().TweenSpeedTeleportPlace)
            
               wait(0.5)

               if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                  local IceAdmiral = game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]")
                  DoTween(IceAdmiral.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)

                  repeat wait(.1)
                     if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                        Equip(Weapon)
                     end

                     spawn(function()
                        Click()
                     end)
                     pcall(function()
                        HitBoxPlr()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = IceAdmiral.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                        IceAdmiral.HumanoidRootPart.Transparency = 0.5
                        IceAdmiral.HumanoidRootPart.BrickColor = BrickColor.new("White")
                        IceAdmiral.HumanoidRootPart.CanCollide = false
                     end)
                  until  not IceAdmiral.Parent or IceAdmiral.Humanoid.Health <= 0 or getgenv().AutoSecondSea == false
               end
            end

            if KilledIceBoss and UsedKey and TalkedDetective then

               DoTween(CFrame.new(-1165.95776, 7.65220022, 1728.58057, 0.473572224, 2.10676721e-09, -0.880755007, 6.13469986e-09, 1, 5.6905618e-09, 0.880755007, -8.09805911e-09, 0.473572224),getgenv().TweenSpeedTeleportPlace)
               wait(0.5)
               if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1165.95776, 7.65220022, 1728.58057)).magnitude <30 then
                  local args = {
                     [1] = "TravelDressrosa"
                  }
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               end
            end
         end
      end
   end)
end
if SecondSea then
   AutoStoryQuest:addToggle("Auto Bartilo",getgenv().AutoBartilo,function(boolen)
      local PlrLevel = game.Players.localPlayer.Data.Level.Value

      getgenv().AutoBartilo = boolen
      if getgenv().AutoBartilo then
         TweenFloat()
      else DisabledNoClip = false
         RemoveFloat()
      end
      spawn(function()
         while getgenv().AutoBartilo and wait() do
            Equip(Weapon)
            Click()
         end
      end)
      while getgenv().AutoBartilo do
         wait()
         if PlrLevel >= 800 then
            local args = {
               [1] = "getInventoryWeapons"
            }
            for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
               for i2,v2 in pairs(v) do
                  if v2 == "Warrior Helmet" then
                     return lib:Notify("Bartilo Quest","You already completed")
                  end
               end
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Warrior Helmet") ~= nil or game.Players.LocalPlayer.Character:FindFirstChild("Warrior Helmet") ~= nil then
               return lib:Notify("Bartilo Quest","You already completed")
            end
            getgenv().AutoFarm = false
            getgenv().AutoFarmGunMastery = false
            getgenv().AutoFarmFruitMastery = false
            BartiloProgress()
            if not KilledBandits and not KilledSpring then
               if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
                  DoTween(CFrame.new(-461.533203, 72.3478546, 300.311096),getgenv().TweenSpeedQuest)
                  wait(0.1)
                  
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                  wait(1)
               end
               for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                  if string.find(v.Name,"Swan Pirate") and string.find(v.Name,"775") then
                     SpecialMob = "Swan Pirate"
                     if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                        DoTween(v.HumanoidRootPart.CFrame*CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                        OldY = v.HumanoidRootPart.Position.Y
                        OldCFrame = v.HumanoidRootPart.CFrame
                        if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and getgenv().AutoFarm then
                           DisabledNoClip = true
                           DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                           DisabledNoClip = false
                        end
                        DoMagnet = false
                        Simulation()
                        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                           BringCFrame = v.HumanoidRootPart.CFrame
                           BringPos = v.HumanoidRootPart.Position
                        end
                        SecondPassed = 0
                        spawn(function()
                           while wait(1) do
                              SecondPassed = SecondPassed + 1
                              if SecondPassed == 20 then
                                 if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 then
                                    pcall(function()
                                       v:FindFirstChild("LowerTorso"):Destroy()
                                       v:FindFirstChild("UpperTorso"):Destroy()
                                       v:FindFirstChild("Head"):Destroy()
                                       v:breakJoints()
                                       v.Humanoid.Health = 0
                                       v.Humanoid.Health =  v.Humanoid.MaxHealth
                                       v.Humanoid.Health = 0
                                    end)
                                 else break;
                                 end
                              end
                           end
                        end)
                        repeat wait()

                           HitBoxPlr()

                           spawn(function()
                              if not BringFarmBartilo then
                                 BringFarmBartilo = true
                                 BringMob()
                                 wait(0.2)
                                 BringFarmBartilo = false
                              end
                           end)
                           FastAttack()
                           TweenFloat()
                           game:GetService("RunService").RenderStepped:wait()
                           DisabledNoClip = true
                           --if getgenv().AutoFarmSafeMode and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * getgenv().AutoFarmHealthSafeMode)/100 then DoTween(QuestCFrameMob,getgenv().TweenSpeedQuest) repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health >= (game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 50)/100 end
   
                           if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0  then
                              Simulation()
   
                              if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                 FastAttack()
                                 
                                 spawn(function()
                                    if not BringFarm then
                                       BringFarm = true
                                       BringMob()
                                       wait(0.2)
                                       BringFarm = false
                                    end
                                 end)
                                    wait()
                                    HitBoxPlr()
                                -- v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                 pcall(function()
                                    if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y > v.HumanoidRootPart.Position.y then
                                       if v.HumanoidRootPart.Position.Y - OldY >= 0 then
                                          spawn(function()
                                             wait(1)
                                             if getgenv().AutoFarm and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                   game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                                else
                                                   DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                                end
                                             end
      
                                          end)
                                       else 
                                          Simulation() 
                                          v.HumanoidRootPart.CFrame = OldCFrame
                                          wait(1)
                                          Tweening = true
                                          DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                          Tweeeing = false
                                       end
                                    else
                                       randomnumber = math.random(1,3)
                                       if randomnumber == 1 and getgenv().AutoFarm  then
                                          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                                       elseif randomnumber ==2 and getgenv().AutoFarm   then
                                          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                                       elseif randomnumber ==3 and getgenv().AutoFarm  then
                                          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                                       end    
                                    end
                                 end)
   
                              elseif not Tweening and v:FindFirstChild("HumanoidRootPart") ~= nil and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then  
                                 BringCFrame = v.HumanoidRootPart.CFrame
                                 BringPos = v.HumanoidRootPart.Position
                                 DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                 if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                    DoTween(v.HumanoidRootPart.CFrame* CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                 end
                              end
   
                              DoMagnet = true
                              Tweening = false
                           end
                        until not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or getgenv().AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false 
                     end
                  end
               end
            end
            BartiloProgress()
            if not KilledSpring and KilledBandits then
               DoTween(CFrame.new(-461.533203, 72.3478546, 300.311096),getgenv().TweenSpeedQuest)
               wait(0.1)
               
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
               wait(1)
               if game.Workspace.Enemies:WaitForChild("Jeremy [Lv. 850] [Boss]") then
                  Jeremy =  game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]")
                  DoTween(Jeremy.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
                  repeat wait()
                     if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                        Equip(Weapon)
                     end
                     spawn(function()
                        Click()
                     end)
                     pcall(function()
                        HitBoxPlr()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Jeremy.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                        Jeremy.HumanoidRootPart.Transparency = 0.5
                        Jeremy.HumanoidRootPart.BrickColor = BrickColor.new("White")
                        Jeremy.HumanoidRootPart.CanCollide = false
                     end)
                  until  not Jeremy.Parent or Jeremy.Humanoid.Health <= 0 or getgenv().AutoBartilo == false
               end
            end
            BartiloProgress()
            if not DidPlates and KilledSpring and KilledBandits then
               local Plate1 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1
               local Plate2 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2
               local Plate3 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3
               local Plate4 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4
               local Plate5 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5
               local Plate6 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6
               local Plate7 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7
               local Plate8 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8
               DoTween(CFrame.new(-1837.6804199219, 11.032466888428, 1667.9600830078),getgenv().TweenSpeedTeleportPlace)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plate1.CFrame

               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate1, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate1, 1)
               wait(0.2)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plate2.CFrame
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate2, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate2, 1)
               wait(0.2)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plate3.CFrame

               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate3, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate3, 1)
               wait(0.2)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plate4.CFrame

               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate4, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate4, 1)
               wait(0.2)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plate5.CFrame

               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate5, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate5, 1)
               wait(0.2)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plate6.CFrame

               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate6, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate6, 1)
               wait(0.2)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plate7.CFrame

               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate7, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate7, 1)
               wait(0.2)
               DoTween(Plate8.CFrame,getgenv().TweenSpeedTeleportPlace)

               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate8, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate8, 1)
            end
         end
      end
   end)
   AutoStoryQuest:addToggle("Auto Third Sea",getgenv().AutoThirdSea,function(boolen)
      getgenv().AutoThirdSea = boolen
      while getgenv().AutoThirdSea do
         wait()
         if PlrLevel >= 1500 then
            BartiloProgress()
            if DidPlates and KilledBandits and KilledSpring then
               getgenv().AutoFarm = false
               getgenv().AutoFarmGunMastery = false
               getgenv().AutoFarmFruitMastery = false
            end
         end
      end
   end)
end

if ThirdSea then
   AutoStoryQuest:addToggle("Auto Citizen Quest",getgenv().AutoCitizenQuest,function(boolen)
      getgenv().AutoCitizenQuest = boolen
      spawn(function()
         while getgenv().AutoCitizenQuest do
            wait()
            Click()
         end
      end)
      while getgenv().AutoCitizenQuest do
         wait()
         local args = {
            [1] = "CitizenQuestProgress",
            [2] = "Citizen"
        }
        
        
         if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 3 then
            return lib:Notify("Auto Citizen Quest","Your Quest Is Already Completed")
         end
         if PlrLevel >= 1850 then
            getgenv().AutoFarm = false
            getgenv().AutoFarmBone = false
            getgenv().AutoFarmGunMastery = false
            getgenv().AutoFarmFruitMastery = false
            CitizenQuestProgress()
            if not KilledBandits and not KilledCaptainElephantCitizen and not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Forest Pirate") then
            DoTween(CFrame.new(-12445.064453125, 332.37817382812, -7672.3803710938),getgenv().TweenSpeedTeleportPlace)
            end
            
         if not KilledBanditsCitizen and not KilledCaptainElephantCitizen and getgenv().AutoCitizenQuest then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and getgenv().AutoFarm and  game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Forest Pirate") and CanTween then
               local args = {
               [1] = "StartQuest",
               [2] = "CitizenQuest",
               [3] = 1
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
               if string.find(v.Name,1825) and not Tweening and not string.find(v.Name,"Boss") and getgenv().AutoCitizenQuest then
                  -- Check
                     SpecialMob = 1825
                     OldY = v.HumanoidRootPart.Position.Y
                     OldCFrame = v.HumanoidRootPart.CFrame
                  

                  DoMagnet = false
                  Simulation()

                  FastAttack()
            
                  if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and getgenv().AutoCitizenQuest then
                     Tweening = true
                     DisabledNoClip = true
                     DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                     DisabledNoClip = false
                     Tweening = false
                  end
                  Tweening = false

                  if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                     BringCFrame = v.HumanoidRootPart.CFrame
                     BringPos = v.HumanoidRootPart.Position
                  end
                  SecondPassed = 0
                  spawn(function()
                     while wait(1) do
                        SecondPassed = SecondPassed + 1
                        if SecondPassed == 20 then
                           if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 then
                              pcall(function()
                                 v:FindFirstChild("LowerTorso"):Destroy()
                                 v:FindFirstChild("UpperTorso"):Destroy()
                                 v:FindFirstChild("Head"):Destroy()
                                 v:breakJoints()
                                 v.Humanoid.Health = 0
                                 v.Humanoid.Health =  v.Humanoid.MaxHealth
                                 v.Humanoid.Health = 0
                              end)
                           else break;
                           end
                        end
                     end
                  end)
                  repeat 
                     TweenFloat()
                     game:GetService("RunService").RenderStepped:wait()
                     DisabledNoClip = true

                     if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0  then
                        Simulation()

                        if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                           FastAttack()
                           

                           spawn(function()
                              if not BringFarmCitizen then
                                 BringFarmCitizen = true
                                 BringMob()
                                 --wait(0.2)
                                 BringFarmCitizen = false
                              end
                           end)
                              wait()
                              HitBoxPlr()
                          -- v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                          if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y >= v.HumanoidRootPart.Position.y then
                              if v.HumanoidRootPart.Position.Y - OldY >= 0 then
                                 spawn(function()
                                    wait()
                                    if getgenv().AutoCitizenQuest and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil then
                                       if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then

                                          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                       else
                                          DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                       end
                                    end

                                 end)
                              else 
                                 Simulation() 
                                 v.HumanoidRootPart.CFrame = OldCFrame
                                 wait()
                                 Tweening = true
                                 DoTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0),getgenv().TweenSpeedAutoFarm)
                                 Tweeeing = false
                              end
                           else
                              randomnumber = math.random(1,3)
                              if randomnumber == 1 and getgenv().AutoCitizenQuest  then
                                 game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                              elseif randomnumber ==2 and getgenv().AutoCitizenQuest   then
                                 game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                              elseif randomnumber ==3 and getgenv().AutoCitizenQuest  then
                                 game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                              end    
                           end
                        

                        elseif not Tweening and v:FindFirstChild("HumanoidRootPart") ~= nil and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then  
                           BringCFrame = v.HumanoidRootPart.CFrame
                           BringPos = v.HumanoidRootPart.Position
                           DoTween(v.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                           if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                              DoTween(v.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                           end
                        end

                        DoMagnet = true
                        Tweening = false
                     end
                  until not v.Parent or v:FindFirstChild("Humanoid") == nil or v.Humanoid.Health <= 0 or v:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") == nil or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 or getgenv().AutoCitizenQuest == false
                  SecondPassed = 0
                  DisabledNoClip = false
                  CitizenQuestProgress()
               end
            end
         elseif not KilledCaptainElephantCitizen and getgenv().AutoCitizenQuest then
            if game.Workspace.Enemies:WaitForChild("Captain Elephant [Lv. 1875] [Boss]") then
               CaptainElephant =  game.Workspace.Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]")
               DoTween(CaptainElephant.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
               repeat wait()
                  if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                     Equip(Weapon)
                  end
                  spawn(function()
                     Click()
                  end)
                  pcall(function()
                     HitBoxPlr()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CaptainElephant.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                     CaptainElephant.HumanoidRootPart.Transparency = 0.5
                     CaptainElephant.HumanoidRootPart.BrickColor = BrickColor.new("White")
                     CaptainElephant.HumanoidRootPart.CanCollide = false
                  end)
               until  not CaptainElephant.Parent or CaptainElephant.Humanoid.Health <= 0 or getgenv().AutoCitizenQuest == false
            end
            CitizenQuestProgress()
         elseif KilledCaptainElephantCitizen and getgenv().AutoCitizenQuest then
            
            DoTween(CFrame.new(-12508.901367188, 336.42013549805, -9867.9560546875),getgenv().TweenSpeedTeleportPlace)
            CitizenQuestProgress()

         end
         end
      end
   end)
   AutoStoryQuest:addToggle("Auto Fruit Bowl",getgenv().AutoObservationv2,function(boolen)
      getgenv().AutoObservationv2 = boolen
      local PlrLevel = game.Players.localPlayer.Data.Level.Value

      while getgenv().AutoObservationv2 do
         wait()
         if PlrLevel >= 1750 then
            local args = {
               [1] = "CitizenQuestProgress",
               [2] = "Citizen"
           }
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 3 then
               if game.Players.LocalPlayer.Character:FindFirstChild("Fruit Bowl") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") then
                  return lib:Notify("Auto Fruit Bowl","You Already Have Bowl")
               end
               getgenv().AutoFarm = false
               getgenv().AutoFarmBone = false
               getgenv().AutoFarmGunMastery = false
               getgenv().AutoFarmFruitMastery = false
               repeat wait()
                  CheckFruitObservationv2()
                  if not FindApple and not DoingTweenObservationV2 then
                  local Apple = game:GetService("Workspace").AppleSpawner:FindFirstChild("Apple")
                  DoingTweenObservationV2 = true
                  if Apple then
                  DoTween(Apple.Handle.CFrame,getgenv().TweenSpeedTeleportPlace)
                  end
                  DoingTweenObservationV2 = false
                  end
                  if not FindBanana and not DoingTweenObservationV2  then
                  local Banana = game:GetService("Workspace").BananaSpawner:FindFirstChild("Banana")
                  DoingTweenObservationV2 = true
                  if Banana then
                  DoTween(Banana.Handle.CFrame,getgenv().TweenSpeedTeleportPlace)
                  end
                  DoingTweenObservationV2 = false
                  end
                  if not FindPineapple and not DoingTweenObservationV2  then
                  local Pineapple = game:GetService("Workspace").PineappleSpawner:FindFirstChild("Pineapple")
                  DoingTweenObservationV2 = true
                  if Pineapple then
                  DoTween(Pineapple.Handle.CFrame,getgenv().TweenSpeedTeleportPlace)
                  end
                  DoingTweenObservationV2 = false
                  end
               until (FindApple and FindBanana and FindPineapple) or not getgenv().AutoObservationv2
               CheckFruitObservationv2()

               if FindApple and FindBanana and FindBanana and getgenv().AutoObservationv2 then
               DoTween(CFrame.new(-12445.064453125, 332.37817382812, -7672.3803710938),getgenv().TweenSpeedTeleportPlace)
               local args = {
                  [1] = "CitizenQuestProgress",
                  [2] = "Citizen"
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               end

            else
               return lib:Notify("Auto Fruit Bowl","You Need To Complete Citizen Quest")
            end


         end
      end
   end)
   AutoStoryQuest:addToggle("Auto Rainbow Haki",getgenv().AutoRainbowHaki,function(boolen)
      getgenv().AutoRainbowHaki = boolen
      local PlrLevel = game.Players.localPlayer.Data.Level.Value

      while getgenv().AutoRainbowHaki do
         wait()
         --if PlrLevel >= 2000 then
            getgenv().AutoFarm = false
            getgenv().AutoFarmBone = false
            getgenv().AutoFarmGunMastery = false
            getgenv().AutoFarmFruitMastery = false
            local  args1 = {
               [1] = "HornedMan"
            }
         
            if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1)),"Stone") then
               DoTween(CFrame.new(-11888.973632812, 930.55096435547, -8759.3916015625),getgenv().TweenSpeedTeleportPlace)
               local StoneBoss = game:GetService("Workspace").Enemies:WaitForChild("Stone [Lv. 1550] [Boss]")
               local args = {
                  [1] = "HornedMan",
                  [2] = "Bet"
               }

               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               DoTween(StoneBoss.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
               repeat wait()
                  if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                     Equip(Weapon)
                  end
                  spawn(function()
                     Click()
                  end)
                  pcall(function()
                     HitBoxPlr()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = StoneBoss.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                     StoneBoss.HumanoidRootPart.Transparency = 0.5
                     StoneBoss.HumanoidRootPart.BrickColor = BrickColor.new("White")
                     StoneBoss.HumanoidRootPart.CanCollide = false
                  end)
               until  not StoneBoss.Parent or StoneBoss.Humanoid.Health <= 0 or getgenv().AutoRainbowHaki == false    
            elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1)),"Island Empress") then
               DoTween(CFrame.new(-11888.973632812, 930.55096435547, -8759.3916015625),getgenv().TweenSpeedTeleportPlace)
               local IslandEmpress = game:GetService("Workspace").Enemies:WaitForChild("Island Empress [Lv. 1675] [Boss]") 
               local args = {
                  [1] = "HornedMan",
                  [2] = "Bet"
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               DoTween(IslandEmpress.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
               repeat wait()
                  if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                     Equip(Weapon)
                  end
                  spawn(function()
                     Click()
                  end)
                  pcall(function()
                     HitBoxPlr()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = IslandEmpress.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                     IslandEmpress.HumanoidRootPart.Transparency = 0.5
                     IslandEmpress.HumanoidRootPart.BrickColor = BrickColor.new("White")
                     IslandEmpress.HumanoidRootPart.CanCollide = false
                  end)
               until  not IslandEmpress.Parent or IslandEmpress.Humanoid.Health <= 0 or getgenv().AutoRainbowHaki == false
                     
            elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1)),"Kilo Admiral") then
               DoTween(CFrame.new(-11888.973632812, 930.55096435547, -8759.3916015625),getgenv().TweenSpeedTeleportPlace)
               local KiloAdmiral = game:GetService("Workspace").Enemies:WaitForChild("Kilo Admiral [Lv. 1750] [Boss]") 
               local args = {
                  [1] = "HornedMan",
                  [2] = "Bet"
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               DoTween(KiloAdmiral.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
               repeat wait()
                  if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                     Equip(Weapon)
                  end
                  spawn(function()
                     Click()
                  end)
                  pcall(function()
                     HitBoxPlr()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = KiloAdmiral.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                     KiloAdmiral.HumanoidRootPart.Transparency = 0.5
                     KiloAdmiral.HumanoidRootPart.BrickColor = BrickColor.new("White")
                     KiloAdmiral.HumanoidRootPart.CanCollide = false
                  end)
               until  not KiloAdmiral.Parent or KiloAdmiral.Humanoid.Health <= 0 or getgenv().AutoRainbowHaki == false
            elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1)),"Captain Elephants") then
               DoTween(CFrame.new(-11888.973632812, 930.55096435547, -8759.3916015625),getgenv().TweenSpeedTeleportPlace)
               local CaptainElephant = game:GetService("Workspace").Enemies:WaitForChild("Captain Elephant [Lv. 1875] [Boss]")
               local args = {
                  [1] = "HornedMan",
                  [2] = "Bet"
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               DoTween(CaptainElephant.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
               repeat wait()
                  if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                     Equip(Weapon)
                  end
                  spawn(function()
                     Click()
                  end)
                  pcall(function()
                     HitBoxPlr()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CaptainElephant.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                     CaptainElephant.HumanoidRootPart.Transparency = 0.5
                     CaptainElephant.HumanoidRootPart.BrickColor = BrickColor.new("White")
                     CaptainElephant.HumanoidRootPart.CanCollide = false
                  end)
               until  not CaptainElephant.Parent or CaptainElephant.Humanoid.Health <= 0 or getgenv().AutoRainbowHaki == false
               
            elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1)),"Beautiful Pirate") then
               DoTween(CFrame.new(-11888.973632812, 930.55096435547, -8759.3916015625),getgenv().TweenSpeedTeleportPlace)
               local BeautifulPirate = game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]")
               local args = {
                  [1] = "HornedMan",
                  [2] = "Bet"
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               DoTween(BeautifulPirate.HumanoidRootPart.CFrame*CFrame.new(0, 20, 10),getgenv().TweenSpeedAutoFarm)
               repeat wait()
                  if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) == nil then
                     Equip(Weapon)
                  end
                  spawn(function()
                     Click()
                  end)
                  pcall(function()
                     HitBoxPlr()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = BeautifulPirate.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                     BeautifulPirate.HumanoidRootPart.Transparency = 0.5
                     BeautifulPirate.HumanoidRootPart.BrickColor = BrickColor.new("White")
                     BeautifulPirate.HumanoidRootPart.CanCollide = false
                  end)
               until  not BeautifulPirate.Parent or BeautifulPirate.Humanoid.Health <= 0 or getgenv().AutoRainbowHaki == false
            elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1)),"1") then
               return lib:Notify("Auto Rainbow Haki","You Have Already Done The Quest")
            end
         --end
      end
   end)
end

local AutoStuffs = MainPage:addSection("Auto Other Stuffs")
AutoStuffs:addToggle("Auto Chest",false,function(boolen)
   getgenv().AutoChest = boolen
   while getgenv().AutoChest and wait() do
      local chests = {}
      for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
         if string.find(v.Name, "Chest") ~= nil then
            table.insert(chests, v)
         end
      end
      local close = FindNearest(chests)
      if close ~= nil then
         ChestCFrame = CFrame.new(close.CFrame.X,close.CFrame.Y,close.CFrame.Z)
         if not moving then
         DoTween(ChestCFrame*CFrame.new(5,0,5),getgenv().TweenSpeedAutoChest)
         end
         wait(0.1)
         
         DoTween(ChestCFrame*CFrame.new(1,0,1),getgenv().TweenSpeedAutoChest)
         
         
         repeat wait() moving = true game.Players.LocalPlayer.Character.Humanoid:MoveTo(close.Position) until close == nil or close.Parent == nil or getgenv().AutoChest == false
         moving = false
      end
   end
end)
if ThirdSea then
   AutoStuffs:addButton("Auto Do Haki Color Puzzle",function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
      wait(0.5)
      DoTween(CFrame.new(-5420.16602, 1084.9657, -2666.8208),getgenv().TweenSpeedTeleportPlace)
      wait(0.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
      wait(0.5)
      DoTween(CFrame.new(-5414.41357, 309.865753, -2212.4577),getgenv().TweenSpeedTeleportPlace)
      wait(0.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
      wait(0.5)
      DoTween(CFrame.new(-4971.47559, 335.565765, -3720.02954),getgenv().TweenSpeedTeleportPlace)
   end)
end
local Fruits = MainPage:addSection("Fruits")
Fruits:addButton("Buy Random Fruit",function()
   local args = {[1] = "Cousin", [2] = "Buy"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Fruits:addToggle("Auto Buy Random Fruit",getgenv().AutoBuyRandomFruit,function(boolen)
   getgenv().AutoBuyRandomFruit = boolen
   while getgenv().AutoBuyRandomFruit and wait() do
      local args = {[1] = "Cousin", [2] = "Buy"}
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   end
end)
Fruits:addToggle("Get Fruit",false,function(boolen) 
   getgenv().GetFruits = boolen
   if getgenv().GetFruits == false then return end 
   while getgenv().GetFruits and wait(0.1) do 
      for i,v in pairs(game.Workspace:GetChildren()) do
         if v:IsA("Tool") then
            if (v.Handle.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 800 then
               if getgenv().BringFruit then
                  v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
               end
            else
               if getgenv().TeleportFruit then
                  if v:FindFirstChild("Handle") then
                     DoTween(v.Handle.CFrame,getgenv().TweenSpeedTeleportPlace)
                  end
               end
            end
         end
         if v.Name == "Fruit" and getgenv().NaturalFruit then
            if v:FindFirstChild("Handle") then
               DoTween(v:FindFirstChild("Handle").CFrame,getgenv().TweenSpeedTeleportPlace)
            end
         end
      end
   end
end)
Fruits:addToggle("Get Fruit:Natural Fruit",getgenv().NaturalFruit,function(boolen)
   getgenv().NaturalFruit = boolen
end)
Fruits:addToggle("Get Fruit:Bring",getgenv().BringFruit,function(boolen)
   getgenv().BringFruit = boolen
end)
Fruits:addToggle("Get Fruit:Teleport",getgenv().TeleportFruit,function(boolen)
   getgenv().TeleportFruit = boolen
end)
local Stats = lib:addPage("Stats")
local StatsPlr = Stats:addSection("Stats Player")
local Melee = StatsPlr:addToggle("Auto Add Point Melee",false,function(boolen)
   MeleeStat = boolen
   while MeleeStat do
      wait()
      if game.Players.localPlayer.Data.Points.Value >= MeleePoint then
         local args = {
            [1] = "AddPoint",
            [2] = "Melee",
            [3] = MeleePoint
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)
local MeleeSlider = StatsPlr:addSlider("Point Melee",1,1,20,function(Value)
   MeleePoint = Value
end)

local Defense = StatsPlr:addToggle("Auto Add Point Defense",false,function(boolen)
   DefenseStat = boolen
   while DefenseStat do
      wait()
      if game.Players.localPlayer.Data.Points.Value >= DefensePoint then
         local args = {
            [1] = "AddPoint",
            [2] = "Defense",
            [3] = DefensePoint
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)
local DefenseSlider = StatsPlr:addSlider("Point Defense",1,1,20,function(Value)
   DefensePoint = Value
end)

local Sword = StatsPlr:addToggle("Auto Add Point Sword",false,function(boolen)
   SwordStat = boolen
   while SwordStat do
      wait()
      if game.Players.localPlayer.Data.Points.Value >= SwordPoint then
         local args = {
            [1] = "AddPoint",
            [2] = "Sword",
            [3] = SwordPoint
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)
local SwordSlider = StatsPlr:addSlider("Point Sword",1,1,20,function(Value)
   SwordPoint = Value
end)
local DevilFruit = StatsPlr:addToggle("Auto Add Point DevilFruit",false,function(boolen)
   DevilFruitStat = boolen
   while DevilFruitStat do

      wait()
      if game.Players.localPlayer.Data.Points.Value >= DevilFruitPoint then
         local args = {
            [1] = "AddPoint",
            [2] = "DevilFruit",
            [3] = DevilFruitPoint
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)
local DevilFruitSlider = StatsPlr:addSlider("Point DevilFruit",1,1,20,function(Value)
   DevilFruitPoint = Value
end)
local Gun = StatsPlr:addToggle("Auto Add Point Gun",false,function(boolen)
   GunStat = boolen
   while GunStat do
      wait()
      if game.Players.localPlayer.Data.Points.Value >= GunPoint then
         local args = {
            [1] = "AddPoint",
            [2] = "Gun",
            [3] = GunPoint
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)
local GunSlider = StatsPlr:addSlider("Point Gun",1,1,20,function(Value)
   GunPoint = Value
end)
local StatsPlr2 = Stats:addSection("Check Stats")

StatsPlr2:addButton("Check Ectoplasm",function()
   lib:Notify("You Have:",game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Check").."-Ectoplasm")
end)

StatsPlr2:addButton("Check Kills Elite Hunter",function()
   lib:Notify("You Have:",game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress").."-Kills")
end)

StatsPlr2:addButton("Check KenHaki", function() 
   lib:Notify("You Have:",game:GetService("Players")["LocalPlayer"].VisionRadius.Value.."-Exp")
end)
local Teleport = lib:addPage("Teleport")

local TeleportSection = Teleport:addSection("TeleportSection")
TeleportSection:addKeybind("Stop Tweening", Enum.KeyCode.P, function()
   local info = TweenInfo.new(0,Enum.EasingStyle.Linear)
   local tween =  game:service"TweenService":Create(HumanoidRootPart, info, {CFrame = HumanoidRootPart.CFrame})
   HumanoidRootPart.Anchored = true
   tween:Play()
   tween:Cancel()
   HumanoidRootPart.Anchored = false
end)
local Imput = game:GetService("UserInputService")
TeleportSection:addToggle("Ctrl + Click = Teleport",getgenv().CtrlTp, function(boolen)
   getgenv().CtrlTp = boolen
   Imput.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 and Imput:IsKeyDown(Enum.KeyCode.LeftControl) and getgenv().CtrlTp then
         Char:MoveTo(Mouse.Hit.p)
      end
   end)
end)
getgenv().CtrlTween = false
TeleportSection:addToggle("Ctrl + Click = Tween",getgenv().CtrlTween, function(boolen)
   getgenv().CtrlTween = boolen
   Imput.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 and Imput:IsKeyDown(Enum.KeyCode.LeftControl) and getgenv().CtrlTween then
         DoTween(CFrame.new(Mouse.Hit.p),getgenv().TweenSpeedTeleportPlace)
      end
   end)
end)
local TeleportSection2 = Teleport:addSection("Place")
if SecondSea then
   

	TeleportSection2:addButton("First Spot", function()
		DoTween(CFrame.new(-11.845784187317, 29.276727676392, 2768.9770507812),getgenv().TweenSpeedTeleportPlace)
	end)
	TeleportSection2:addButton("Cafe", function()
		DoTween(CFrame.new(-384.03524780273, 73.020072937012, 353.2282409668),getgenv().TweenSpeedTeleportPlace)
	end)
	TeleportSection2:addButton("Swan Mansion", function()
		DoTween(CFrame.new(-390.096313, 331.886475, 673.464966),getgenv().TweenSpeedTeleportPlace)
	end)
	TeleportSection2:addButton("Swan Room", function()
		DoTween(CFrame.new(2302.19019, 15.1778421, 663.811035),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Factory", function()
		DoTween(CFrame.new(430.42569, 210.019623, -432.504791),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Colosseum", function()
		DoTween(CFrame.new(-1836.58191, 44.5890656, 1360.30652),getgenv().TweenSpeedTeleportPlace)
	end)
   
	TeleportSection2:addButton("Dark Arena", function()
		DoTween(game.Workspace["_WorldOrigin"].Locations["Dark Arena"].CFrame,getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Green bit", function()
		DoTween(CFrame.new(-2304.93359375, 72.966117858887, -2782.6965332031),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Graveyard Island", function()
		DoTween(CFrame.new(-5377.3295898438, 8.9691047668457, -708.45489501953),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Snow Mountain", function()
		DoTween(CFrame.new(554.47235107422, 401.42199707031, -5364.732421875),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Hot And Cold Island", function()
		DoTween(CFrame.new(-5944.7875976562, 15.951756477356, -5114.8725585938),getgenv().TweenSpeedTeleportPlace)
	end)


   TeleportSection2:addButton("Cursed Ship Gate", function()
		DoTween(CFrame.new(-6509.4169921875, 83.187019348145, -137.396774291998),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Cursed Ship", function()
		DoTween(CFrame.new(902.059143, 124.752518, 33071.8125),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Cursed Ship(Insta TP)", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(923.21252441406, 125.05710601807, 32852.83203125)

	end)
	TeleportSection2:addButton("Ice Castle", function()
		DoTween(CFrame.new(5662.44140625, 28.191165924072, -5982.9755859375),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Forgotten Island", function()
		DoTween(CFrame.new(-3043.31543, 238.881271, -10191.5791),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Usoap Island", function()
		DoTween(CFrame.new(4778.2431640625, 8.2086620330811, 2871.4936523438),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Minisky Island", function()
		DoTween(CFrame.new(-260.358917, 49325.7031, -35259.3008),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Indra Island", function()
		DoTween(CFrame.new(-27007.9363, 9.033, 466.6544),getgenv().TweenSpeedTeleportPlace)
	end)

elseif FirstSea then

	TeleportSection2:addButton("Pirate Start Island", function()
		DoTween(CFrame.new(781.37255859375, 5.7767753601074, 1437.2399902344),getgenv().TweenSpeedTeleportPlace)
	end)
	TeleportSection2:addButton("Marine Start Island", function()
		DoTween(CFrame.new(-2606.2143554688, 6.7695031166077, 2043.04553222667),getgenv().TweenSpeedTeleportPlace)
	end)
	TeleportSection2:addButton("Middle Town", function()
		DoTween(CFrame.new(-655.824158, 7.88708115, 1436.67908),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Jungle", function()
		DoTween(CFrame.new(-1334.1259765625, 11.852984428406, 502.03717041016),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Shank's Room", function()
		DoTween(CFrame.new(-1455.4440917969, 29.851997375488, -37.440139770508),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Pirate Village", function()
		DoTween(CFrame.new(-1187.3435058594, 4.7515587806702, 3809.2456054688),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Desert", function()
		DoTween(CFrame.new(1094.14587, 6.47350502, 4192.88721),getgenv().TweenSpeedTeleportPlace)
	end)
	TeleportSection2:addButton("Frozen Village", function()
		DoTween(CFrame.new(1112.4229736328, 7.3036189079285, -1159.3383789062),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Marine Fortress", function()
		DoTween(CFrame.new(-4817.0161132812, 20.651899337769, 4368.0639648438),getgenv().TweenSpeedTeleportPlace)
	end)

   TeleportSection2:addButton("Mob Leader Place", function()
		DoTween(CFrame.new(-2839.7548828125, 7.3262448310852, 5319.9428710938),getgenv().TweenSpeedTeleportPlace)
	end)
   
	TeleportSection2:addButton("Prison", function()
		DoTween(CFrame.new(4874.8125, 5.6519904136658, 735.57012939453),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Colosseum", function()
		DoTween(CFrame.new(-1423.5014648438, 7.2882599830627, -2798.2961425781),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Skylands", function()
		DoTween(CFrame.new(-4970.21875, 717.707275, -2622.35449),getgenv().TweenSpeedTeleportPlace)
	end)
	TeleportSection2:addButton("SkyArea1", function()
		DoTween(CFrame.new(-4731.9462890625, 845.27691650391, -1933.5628662109),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("SkyArea2", function()
		DoTween(CFrame.new(-7884.7309570312, 5545.509765625, -383.34613037109),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Sky Secret Temple", function()
		DoTween(CFrame.new(-8018.662109375, 5609.9936523438, -1979.3544921875),getgenv().TweenSpeedTeleportPlace)
	end)
   

	TeleportSection2:addButton("Magma Village", function()
		DoTween(CFrame.new(-5231.75879, 8.61593437, 8467.87695),getgenv().TweenSpeedTeleportPlace)
	end)
   
   TeleportSection2:addButton("UnderWater City Gate", function()
		DoTween(CFrame.new(3853.0385742188, 5.3731479644775, -1919.4447021484),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("UnderWater City", function()
		DoTween(CFrame.new(61092.36328125, 18.471633911133, 1711.1674804688),getgenv().TweenSpeedTeleportPlace)
	end)

	TeleportSection2:addButton("Fountain City", function()
		DoTween(CFrame.new(5053.0297851562, 1.5012743473053, 4054.8439941406),getgenv().TweenSpeedTeleportPlace)
	end)

elseif ThirdSea then

   TeleportSection2:addButton("Port Town", function()
      DoTween(CFrame.new(-447.46743774414, 6.7299399375916, 5306.3686523438),getgenv().TweenSpeedTeleportPlace)
	end)

   TeleportSection2:addButton("Hydra Island", function()
      DoTween(CFrame.new(5278.9213867188, 602.04351806641, 360.77795410156),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Secret Temple", function()
      DoTween(CFrame.new(5231.6831054688, 7.3780846595764, 1102.6005859375),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Great Tree", function()
      DoTween(CFrame.new(2253.0600585938, 24.144220352173, -6405.6694335938),getgenv().TweenSpeedTeleportPlace)
	end)


   TeleportSection2:addButton("Castle on the sea", function()
		DoTween(CFrame.new(-5026.3584, 323.515503, -2996.28442),getgenv().TweenSpeedTeleportPlace)
	end)

   TeleportSection2:addButton("Pineapple Town", function()
      DoTween(CFrame.new(-11363.5166, 362.381439, -10327.9727),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Mansion", function()
      DoTween(CFrame.new(-12555.1846, 507.168274, -7480.31543),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Mansion(Insta TP)", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Turtle.TradeTable.P1.CFrame
   end)
   TeleportSection2:addButton("Floating Turtle", function()
		DoTween(CFrame.new(-12001.6152, 1707.39319, -8789.03711),getgenv().TweenSpeedTeleportPlace)
	end)
   
   TeleportSection2:addButton("Beautiful Pirate Gate", function()
		DoTween(CFrame.new(-11990.901367188, 331.80770874023, -8845.5888671875),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Beautiful Pirate Domain", function()
		DoTween(CFrame.new(5310.80957, 160.446838, 129.390533),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Friendly Arena", function()
		DoTween(CFrame.new(5220.28955, 72.8193436, -1500.86304),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Haunted Castle", function()
		DoTween(CFrame.new(-9530.61035, 200.860657, 5763.13477),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Soul Reaper Raid Room", function()
		DoTween(CFrame.new(-9522.0957, 315.89975, 6751.88818),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Peanut Island", function()
		DoTween(CFrame.new(-2087.0561523438, 11.722011566162, -10002.080078125),getgenv().TweenSpeedTeleportPlace)
	end)
   TeleportSection2:addButton("Ice Cream Island", function()
		DoTween(CFrame.new(-851.74633789062, 65.819496154785, -10932.150390625),getgenv().TweenSpeedTeleportPlace)
	end)
   

end
local TeleportSection3 = Teleport:addSection("NPC")
if FirstSea then

   TeleportSection3:addButton("Usoap", function()
      DoTween(CFrame.new(-8036.05859375, 5756.033203125, -1934.3215332031),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Remove Fruit", function()
      DoTween(CFrame.new(5665.552734375, 64.651931762695, 868.56658935547),getgenv().TweenSpeedTeleportPlace)
   end)

   TeleportSection3:addButton("Second Sea Teleporter", function()
      DoTween(CFrame.new(-1165.7058105469, 7.6522002220154, 1728.2351074219),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Magic ELf(Candy For Boosts)", function()
      DoTween(CFrame.new(-657.54931640625, 7.8522391319275, 1573.9333496094),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Santa Claws(Candy For Items)", function()
      DoTween(CFrame.new(-704.76385498047, 7.8522439002991, 1553.6007080078),getgenv().TweenSpeedTeleportPlace)
   end)
elseif SecondSea then
   TeleportSection3:addButton("First Sea Teleporter", function()
      DoTween(CFrame.new(103.8427734375, 19.276727676392, 2834.9719238281),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Third Sea Teleporter", function()
      DoTween(CFrame.new(-1945.6728515625, 9.2648057937622, -2590.9370117188),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Fruit Inventory", function()
      DoTween(CFrame.new(-302.04800415039, 73.020126342773, 308.03646850586),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addDropdown("Inventory NPC",{"Inventory(Cafe)","Inventory(FirstSpot)"},function(Value)
      if Value == "Inventory(Cafe)" then
      DoTween(CFrame.new(-300.54641723633, 73.020111083984, 296.77435302734),getgenv().TweenSpeedTeleportPlace)
      elseif Value == "Inventory(FirstSpot)" then
         DoTween(CFrame.new(119.93355560303, 19.276727676392, 2854.0834960938),getgenv().TweenSpeedTeleportPlace)
      end
   end)
   TeleportSection3:addButton("Reset Stats NPC", function()
      DoTween(CFrame.new(-1888.8653564453, 88.357986450195, -1911.0194091797),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Race Reroll NPC", function()
      DoTween(CFrame.new(-312.74591064453, 73.020111083984, 358.31781005859),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Magic ELf(Candy For Boosts)", function()
      DoTween(CFrame.new(-458.58517456055, 73.060104370117, 260.00039672852),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Greedy Elf(Candy For Fragments)", function()
      DoTween(CFrame.new(-336.14483642578, 72.959754943848, 389.41271972656),getgenv().TweenSpeedTeleportPlace)
   end)
   
   TeleportSection3:addButton("Manager", function()
      DoTween(CFrame.new(-388.47613525391, 73.030082702637, 332.55465698242),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Marine Recruiter", function()
      DoTween(CFrame.new(-1349.1331787109, 72.959510803223, -1046.486328125),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Pirate Recruiter", function()
      DoTween(CFrame.new(-427.56546020508, 72.959693908691, 1447.662109375),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Mysterious Man", function()
      DoTween(CFrame.new(2570.8295898438, 1622.2680664062, -3745.8859863281),getgenv().TweenSpeedTeleportPlace)
   end)

elseif ThirdSea then
   TeleportSection3:addButton("Fruit Inventory", function()
      DoTween(CFrame.new(-12528.346679688, 336.91436767578, -7447.4794921875),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addDropdown("Inventory NPC",{"Inventory(Mansion)","Inventory(PortTown)"},function(Value)
      if Value == "Inventory(Mansion)" then
         DoTween(CFrame.new(-12571.06640625, 336.91436767578, -7444.5751953125),getgenv().TweenSpeedTeleportPlace)
      elseif Value == "Inventory(PortTown)" then
         DoTween(CFrame.new(-218.041015625, 6.7299399375916, 5327.6635742188),getgenv().TweenSpeedTeleportPlace)
      end
   end)
   TeleportSection3:addButton("Reset Stats NPC", function()
      DoTween(CFrame.new(-5143.0615234375, 315.41546630859, -3162.0434570312),getgenv().TweenSpeedTeleportPlace)
   end)
   
   TeleportSection3:addButton("Race Reroll NPC", function()
      DoTween(CFrame.new(-12494.5234375, 336.91436767578, -7563.8916015625),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Santa Claws(Candy For Items)", function()
      DoTween(CFrame.new(-12515.71875, 332.37814331055, -7598.1450195312),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Greedy Elf(Candy For Fragments)", function()
      DoTween(CFrame.new(-12515.71875, 332.37814331055, -7598.1450195312),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Bone Trading NPC", function()
      DoTween(CFrame.new(-8724.8076171875, 142.32157897949, 6247.6552734375),getgenv().TweenSpeedTeleportPlace)
   end)
   
   TeleportSection3:addButton("Hungry Man", function()
      DoTween(CFrame.new(-10918.0078125, 624.17694091797, -10267.389648438),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Elite Hunter", function()
      DoTween(CFrame.new(-5418.3354492188, 313.71548461914, -2825.7775878906),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Player Hunter", function()
      DoTween(CFrame.new(-5558.6201171875, 313.73687744141, -2839.9396972656),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Previous Hero", function()
      DoTween(CFrame.new(-10369.604492188, 331.65417480469, -10129.833984375),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Marine Recruiter", function()
      DoTween(CFrame.new(-12802.607421875, 332.37814331055, -7696.994140625),getgenv().TweenSpeedTeleportPlace)
   end)
   TeleportSection3:addButton("Pirate Recruiter", function()
      DoTween(CFrame.new(-12259.263671875, 332.37814331055, -7396.05859375),getgenv().TweenSpeedTeleportPlace)
   end) 
   
end
local Players = lib:addPage("Players")

local Pvp = Players:addSection("PvP")

local Player = Pvp:addDropdown("Selected Player",PlayerTable,function(Value)
   SelectedPlayer = Value
end)

Pvp:addButton("Refresh Player",function()
   Pvp:updateDropdown(Player,"Refresh Player",refreshPlayers(),function()
   end)
end)
Pvp:addToggle("Kill Player(Melee)",false,function(boolen)
   
   KillPlayerMelee = boolen
   if KillPlayerMelee and (SelectedPlayer == "" or SelectedPlayer == nil) then
      return false
   end
   spawn(function()
      while KillPlayerMelee do
         wait()
         pcall(function()
            ClickMod.activeController.hitboxMagnitude = 80 
         end)
      end
   end)
   
   while KillPlayerMelee do
      wait()
      local PlrKillMelee = game.Players:FindFirstChild(SelectedPlayer)
      if PlrKillMelee ~=nil then
         PlrToKillMelee = PlrKillMelee.Character
         if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PlrToKillMelee.HumanoidRootPart.Position).magnitude < 500 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlrToKillMelee.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
            FastAttack()
            Click()
            else lib:Notify("Kill Player(Melee)","You are too far from Enemy") return
         end
      end
   end
end)
Pvp:addToggle("Kill Player(Gun,Tween,Slow)",false,function(boolen)
   KillPlayerGunTween = boolen
   if KillPlayerGunTween and (SelectedPlayer == "" or SelectedPlayer == nil) then
      return false
   end
   for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
      if v:IsA("Tool") then
         if v:FindFirstChild("RemoteFunctionShoot") then 
            CurrentGun = v.Name
         end
      end
   end
   for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
      if v:IsA("Tool") then
         if v:FindFirstChild("RemoteFunctionShoot") then 
            CurrentGun = v.Name
         end
      end
   end

   while KillPlayerGunTween and game:GetService("RunService").RenderStepped:wait(0.1) do
      local PlrKillGunTween = game.Players:FindFirstChild(SelectedPlayer)
      if PlrKillGunTween ~=nil then 
         local Humanoid = PlrKillGunTween.Character:FindFirstChild("Humanoid")
         local Hum = PlrKillGunTween.Character:FindFirstChild("HumanoidRootPart")
         if PlrKillGunTween and PlrKillGunTween.Character and Humanoid and Hum and Humanoid.Health > 0 and PlrKillGunTween then
            TweenFloat()
            Equip(CurrentGun)
            Hum.Size = Vector3.new(60,60,60)
            if (Hum.Position-HumanoidRootPart.Position).magnitude >= 800 then
               spawn(function()
                  wait(0.1)
                  DoTween(Hum.CFrame * CFrame.new(0,10,-20),350)
               end)
               wait(0.5)
            else
               --Thread 1
               spawn(function()
                  if Hum and Humanoid.Health > 0 then
                     local RandomThing = math.random(1,4)
                     if RandomThing == 1 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Hum.CFrame * CFrame.new(0,80,-10)
                     elseif RandomThing == 2 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Hum.CFrame * CFrame.new(0,80,10)
                     elseif RandomThing == 3 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Hum.CFrame * CFrame.new(0,60,30)
                     elseif RandomThing == 4 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Hum.CFrame * CFrame.new(0,60,-30)
                     end
                  end
               end)
               --Thread 2
               spawn(function()
                  if game.Players.LocalPlayer.Character:FindFirstChild(CurrentGun)  then
                     if PlrKillGunTween.Character then
                        if PlrKillGunTween.Character.HumanoidRootPart then
                           local args = {
                              [1] = PlrKillGunTween.Character.HumanoidRootPart.Position,
                              [2] = PlrKillGunTween.Character.HumanoidRootPart
                           }
                           game:GetService("Players").LocalPlayer.Character[CurrentGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                        end
                     end
                  end
               end)
            end
         end
      end
   end
   RemoveFloat()
end)

Pvp:addToggle("Kill Player v2",false,function(boolen)
   
   KillPlayerV2 = boolen
   if KillPlayerV2 and (SelectedPlayer == "" or SelectedPlayer == nil) then
      return false
   end
   for i,v in pairs(ListMelee) do
      if game.Players.LocalPlayer.Backpack:FindFirstChild(ListMelee[i]) then
         CurrentMelee = ListMelee[i]
      end
   end
   for i,v in pairs(ListMelee) do
      if game.Players.LocalPlayer.Character:FindFirstChild(ListMelee[i]) then
         CurrentMelee = ListMelee[i]
      end
   end
   spawn(function()
      while KillPlayerV2 do
         wait()
         pcall(function()
            ClickMod.activeController.hitboxMagnitude = 80 
         end)
      end
   end)

   while KillPlayerV2 do
      wait()
      local PlrKill = game.Players:FindFirstChild(SelectedPlayer)
      if PlrKill ~=nil then
      PlrToKill = PlrKill.Character
      end
      for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
         if v:IsA("Tool") then
            if v:FindFirstChild("RemoteFunctionShoot") then 
               GunKillV2 = v.Name
            end
         end
      end
      for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
         if v:IsA("Tool") then
            if v:FindFirstChild("RemoteFunctionShoot") then 
               GunKillV2 = v.Name
            end
         end
      end

      if PlrToKill:FindFirstChild("Humanoid") and PlrToKill:FindFirstChild("HumanoidRootPart") and PlrToKill:FindFirstChild("Humanoid").Health > 0 and KillPlayerV2 then
         if PlrToKill:FindFirstChild("Humanoid") and PlrToKill:FindFirstChild("HumanoidRootPart") and PlrToKill:FindFirstChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- PlrToKill.HumanoidRootPart.Position).magnitude>350 then
            spawn(function()
               wait(0.1)
               DoTween(PlrToKill.HumanoidRootPart.CFrame* CFrame.new(0,50,0),350)
            end)
            wait(0.5)
         elseif PlrToKill:FindFirstChild("Humanoid") and PlrToKill:FindFirstChild("HumanoidRootPart") and PlrToKill:FindFirstChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- PlrToKill.HumanoidRootPart.Position).magnitude<350 then
            repeat wait()
               if KillPlayerV2 then
                  if PlrToKill:FindFirstChild("Humanoid") and PlrToKill:FindFirstChild("HumanoidRootPart") and PlrToKill:FindFirstChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- PlrToKill.HumanoidRootPart.Position).magnitude<350 then
                     if  PlrToKill.Humanoid.Health == 0 then return false end
                     Hitting = false
                     spawn(function()
                        while wait() do
                           if PlrToKill:FindFirstChild("Humanoid") and PlrToKill:FindFirstChild("HumanoidRootPart") and PlrToKill:FindFirstChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- PlrToKill.HumanoidRootPart.Position).magnitude<350 and KillPlayerV2 then
                              TweenFloat()
                              if Shooting then
                                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlrToKill.HumanoidRootPart.CFrame* CFrame.new(0,80,0)
                              elseif Skill then
                                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlrToKill.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                              elseif Hitting then
                                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlrToKill.HumanoidRootPart.CFrame * CFrame.new(5,5,0)
                              end
                           end
                        end
                     end)
                     getgenv().SilentAimPlr = true
                     plr = PlrToKill

                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlrToKill.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                     Skill = true

                     wait(0.1)
                     Equip(CurrentMelee)
                     if game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentMelee)  and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills["Electric Claw"].Z.Cooldown.AbsoluteSize.X == 0 then

                        VIM:SendKeyEvent(true,"Z",false,game)
                        VIM:SendKeyEvent(false,"Z",false,game)
                     end
                     if game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentMelee)  and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills["Electric Claw"].X.Cooldown.AbsoluteSize.X == 0 then

                        VIM:SendKeyEvent(true,"X",false,game)
                        VIM:SendKeyEvent(false,"X",false,game)
                     end
                     wait()
                     if game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentMelee)  and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills["Electric Claw"].C.Cooldown.AbsoluteSize.X == 0 then

                        VIM:SendKeyEvent(true,"C",false,game)
                        VIM:SendKeyEvent(false,"C",false,game)
                     end
                     wait()
                     Equip(GunKillV2)
                     if game:GetService("Players").LocalPlayer.Character:FindFirstChild(GunKillV2)  and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[GunKillV2].Z.Cooldown.AbsoluteSize.X == 0 then
                        Equip(GunKillV2)
                        VIM:SendKeyEvent(true,"Z",false,game)
                        VIM:SendKeyEvent(false,"Z",false,game)
                     end
                     wait(0.1)
                     if game:GetService("Players").LocalPlayer.Character:FindFirstChild(GunKillV2)  and game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[GunKillV2].X.Cooldown.AbsoluteSize.X == 0 then
                        Equip(GunKillV2)
                        VIM:SendKeyEvent(true,"X",false,game)
                        wait()
                        VIM:SendKeyEvent(false,"X",false,game)
                     end
                     Skill = false
                     wait()
                     Shooting = true
                     Equip(GunKillV2)
                     CountHit = 0
                     repeat wait(0.25)
                        Equip(GunKillV2)
                        Shooting = true
                        CountHit = CountHit + 1
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                     until CountHit == 12
                     wait()
                     CountHit = 0
                     Shooting = false
                     Hitting = true
                     
                     spawn(function()
                        while Hitting and KillPlayerV2 do
                           wait()
                           if Hitting and KillPlayerV2 then
                  
                              Click()
                           end
                        end
                     end)
                     wait(1)

                     Hitting = false
                  end
               end
            until  not PlrToKill.Parent or not PlrToKill:FindFirstChild("Humanoid") or not PlrToKill:FindFirstChild("HumanoidRootPart") or PlrToKill:FindFirstChild("Humanoid").Health <= 0 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- PlrToKill.HumanoidRootPart.Position).magnitude>350 or not KillPlayerV2
            wait()
            getgenv().SilentAimPlr = false
            Hitting = false
            Shooting = false
            Skill = false
         end
      end
   end
   RemoveFloat()
end)
Pvp:addToggle("Fully Silent Aim",false,function(boolen)
   FullySilentAim = boolen
   if SelectedPlayer ~= "" and  SelectedPlayer ~= nil and FullySilentAim then
   plr = game.Players:FindFirstChild(SelectedPlayer).Character
   
   getgenv().SilentAimPlr = true
   else getgenv().SilentAimPlr = false 
   end
end)

Pvp:addToggle("Silent Aim Gun",false,function(boolen)
   for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
      if v:IsA("Tool") then
         if v:FindFirstChild("RemoteFunctionShoot") then 
            SilentAimGun = v.Name
         end
      end
   end
   for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
      if v:IsA("Tool") then
         if v:FindFirstChild("RemoteFunctionShoot") then 
            SilentAimGun = v.Name
         end
      end
   end
   SilentAimSelectedPlr = boolen
end)
Pvp:addToggle("Spectate",getgenv().Spec,function(boolen)
   getgenv().Spec = boolen
   if game.Players:FindFirstChild(SelectedPlayer) ~= nil then
      local plr1 = game.Players.LocalPlayer.Character.Humanoid
      local plr2 = game.Players:FindFirstChild(SelectedPlayer)
      repeat wait(.1)
         if plr2 then
            if plr2.Character:FindFirstChild("Humanoid") ~= nil then
               wait(0.1)
               if plr2.Character:FindFirstChild("Humanoid") ~= nil then
                  game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
               end
            end
         end
      until not getgenv().Spec
      game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
   end
end)
local LocalPlayerPage = lib:addPage("Local Player")

local LocalPlayerSection = LocalPlayerPage:addSection("Local Player Functions")
LocalPlayerSection:addButton("Infinity Geppo",function(boolen)
   for i,v in next, getgc() do
      if game.Players.LocalPlayer.Character.Geppo then
         if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Geppo then
            for i2,v2 in next, getupvalues(v) do
               if tostring(i2) == "9" then
                  repeat wait(.1)
                     setupvalue(v,i2,0)
                  until game.Players.LocalPlayer.Character.Humanoid.Health <= 0  or not game.Players.LocalPlayer.Character
               end
            end
         end
      end
   end
end)
LocalPlayerSection:addButton("No Soru CD",function(boolen)
   for i,v in next, getgc() do
      if game.Players.LocalPlayer.Character.Soru then
         if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Soru then
            for i2,v2 in next, getupvalues(v) do
               if typeof(v2) == "table"  then
                  repeat wait(.1)
                     v2.LastUse = 0
                  until game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not game.Players.LocalPlayer.Character
               end
            end
         end
      end
   end
end)
LocalPlayerSection:addButton("No Dash CD",function(boolen)
   for i,v in next, getgc() do
         if game.Players.LocalPlayer.Character.Dodge then
            if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
            for i2,v2 in next, getupvalues(v) do
               if tostring(v2) == "0.4"  then
                  repeat wait(.1)
                     setupvalue(v,i2,0)
                  until game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not game.Players.LocalPlayer.Character
               end
            end
         end
      end
   end
end)
LocalPlayerSection:addToggle("Water Walker",false,function(Value)
   getgenv().WaterWalker = Value
   if getgenv().WaterWalker == true then
      game.Players.LocalPlayer.Data.DevilFruit.Value = ("Ice-Ice")
   elseif getgenv().WaterWalker == false then
      game.Players.LocalPlayer.Data.DevilFruit.Value = (MyDevilFruit)
   end
end)
LocalPlayerSection:addToggle("No Cd Attack",false,function(Value)
   getgenv().NoCDAttack = Value
   while game:GetService("RunService").RenderStepped:wait(0.05) and getgenv().NoCDAttack do
      pcall(function()
         ClickMod.activeController.attacking = false 
         ClickMod.activeController.active = false
         ClickMod.activeController.timeToNextAttack = 0
         ClickMod.activeController.increment = 4
      end)
   end
end)
LocalPlayerSection:addToggle("Increase Close Range Weapons Hitbox",false,function(boolen)
   getgenv().CloseRangeHitBox = boolen
   while getgenv().CloseRangeHitBox and wait() do
      pcall(function()
      
      ClickMod.activeController.hitboxMagnitude = 60 
      end)
   end
end)
LocalPlayerSection:addToggle("Remove Crew & Marine",false,function(boolen)
   getgenv().RemoveLogo = boolen
   if getgenv().RemoveLogo == false then return end 
      while getgenv().RemoveLogo do 
         wait(.1)
      
      local CheckName1 = game.Players.LocalPlayer
      local CheckName2 = tostring(CheckName1)
      for i,v in pairs(game:GetService("Workspace").Characters[CheckName2].HumanoidRootPart:GetChildren()) do
         if v.Name == "CrewBBG" then   
            v:Destroy()
         end
      end
      for i,v in pairs(game:GetService("Workspace").Characters[CheckName2].HumanoidRootPart:GetChildren()) do
         if v.Name == "MarineBBG" then  
            v:Destroy()
         end
      end
   end
end)
LocalPlayerSection:addToggle("No Stun",getgenv().NoStun,function(boolen)
   getgenv().NoStun = boolen
   while getgenv().NoStun do
      wait()
      local player = game.Players.LocalPlayer
      local char = player.Character
      if char then
         if char.Humanoid.Health <= 0 then 
            wait(5)
         end
         local Stun = char.Stun
         Stun.Value = 0
         game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(2,1,2)
      end
   end
end)
LocalPlayerSection:addToggle("Set Range Observation",getgenv().BoolenRangeObservation,function(boolen)
   getgenv().BoolenRangeObservation = boolen
   local player = game.Players.LocalPlayer
   local char = player.Character
   local VisionRadius = player.VisionRadius
   local VS = game.Players.LocalPlayer.VisionRadius.Value
   if not getgenv().BoolenRangeObservation then
      VisionRadius.Value = VS
   end
   while getgenv().BoolenRangeObservation do
      wait()
      if player then
         if char.Humanoid.Health <= 0 then 
            wait(5) 
         end
         VisionRadius.Value = getgenv().RangeObservation
      end
   end
end)

LocalPlayerSection:addSlider("Range Observation",0,0,25000,function(Value)
   getgenv().RangeObservation = Value
end)
LocalPlayerSection:addSlider("WalkSpeed",game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,30,500,function(Value)
   game.Players.LocalPlayer.Character.Movement.Disabled = true
   local WalkSpeedValue = Value

   local Player = game:GetService('Players').LocalPlayer
   local Humanoid = Player.Character:FindFirstChildOfClass('Humanoid')
   Humanoid.WalkSpeed = WalkSpeedValue
   wait(0.1)
end)
LocalPlayerSection:addSlider("Jump Power",game.Players.LocalPlayer.Character.Humanoid.JumpPower,50,1000,function(Value)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)
LocalPlayerSection:addSlider("Gravity",game.Workspace.Gravity,0,1000,function(Value)
   game.Workspace.Gravity = Value
end)
LocalPlayerSection:addSlider("Zoom Distance",0,500,10000,function(Value)
   game.Players.LocalPlayer.CameraMaxZoomDistance = Value
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/BloxFruit/main/AutoNextIsland.lua"))()

local Dungeon = lib:addPage("Dungeon")
local Chip = Dungeon:addSection("Chip")
Chip:addDropdown("Select Microchip", {"Flame","Ice","Quake","Light","Dark","String","Rumble","Human: Buddha"}, function(Value)
   Microchip = Value
end)
if SecondSea then
   Chip:addButton("Law Raid Chip",function()
      local args = {
         [1] = "BlackbeardReward",
         [2] = "Microchip",
         [3] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   end)
end
Chip:addToggle("Auto Buy Chip",false,function()
   AutoBuyChip = true
   while AutoBuyChip do
      wait(1)
      pcall(function()
         local args = {
         [1] = "RaidsNpc",
         [2] = "Check"
         }
         wait(.1)
         if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == true then
            local args = {
            [1] = "RaidsNpc",
            [2] = "Select",
            [3] = Microchip
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         end
         for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if string.find(v.Name,"Fruit") then
               local args = {
               [1] = "RaidsNpc",
               [2] = "Select",
               [3] = Microchip
               }
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
         end
         for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and string.find(v.Name,"Fruit") then
               if string.find(v.Name,"Fruit") then
                  local args = {
                  [1] = "RaidsNpc",
                  [2] = "Select",
                  [3] = Microchip
                  }
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
               end
            end
         end
      end)
   end
end)
local Raid = Dungeon:addSection("Raid")
if SecondSea then
   Raid:addToggle("Fully Auto Law Raid",getgenv().FullyAutolawRaid,function(boolen)
      getgenv().FullyAutolawRaid = boolen
      while getgenv().FullyAutolawRaid and game:GetService("RunService").RenderStepped:wait() do
         if LP.Backpack:FindFirstChild("Microchip") or Char:FindFirstChild("Microchip") then 
            if not game.Workspace.Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
               DoTween(CFrame.new(-5570.052734375, 332.41363525391, -5965.91015625),getgenv().TweenSpeedTeleportPlace)
            else
               local LawBoss = game:GetService("Workspace").Enemies:WaitForChild("Order [Lv. 1250] [Raid Boss]") 
               repeat game:GetService("RunService").RenderStepped:wait()
                  if Alive() then
                     LawBoss.HumanoidRootPart.Size = Vector3.new(60,3,60)
                     OldY = LawBoss.HumanoidRootPart.Position.Y
                     OldCFrame = LawBoss.HumanoidRootPart.CFrame
                     TweenFloat()
                     Simulation()
                     FastAttack()
                     HitBoxPlr()
                     DisabledNoClip = true

                     if LawBoss.Parent and LawBoss:FindFirstChild("Humanoid") and LawBoss:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and LawBoss:FindFirstChild("Humanoid").Health > 0 and (LawBoss.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude <= 300 then
                        LawBoss.HumanoidRootPart.Size = Vector3.new(60,3,60)

                        if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y >= LawBoss.HumanoidRootPart.Position.y then
                           if LawBoss.HumanoidRootPart.Position.Y - OldY >= 0 then
                              spawn(function()
                                 wait()
                                 if getgenv().FullyAutolawRaid and LawBoss.Parent and LawBoss:FindFirstChild("Humanoid") and LawBoss:FindFirstChild("HumanoidRootPart") ~= nil then
                                    if Alive() and LawBoss:FindFirstChild("Humanoid").Health > 0 and (LawBoss.HumanoidRootPart.Position-HumanoidRootPart.Position).magnitude <= 300 then
                                       TweenFloat()
                                       HumanoidRootPart.CFrame = LawBoss.HumanoidRootPart.CFrame * CFrame.new(0, 5, 30)
                                    else
                                       DoTween(LawBoss.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
                                    end
                                 end

                              end)
                           else 
                              wait()
                              DoTween(LawBoss.HumanoidRootPart.CFrame * CFrame.new(0,20,10),getgenv().TweenSpeedAutoFarm)
                           end
                        elseif getgenv().FullyAutolawRaid then
                           randomnumber = math.random(1,3)
                           if randomnumber == 1 then
                              HumanoidRootPart.CFrame = LawBoss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)      
                           elseif randomnumber ==2 then
                              HumanoidRootPart.CFrame = LawBoss.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30) 
                           elseif randomnumber ==3 then
                              HumanoidRootPart.CFrame = LawBoss.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                           end    
                        end
                     

                     elseif not Tweening and LawBoss:FindFirstChild("HumanoidRootPart") ~= nil and LawBoss.Parent and LawBoss:FindFirstChild("Humanoid") and LawBoss:FindFirstChild("Humanoid").Health > 0 and Alive() then  
                        DoTween(LawBoss.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                        if LawBoss.Parent and LawBoss:FindFirstChild("Humanoid") and LawBoss:FindFirstChild("HumanoidRootPart") ~= nil and Alive() and LawBoss:FindFirstChild("Humanoid").Health > 0 and (LawBoss.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                           DoTween(LawBoss.HumanoidRootPart.CFrame,getgenv().TweenSpeedAutoFarm)
                        end
                     end
                  else wait(5)
                  end
               until not LawBoss.Parent or LawBoss:FindFirstChild("Humanoid") == nil or LawBoss.Humanoid.Health <= 0 or LawBoss:FindFirstChild("HumanoidRootPart") == nil or not Alive() or getgenv().FullyAutolawRaid == false
            end
         elseif not LP.Backpack:FindFirstChild("Microchip") or not Char:FindFirstChild("Microchip") then
            local args = {
               [1] = "BlackbeardReward",
               [2] = "Microchip",
               [3] = "2"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait(1)
         end
      end
   end)
end
Raid:addToggle("Fully Auto Raid",getgenv().FullyAutoRaid,function(boolen)
   getgenv().FullyAutoRaid = boolen
   spawn(function()
      while getgenv().FullyAutoRaid and wait() do
         KillAuraF()
      end
   end)
   while getgenv().FullyAutoRaid do
      wait()
      getgenv().AutoNextIsland = true
      local args = {[1] = "Cousin", [2] = "Buy"}
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      wait(0.5)
      getgenv()
      if Microchip ~= nil and not AutoRaidJoined then
         local args = {
            [1] = "RaidsNpc",
            [2] = "Select",
            [3] = Microchip
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait(0.5)
         for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if string.find(v.Name,"Microchip") then
               if not AutoRaidJoined then
                  if ThirdSea then
                     --DoTween(CFrame.new(-5034.16309, 314.9664, -2948.1499),getgenv().TweenSpeedTeleportPlace)
                     fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector, 1)
                  elseif SecondSea then
                    -- DoTween(CFrame.new(-6438.73535, 250.645355, -4501.50684),getgenv().TweenSpeedTeleportPlace)
                     fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector, 1)
                  end
                     AutoRaidJoined = true
               else AutoRaidJoined = true
               end
            end
         end
         wait(25)
         repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
         wait(5)
         AutoRaidJoined = false
         getgenv().AutoNextIsland = false
      else return lib:Notify("FullyAutoRaid","Please Select A Chip")
      end
   end
end)
Raid:addToggle("Kill Aura",getgenv().KillAura,function(boolen)
   getgenv().KillAura = boolen
   while getgenv().KillAura do
      wait()
      KillAuraF()
   end
end)

Raid:addToggle("Kill Aura V2(For Bad Executors)",getgenv().KillAurav2,function(boolen)
   getgenv().KillAurav2 = boolen
   while getgenv().KillAurav2 do
      wait()
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
         for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if  v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and  v:FindFirstChild("HumanoidRootPart") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Humanoid").Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
               HitBoxPlr()
               
               repeat wait()
                  getgenv().KillAuraIng = true
                  spawn(function()
                     Click()
                  end)
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,30,0)
                  
               until not v.Parent or v:FindFirstChild("Humanoid") == nil or v.Humanoid.Health <= 0 or v:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") == nil or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 or getgenv().KillAurav2 == false
               getgenv().KillAuraIng = false
            end
         end
      end
   end
end)

Raid:addToggle("Auto Next Island",getgenv().AutoNextIsland,function(boolen)
   getgenv().AutoNextIsland = boolen
end)
Raid:addToggle("Auto Awaken",getgenv().AutoAwaken,function(boolen)
   getgenv().AutoAwaken = boolen
   while getgenv().AutoAwaken and wait() do
      local args = {[1] = "Awakener",[2] = "Awaken"}
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   end
end)
Raid:addButton("Teleport to Raid Room",function()
   if SecondSea then
      DoTween(CFrame.new(-6438.73535, 250.645355, -4501.50684),getgenv().TweenSpeedTeleportPlace)
   elseif ThirdSea then
      DoTween(CFrame.new(-5034.16309, 314.9664, -2948.14993),getgenv().TweenSpeedTeleportPlace)
   elseif FirstSea then
      return lib:Notify("Raid","Second And Third Sea Only")
   end
end)
local MiscPage = lib:addPage("Misc")
local PlayerTeam = MiscPage:addSection("Player Team")
PlayerTeam:addButton("Pirates Team",function()
   local args = {[1] = "SetTeam",[2] = "Pirates"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
end)
PlayerTeam:addButton("Marines Team",function()
   local args = {[1] = "SetTeam",[2] = "Marines"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
end)
local OpenUi = MiscPage:addSection("Ui")
OpenUi:addButton("Inventory Weapons Ui",function()
   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Inventory.Visible = true
end)
OpenUi:addButton("Inventory Fruits Ui",function()
   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.FruitInventory.Visible = true
end)
OpenUi:addButton("Fruits Shop Ui",function()
   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.FruitShop.Visible = true
end)
OpenUi:addButton("Title Ui",function()
   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Titles.Visible = true
end)
OpenUi:addButton("Open Color",function()
   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Colors.Visible = true
end)
OpenUi:addButton("Awakening Ui",function()
   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.AwakeningToggler.Visible = true
end)
local CodeSection = MiscPage:addSection("Codes Section")

CodeSection:addButton("Redeem All Exp Codes",function() 
   EnterCode("FUDD10")
   EnterCode("fudd10_v2")
   EnterCode("BIGNEWS")
   EnterCode("THEGREATACE")
   EnterCode("SUB2NOOBMASTER123")
   EnterCode("Sub2Daigrock")
   EnterCode("Axiore")
   EnterCode("TantaiGaming")
   EnterCode("STRAWHATMAINE")
   EnterCode("Sub2OfficialNoobie")
   EnterCode("UPD16")
   EnterCode("SUB2GAMERROBOT_EXP1")
   EnterCode("3BVISITS")
end)

CodeSection:addDropdown("Redeem Reset Stats Code",{"SUB2GAMERROBOT_RESET1";"Sub2UncleKizaru";},function(Value) 
   EnterCode(Value)
end)
local Shop = lib:addPage("Shop")

local ShopEvent = Shop:addSection("Event-Fragments")
ShopEvent:addButton("Buy Stats Refund (2500 Fragment)",function()

   local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "1"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "2"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end)

ShopEvent:addButton("Buy Random Race",function()
   wait(.1)
   local args = {[1] = "BlackbeardReward",[2] = "Reroll",[3] = "2"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopEvent:addButton("Buy Surprise",function()
   local args = {
      [1] = "Bones",
      [2] = "Check"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "Bones",
      [2] = "Buy",
      [3] = 1,
      [4] = 1
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

ShopEvent:addToggle("Auto Buy Surprise",false,function(v)
   AutoBuyBone = v
   while AutoBuyBone do
      local args = {
         [1] = "Bones",
         [2] = "Check"
      }
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 50 then

         local args = {
            [1] = "Bones",
            [2] = "Buy",
            [3] = 1,
            [4] = 1
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)      

ShopEvent:addButton("Trade Elf Hat",function()
   local args = {
      [1] = "Candies",
      [2] = "Check"
   }
   if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 250 then
      local args = {
         [1] = "Candies",
         [2] = "Buy",
         [3] = 3,
         [4] = 1
      }

      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   end
end)
ShopEvent:addButton("Trade Santa Hat",function()
   local args = {
      [1] = "Candies",
      [2] = "Check"
   }
   if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 500 then
      local args = {
         [1] = "Candies",
         [2] = "Buy",
         [3] = 3,
         [4] = 2
      }

      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   end
end)
ShopEvent:addButton("Trade Sleigh",function()
   local args = {
      [1] = "Candies",
      [2] = "Check"
   }
   if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 1000 then
      local args = {
         [1] = "Candies",
         [2] = "Buy",
         [3] = 3,
         [4] = 3
      }

      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   end
end)

ShopEvent:addButton("Trade Stats Refund(Candy)",function()
   local args = {
      [1] = "Candies",
      [2] = "Check"
   }
   if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 75 then
      local args = {
         [1] = "Candies",
         [2] = "Buy",
         [3] = 1,
         [4] = 2
      }

      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   end
end)
ShopEvent:addButton("Trade Race Reroll(Candy)",function()
   local args = {
      [1] = "Candies",
      [2] = "Check"
   }
   if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 100 then
      local args = {
         [1] = "Candies",
         [2] = "Buy",
         [3] = 1,
         [4] = 3
      }

      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   end
end)
ShopEvent:addToggle("Auto Trade 2x EXP(Candy)",false,function(v)
   AutoCandy2xEXP = v
   while AutoCandy2xEXP and wait(1) do
      local args = {
         [1] = "Candies",
         [2] = "Check"
      }
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 50 then
         local args = {
            [1] = "Candies",
            [2] = "Buy",
            [3] = 1,
            [4] = 1
         }
      
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
     end
   end
end)
ShopEvent:addDropdown("Select Fragments(Candy) Trade",{"Fragments(300)","Fragments(700)"},function(Value)
   ItemTradeCandy2 = Value
end)
ShopEvent:addToggle("Auto Trade Fragments(Candy)",false,function(v)
   AutoCandyFrag = v
   while AutoCandyFrag and wait(1) do
      if ItemTradeCandy2 == "Fragments(300)" then
         local args = {
            [1] = "Candies",
            [2] = "Check"
         }
         if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 50 then
            local args = {
               [1] = "Candies",
               [2] = "Buy",
               [3] = 2,
               [4] = 1
            }

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         end
      elseif ItemTradeCandy2 == "Fragments(700)" then
         local args = {
            [1] = "Candies",
            [2] = "Check"
         }
         if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 100 then
            local args = {
               [1] = "Candies",
               [2] = "Buy",
               [3] = 2,
               [4] = 2
            }

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         end
      end
   end
end)

local Melee = Shop:addSection("Fighting Styles")

Melee:addButton("Dark Step",function()
	local args = {
		[1] = "BuyBlackLeg"
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Melee:addButton("Electro",function()
	local args = {
	   [1] = "BuyElectro"
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)

 Melee:addButton("Water Kung Fu",function()
	local args = {
	   [1] = "BuyFishmanKarate"
	}
	
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)

 Melee:addButton("Dragon Breath",function()
	local args = {
	   [1] = "BlackbeardReward",
	   [2] = "DragonClaw",
	   [3] = "1"
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	local args = {
	   [1] = "BlackbeardReward",
	   [2] = "DragonClaw",
	   [3] = "2"
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)

 Melee:addButton("Superhuman",function()
	local args = {
	   [1] = "BuySuperhuman"
	}
	
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)

 Melee:addButton("Death Step",function()
	local args = {
	   [1] = "BuyDeathStep"
	}
	
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)

 Melee:addButton("Sharkman Karate",function()
	local args = {
	   [1] = "BuySharkmanKarate",
	   [2] = true
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	local args = {
	   [1] = "BuySharkmanKarate"
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)
 Melee:addButton("Electric Claw",function()
   local args = {[1] = "BuyElectricClaw"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)
 Melee:addButton("Dragon Tailon",function()

local args = {
   [1] = "BuyDragonTalon",
   [2] = true
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

local args = {
  [1] = "BuyDragonTalon"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

 end)


 local Abilities = Shop:addSection("Abilities")

 Abilities:addButton("Skyjump",function()
   local args = {
     [1] = "BuyHaki",
     [2] = "Geppo"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)

 Abilities:addButton("Enhancement",function()
   local args = {
     [1] = "BuyHaki",
     [2] = "Buso"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end)

Abilities:addButton("Flash Step",function()
   local args = {[1] = "BuyHaki",[2] = "Soru"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Abilities:addButton("Ken",function()
   local args = {[1] = "KenTalk",[2] = "Buy"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
wait()

local Sword = Shop:addSection("Swords")
Sword:addButton("Katana",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Katana"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Sword:addButton("Cutlass",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Cutlass"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   
end)
Sword:addButton("Dual Katana",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Dual Katana"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Sword:addButton("Iron Mace",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Iron Mace"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Sword:addButton("Triple Katana",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Triple Katana"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Sword:addButton("Pipe",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Pipe"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Sword:addButton("Dual-Headed Blade",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Dual-Headed Blade"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Sword:addButton("Bisento",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Bisento"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)



Sword:addButton("Soul Cane",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Soul Cane"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Sword:addButton("Midnight Blade",function()
   local args = {
      [1] = "Ectoplasm",
      [2] = "Buy",
      [3] = 3
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   
end)

local Accessories = Shop:addSection("Accessories")

Accessories:addButton("Black Cape",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Black Cape"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Accessories:addButton("Swordsman Hat",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Swordsman Hat"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Accessories:addButton("Tomoe Ring",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Tomoe Ring"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end)
Accessories:addButton("Ghoul Mask",function()
   local args = {
      [1] = "Ectoplasm",
      [2] = "Buy",
      [3] = 2
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   
end)

local Gun = Shop:addSection("Gun")


Gun:addButton("Slingshot",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Slingshot"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Gun:addButton("Musket",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Musket"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Gun:addButton("Flintlock",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Flintlock"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   
end)

Gun:addButton("Refined Slingshot",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Refined Slingshot"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Gun:addButton("Cannon",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Cannon"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Gun:addButton("Kabucha",function()
   local args = {
      [1] = "BlackbeardReward",
      [2] = "Slingshot",
      [3] = "2"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   
end)

Gun:addButton("Bizarre Rifle",function()
   local args = {
      [1] = "Ectoplasm",
      [2] = "Buy",
      [3] = 1
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
local Special = Shop:addSection("Special")
Special:addButton("Buy All Tools",function()
   local args = {
      [1] = "BuyItem",
      [2] = "Slingshot"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Musket"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Flintlock"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   

   local args = {
      [1] = "BuyItem",
      [2] = "Refined Slingshot"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "BuyItem",
      [2] = "Cannon"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BlackbeardReward",
      [2] = "Slingshot",
      [3] = "2"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   

   local args = {
      [1] = "Ectoplasm",
      [2] = "Buy",
      [3] = 1
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "BuyItem",
      [2] = "Black Cape"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "BuyItem",
      [2] = "Swordsman Hat"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "BuyItem",
      [2] = "Tomoe Ring"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "Ectoplasm",
      [2] = "Buy",
      [3] = 2
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Katana"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Cutlass"
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   
   local args = {
      [1] = "BuyItem",
      [2] = "Dual Katana"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Iron Mace"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Triple Katana"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "BuyItem",
      [2] = "Pipe"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Dual-Headed Blade"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyItem",
      [2] = "Bisento"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))



   local args = {
      [1] = "BuyItem",
      [2] = "Soul Cane"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "Ectoplasm",
      [2] = "Buy",
      [3] = 3
   }
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
   local args = {
      [1] = "BuyHaki",
      [2] = "Geppo"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {
      [1] = "BuyHaki",
      [2] = "Buso"
   }
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {[1] = "BuyHaki",[2] = "Soru"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   local args = {[1] = "KenTalk",[2] = "Buy"}
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
local Setting = lib:addPage("Setting")
local AutofarmSetting = Setting:addSection("AutoFarm Setting")
AutofarmSetting:addToggle("Auto Farm Quest",getgenv().AutoFarmQuest,function(boolen)
    getgenv().AutoFarmQuest = boolen
end)
AutofarmSetting:addToggle("Auto Farm Bring Mob",getgenv().AutoFarmBring,function(boolen)
   getgenv().AutoFarmBring = boolen
end)
AutofarmSetting:addToggle("Auto Farm Set Spawn",getgenv().AutoSetSpawn,function(boolen)
   getgenv().AutoSetSpawn = boolen
end)
AutofarmSetting:addToggle("Auto Farm Safe Mode(Doesn't Work)",getgenv().AutoSetSpawn,function(boolen)
   getgenv().AutoFarmSafeMode = boolen
end)
AutofarmSetting:addSlider("Safe Mode Health (%)",getgenv().AutoFarmHealthSafeMode,0,100,function(Value)
   getgenv().AutoFarmHealthSafeMode = Value
end)
AutofarmSetting:addToggle("Fast Attack(Risk?)",getgenv().FastAttack,function(boolen)
   getgenv().FastAttack = boolen
end)
local AutofarmFruitSetting = Setting:addSection("AutoFarm Fruit Mastery Setting")
AutofarmSetting:addButton("Auto Farm Mastery Fruit Info",function()
   lib:Notify("Auto Farm Mastery","10 in Slider = 1s Hold Time")
end)
AutofarmFruitSetting:addToggle("Skill Z",getgenv().SkillZ,function(Value)
   getgenv().SkillZ = Value
end)
AutofarmFruitSetting:addSlider("Skill Z Hold Time ",getgenv().SkillZHold,0,40,function(Value)
   getgenv().SkillZHold = Value
end)
AutofarmFruitSetting:addToggle("Skill X",getgenv().SkillX,function(Value)
   getgenv().SkillX = Value
end)
AutofarmFruitSetting:addSlider("Skill X Hold Time",getgenv().SkillXHold,0,40,function(Value)
   getgenv().SkillXHold = Value
end)
AutofarmFruitSetting:addToggle("Skill C",getgenv().SkillC,function(Value)
   getgenv().SkillC = Value
end)
AutofarmFruitSetting:addSlider("Skill C Hold Time",getgenv().SkillCHold,0,40,function(Value)
   getgenv().SkillCHold = Value
end)
AutofarmFruitSetting:addToggle("Skill V",getgenv().SkillV,function(Value)
   getgenv().SkillV = Value
end)
AutofarmFruitSetting:addSlider("Skill V Hold Time",getgenv().SkillVHold,0,40,function(Value)
   getgenv().SkillVHold = Value
end)
AutofarmFruitSetting:addToggle("Skill F",getgenv().SkillF,function(Value)
   getgenv().SkillF = Value
end)
AutofarmFruitSetting:addSlider("Skill F Hold Time",getgenv().SkillFHold,0,40,function(Value)
   getgenv().SkillFHold = Value
end)
local AutofarmGunSetting = Setting:addSection("AutoFarm Gun Mastery Setting")
AutofarmGunSetting:addToggle("Skill Z",getgenv().SkillZGun,function(Value)
   getgenv().SkillZGun = Value
end)
AutofarmGunSetting:addToggle("Skill X",getgenv().SkillXGun,function(Value)
   getgenv().SkillXGun = Value
end)
local TweenSetting = Setting:addSection("Tween Setting")
TweenSetting:addToggle("Use Recommended Speed",getgenv().RecommendedSpeed,function(boolen)
   getgenv().RecommendedSpeed = boolen
end)
TweenSetting:addSlider("Auto Farm Tween Speed",getgenv().TweenSpeedAutoFarm,100,1000,function(Value)
   getgenv().TweenSpeedAutoFarm = Value
end)
TweenSetting:addSlider("Quest Tween Speed",getgenv().TweenSpeedQuest,100,1000,function(Value)
   getgenv().TweenSpeedQuest = Value
end)
TweenSetting:addSlider("Teleport Place Tween Speed",getgenv().TweenSpeedTeleportPlace,100,1000,function(Value)
   getgenv().TweenSpeedTeleportPlace = Value
end)
TweenSetting:addSlider("Auto Chest Tween Speed",getgenv().TweenSpeedAutoChest,100,1000,function(Value)
   getgenv().TweenSpeedAutoChest = Value
end)
local RaidSetting = Setting:addSection("Raid Setting")
RaidSetting:addToggle("Only Teleport To Your Raid",getgenv().NearNextIsland,function(boolen)
   getgenv().NearNextIsland = boolen
end)
local AbilitySetting = Setting:addSection("Ability Setting")
--Simple Check 
getgenv().AutoBuso = true
spawn(function()
   while getgenv().AutoBuso do
      wait()
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
         local args = {
            [1] = "Buso"
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)

AbilitySetting:addToggle("Auto Buso",getgenv().AutoBuso,function(boolen)
   getgenv().AutoBuso = boolen
   while getgenv().AutoBuso do
      wait()
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
         local args = {
            [1] = "Buso"
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
   end
end)
AbilitySetting:addToggle("Auto Observation",getgenv().AutoObservation,function(boolen)
   getgenv().AutoObservation = boolen
   while getgenv().AutoObservation do
      wait()
      if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
      else wait(1)
         VirtualUser:CaptureController()
         VirtualUser:SetKeyDown('0x65')
         wait(2)
         VirtualUser:SetKeyUp('0x65')
      end
   end
end)
local UISetting = Setting:addSection("UI Setting")

UISetting:addKeybind("Hide UI", Enum.KeyCode.RightControl, function()
   lib:toggle()
end, function()

end)
for Setting, color in pairs(themes) do -- all in one theme changer, i know, im cool
	UISetting:addColorPicker(Setting, color, function(color3)
		lib:setTheme(Setting, color3)
	end)
end
UISetting:addButton("Save Setting",function()
   SaveSetting()
end)
local GameServer = lib:addPage("Game-SV")
Server = GameServer:addSection("Server")
Server:addSlider("Server Players",ServerPlayers,1,12,function(Value)
   ServerPlayers = Value
end)

Server:addButton("Server Hop",function()
   LowestServer()
   lib:Notify("Server Hop","Done Searching : No Server Found") 
end)
Server:addButton("Find Lowest Players Server",function()

   getgenv().AutoTeleport = true
   getgenv().DontTeleportTheSameNumber = true 
   getgenv().CopytoClipboard = false
   
   
   if not game:IsLoaded() then
       print("Game is loading waiting... | Amnesia Empty Server Finder")
   end
   lib:Notify("Lower Server","Credit to Amnesia")
   local maxplayers = math.huge
   local serversmaxplayer;
   local goodserver;
   local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
   
   function serversearch()
       for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
           if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
               serversmaxplayer = v.maxPlayers
               maxplayers = v.playing
               goodserver = v.id
           end
       end
       print("Currently checking the servers with max this number of players : " .. maxplayers .. " | Amnesia Empty Server Finder")
   end
   
   function getservers()
       serversearch()
       for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
           if i == "nextPageCursor" then
               if gamelink:find("&cursor=") then
                   local a = gamelink:find("&cursor=")
                   local b = gamelink:sub(a)
                   gamelink = gamelink:gsub(b, "")
               end
               gamelink = gamelink .. "&cursor=" ..v
               getservers()
           end
       end
   end
   
   getservers()
   
   print("All of the servers are searched") 
   print("Server : " .. goodserver .. " Players : " .. maxplayers .. "/" .. serversmaxplayer .. " | Amnesia Empty Server Finder")
      if CopytoClipboard then
      setclipboard(goodserver)
      end
      if AutoTeleport then
         if DontTeleportTheSameNumber then 
            if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                  return warn("It has same number of players (except you)")
            elseif goodserver == game.JobId then
                  return warn("Your current server is the most empty server atm") 
            end
         end
         print("AutoTeleport is enabled. Teleporting to : " .. goodserver)
         game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
      end
end)
Server:addButton("Rejoin",function()
   game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
GameSection = GameServer:addSection("Game")

GameSection:addButton("Delete Ui",function()
   local ui = game:GetService("CoreGui"):FindFirstChild("Island v2")
   if ui then
      ui:Destroy()
   end
end)
GameSection:addButton("Copy Discord Server Link",function()
   setclipboard("https://discord.gg/p2G3mXxfkA")
end)
GameSection:addButton("Join Discord Server",function()
   if req then
      req({
         Url = 'http://127.0.0.1:6463/rpc?v=1',
         Method = 'POST',
         Headers = {
               ['Content-Type'] = 'application/json',
               Origin = 'https://discord.com'
         },
         Body = http:JSONEncode({
               cmd = 'INVITE_BROWSER',
               nonce = http:GenerateGUID(false),
               args = {code = 'p2G3mXxfkA'}
         })
      })
   end
end)
RTXmode = {
   "Autumn";
   "Summer";
   "Summer2";
}
GameSection:addDropdown("RTX mode",RTXmode,function(Value)
   getgenv().mode = Value
end)

GameSection:addButton("RTX Graphic(Client)",function()
   lib:Notify("RTX Graphic","Credit To Whoever Made This")
   if getgenv().mode == "Summer2" then
      local yep = game.Lighting
      local yep2 = Instance.new("Sky")
      local yep3 = Instance.new("BloomEffect")
      local yep4 = Instance.new("BlurEffect")

      yep2.Parent = yep
      yep2.MoonTextureId = "rbxasset://sky/moon.jpg"
      yep2.SkyboxBk = "http://www.roblox.com/asset?id=153258865"
      yep2.SkyboxDn = "http://www.roblox.com/asset?id=153259937"
      yep2.SkyboxFt = "http://www.roblox.com/asset?id=153258844"
      yep2.SkyboxLf = "http://www.roblox.com/asset?id=153258851"
      yep2.SkyboxRt = "http://www.roblox.com/asset?id=153258851"
      yep2.SkyboxUp = "http://www.roblox.com/asset?id=153259943"
      yep2.StarCount = 3000
      yep2.SunAngularSize = 21
      yep2.SunTextureId = "rbxasset://sky/sun.jpg"

      yep3.Parent = yep
      yep3.Intensity = 1
      yep3.Size = 24
      yep3.Threshold = 0.5
      yep3.Enabled = true

      yep4.Parent = yep
      yep4.Enabled = true
      yep4.Size = 5.5
      return
   end
   local a = game.Lighting
   a.TimeOfDay = 20
   a.Ambient = Color3.fromRGB(33, 33, 33)
   a.Brightness = 6.67
   a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
   a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
   a.EnvironmentDiffuseScale = 0.105
   a.EnvironmentSpecularScale = 0.522
   a.GlobalShadows = true
   a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
   a.ShadowSoftness = 0.04
   a.GeographicLatitude = -15.525
   a.ExposureCompensation = 0.75

   local b = Instance.new("BloomEffect", a)
   b.Enabled = true
   b.Intensity = 0.04
   b.Size = 1900
   b.Threshold = 0.915

   local c = Instance.new("ColorCorrectionEffect", a)
   c.Brightness = 0.176
   c.Contrast = 0.39
   c.Enabled = true
   c.Saturation = 0.2
   c.TintColor = Color3.fromRGB(217, 145, 57)
   if getgenv().mode == "Summer" then
      c.TintColor = Color3.fromRGB(255, 220, 148)
   elseif getgenv().mode == "Autumn" then
      c.TintColor = Color3.fromRGB(217, 145, 57)
   else
      lib:Notify("RTX mode","No mode selected!")
      lib:Notify("RTX mode","Please select a mode")
      b:Destroy()
      c:Destroy()
   end

   local d = Instance.new("DepthOfFieldEffect", a)
   d.Enabled = true
   d.FarIntensity = 0.077
   d.FocusDistance = 21.54
   d.InFocusRadius = 20.77
   d.NearIntensity = 0.277

   local e = Instance.new("ColorCorrectionEffect", a)
   e.Brightness = 0
   e.Contrast = -0.07
   e.Saturation = 0
   e.Enabled = true
   e.TintColor = Color3.fromRGB(255, 247, 239)

   local e2 = Instance.new("ColorCorrectionEffect", a)
   e2.Brightness = 0.2
   e2.Contrast = 0.45
   e2.Saturation = -0.1
   e2.Enabled = true
   e2.TintColor = Color3.fromRGB(255, 255, 255)

   local s = Instance.new("SunRaysEffect", a)
   s.Enabled = true
   s.Intensity = 0.01
   s.Spread = 0.146
end)

GameSection:addButton("FPS Boost",function()
   lib:Notify("Fps Boost","Credit to e621")
   local decalsyeeted = true
   local g = game
   local w = g.Workspace
   local l = g.Lighting
   local t = w.Terrain
   t.WaterWaveSize = 0
   t.WaterWaveSpeed = 0
   t.WaterReflectance = 0
   t.WaterTransparency = 0
   l.GlobalShadows = false
   l.FogEnd = 9e9
   l.Brightness = 0
   settings().Rendering.QualityLevel = "Level01"
   for i, v in pairs(g:GetDescendants()) do
      if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
         v.Material = "Plastic"
         v.Reflectance = 0
      elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
         v.Transparency = 1
      elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
         v.Lifetime = NumberRange.new(0)
      elseif v:IsA("Explosion") then
         v.BlastPressure = 1
         v.BlastRadius = 1
      elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
         v.Enabled = false
      elseif v:IsA("MeshPart") then
         v.Material = "Plastic"
         v.Reflectance = 0
         v.TextureID = 10385902758728957
      end
   end
   for i, e in pairs(l:GetChildren()) do
      if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
         e.Enabled = false
      end
   end
end)
