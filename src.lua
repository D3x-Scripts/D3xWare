--github account fucked
inactivemsg="Help my github acc has been shadow banned I don't know what to do since github doesent support hk phone numbers i cant do anything if something ever happens just treat this as a fake"
print(inactivemsg)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local plr = game.Players.LocalPlayer
local TeleportCheck = false
local Options = Fluent.Options
local exec = identifyexecutor()
local a = true
local line = "Test me, "
local ShortestDistance = math.huge
function GetClosestPlayer()
local e,a,b,c,d = pcall(function()
local player = game.Players.LocalPlayer
local players = game.Players:GetPlayers()
  local minDistance = math.huge
  local closestPlayer = ""
  for _, otherPlayer in pairs(players) do
    if otherPlayer == player then
      continue
    end
    local distance = (player.Character.PrimaryPart.Position - otherPlayer.Character.PrimaryPart.Position).magnitude
    if distance < minDistance then
      closestPlayer = otherPlayer
      minDistance = distance
      display = game.Players:FindFirstChild(closestPlayer.Name).DisplayName
    end
  end
  name = closestPlayer.Name
return {display,name,minDistance,closestPlayer}
end)
return a,b,c,d
end
function getSubplaces()
local a = {}
local b = {}
local t = {}
local AssetService = game:GetService("AssetService")

local placePages = AssetService:GetGamePlacesAsync()

while true do
	for i, place in placePages:GetCurrentPage() do
		n=place.Name
		id=place.PlaceId
        a[n]=id
        b[id]=n
	end
	if placePages.IsFinished then
		break
	end
	placePages:AdvanceToNextPageAsync()
end
return a,b
end
local myTable = getSubplaces()
local key, value = next(myTable)
local placename = {}
local placeid = {}
while key do
  table.insert(placename,key)
  table.insert(placeid,value)
  key, value = next(myTable, key)
end
function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		print("Ok")
	else
		warn("No")
	end
end
function detectPlaceId(id)
return  (game.PlaceId == tonumber(id)) or (game.GameId == tonumber(id))
end
function between(mi,v,ma)
v=tonumber(v)
return (mi<=v) and (v<=ma)
end 
function gettime(mode)
    local time = os.date('*t')
    if mode == 12 and time.hour > 12 then
        time.hour = time.hour - 12
        time.denominator = 'PM'
    else
        time.denominator = 'AM'
    end
    return {
        format = function(self, format_string)
            local replacements = {
                ['#Y'] = time.year,
                ['#m'] = time.month,
                ['#d'] = time.day,
                ['#H'] = time.hour,
                ['#M'] = time.min,
                ['#S'] = time.sec,
                ['#D'] = time.denominator
            }
            return (format_string:gsub('#.', replacements))
        end
    }
end  
function checkDate(mth,day)
local month = os.date("*t")["month"]
local _day = os.date("*t")["day"]
if month == mth then
if _day == day then
return true
else
return false
end
else
return false
end
end
function getplatform()
    local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
    if (GuiService:IsTenFootInterface()) then
        return "Console"
    elseif (UserInputService.TouchEnabled and not UserInputService.MouseEnabled) then
        --touchscreen computers now have touchenabled so make sure to check for lack of mouse too
		--also, not all phones/tablets have accelerometer and/or gyroscope
        local DeviceSize = workspace.CurrentCamera.ViewportSize; 
		if ( DeviceSize.Y > 600 ) then
			return "Tablet"
		else
			return "Phone"
		end
    else
        return "Desktop"
    end
end
function getGameName()
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
return GameName
end
function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		print("Ok")
	else
		warn("No")
	end
end
info = {
    version = "V1.0.9",
   holidays = {
       Christmas = {
           ["emoji"] = "🎄🎄🎄",
           ["trigger"] = checkDate(12,25)
       },
       ChristmasEve = {
           ["emoji"] = "🎄",
           ["trigger"] = checkDate(12,24)
       },
       BoxingDay = {
           ["emoji"] = "🎄🎁",
           ["trigger"] = checkDate(12,24)
       },
       NY = {
           ["emoji"] = "🎉",
           ["trigger"] = checkDate(1,1)
       },
       NeverForget = {
           ["emoji"] = "🕊️🌹",
           ["trigger"] = checkDate(8,31) or checkDate(7,21)
       },
   },
    plines = {
        "Defiently not gonna delete the old one again...",
        "Made with :love: by herman_484",
		"Hehehehah",
        "Little John used galvanised square steel and eco-friendly\nwood venners to build his house.",
        "How did i forgort to put out 1.0.4",
        "Did you know if you streched\nyour blood veins out your body you will die?",
        "Accidentally resetted your PC? I did.",
        "AAAAAAAAAAAAAAAAAAAAAAAAAAA",
        "ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ",
        "Lesbian Space Princess is shit.",
        "hello fellow skid"
    },
	dlines = {
		m = {
			"Good Morning,","Why play now","Good day,","Up bright and early,"
		},
		n = {
			"Good afternoon my","Best time to play now, ","Hello,","Ooo hello fancy smanchy"
		},
		i = {
			"Sweet Dreams,"
		}
   }
}
local dline = "Hewo"
local hour = gettime(24):format("#H")

if between(6,hour,11) then
dline = info["dlines"]["m"][math.random(1,#info["dlines"]["m"])] 
elseif between(12,hour,18) then
dline = info["dlines"]["n"][math.random(1,#info["dlines"]["n"])]
elseif between(19,hour,24) or between(1,hour,5) then
dline = info["dlines"]["i"][math.random(1,#info["dlines"]["i"])]
end

title = "D3xWare version "..info["version"]

for i,v in pairs(info["holidays"]) do
    if v["trigger"] then
        title = v["emoji"]..title..v["emoji"]
     end
 end       

 a = math.random(1,#info["plines"])
 line = info["plines"][a]

-- Start of UI Configuration

configs = {
    win = {
    Title = title,
    SubTitle = line,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    },
    tab = {
        Home = {
            Title = "Home",
            Icon = "home",
        },
        Game = {
            Title = "Game",
            Icon = "gamepad-2",
        },
        Server = {
            Title = "Server",
            Icon = "server",
        },    
        Scripts = {
            Title = "Scripts",
            Icon = "scroll",
        },
        Player = {
            Title = "Player",
            Icon = "user",
        },
        Tools = {
            Title = "Tools",
            Icon = "hammer",
        },
        Settings = {
            Title = "Settings",
            Icon = "settings",
        },
    }
}
function formatn(a,b) return (a ~= b and a.."("..b..")") or b end
greet = formatn(plr.DisplayName,plr.Name)
local Window = Fluent:CreateWindow(configs["win"])

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Home = Window:AddTab(configs["tab"]["Home"]),
    Scripts = Window:AddTab(configs["tab"]["Scripts"]),
    Game = Window:AddTab(configs["tab"]["Game"]),
    Server = Window:AddTab(configs["tab"]["Server"]),
    Player = Window:AddTab(configs["tab"]["Player"]),
    Tools = Window:AddTab(configs["tab"]["Tools"]),
    Settings = Window:AddTab(configs["tab"]["Settings"]),
}

    Fluent:Notify({
        Title = "Hey, over here!",
        Content = "Join our group at BloxRob Studios!",
        SubContent = "lolz", -- Optional
        Duration = 2 -- Set to nil to make the notification not disappear
    })

    Tabs.Home:AddParagraph({
        Title = "Welcome Back!",
        Content = dline.." "..greet.."!"
    })
	 Tabs.Home:AddParagraph({
        Title = "Device:",
        Content = getplatform(),
    })

    Tabs["Home"]:AddParagraph({
        Title = "Exploit:",
        Content = exec,
    })

  -- SCRIPT TAB

    Tabs["Scripts"]:AddParagraph({
        Title = "Popular Scripts",
        Content = "Scripts popular among in the exploiting community.",
    })
    Tabs["Scripts"]:AddButton({
        Title = "Infinite Yield",
        Description = "Click to execute",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
    })
    
    Tabs["Scripts"]:AddButton({
        Title = "Domain X",
        Description = "Click to execute",
        Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
    })
     Tabs["Scripts"]:AddButton({
        Title = "Ultimate Trolling GUI",
        Description = "Click to execute",
        Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Blukez/Scripts/main/UTG%20V3%20RAW"))()
        end,
    })
    Tabs["Scripts"]:AddButton({
        Title = "Aimbot",
        Description = "Click to execute",
        Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
        end,
    })
     Tabs["Scripts"]:AddButton({
        Title = "Orca",
        Description = "Click to execute",
        Callback = function()
           loadstring(
 loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkNetworks/Orca/master/public/latest.lua"))()
)()
        end,
    })
     Tabs["Scripts"]:AddParagraph({
        Title = "More Scripts",
        Content = "Other scripts" 
     })
    Tabs["Scripts"]:AddButton({
        Title = "Notepad GUI",
        Description = "Click to execute",
        Callback = function()
          loadstring(game:HttpGet("https://pastebin.com/raw/jX37k5Qn"))()
        end,
    }) 
       Tabs["Scripts"]:AddButton({
        Title = "Cobalt",
        Description = "Click to execute",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wortexios/CobaltSpy/refs/heads/main/Cobalt"))()
        end,
       })
        Tabs["Scripts"]:AddButton({
        Title = "Electron UI",
        Description = "Click to execute",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/ZMKiRkQh",true))()
        end,
    }) 
       Tabs["Scripts"]:AddButton({
        Title = "Synapse X UI",
        Description = "Click to execute",
        Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/8Q4X7RfN",true))()
        end,
       })
       Tabs["Scripts"]:AddButton({
        Title = "Spectate GUI",
        Description = "Click to execute",
        Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/8Q4X7RfN",true))()
        end,
       })
     Tabs["Scripts"]:AddParagraph({
        Title = "Game Scripts",
        Content = "If you join a supported game, then you will see some scripts.", 
     })

if detectPlaceId("155615604") or detectPlaceId("7993293100") or detectPlaceId("3572713022") then
        Fluent:Notify({
        Title = "Game Detected!",
        Content = "The game you joined, "..getGameName().." has supported scripts. Go to the Scripts tab to try them out!",
        SubContent = "Mabye follow deez-nuts445 on github?", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
        })

    if detectPlaceId("7993293100") then
     local drop = Tabs["Scripts"]:AddDropdown("Dropdown", {
        Title = "Teleport to (TSUNAMI GAME)",
        Values = {"1 (spawn)","2 (research room)","3 (research cafeteria)","4 (end)","5 (car park)"},
        Multi = false,
        Default = 1,
    })

        drop:OnChanged(function(Value)
        local args = {
         [1] = string.sub(Value,"1","1")
        }

        game:GetService("ReplicatedStorage").RemoteEvents.Gui.ResearcherTeleportSystem:FireServer(unpack(args))
        end)
    end

    if detectPlaceId("3572713022") then
        Tabs["Scripts"]:AddButton({
            Title = "Spawn Cars menu (CCS)",
            Description = "Click to execute",
            Callback = function()
                loadstring(game:HttpGet('https://pastebin.com/raw/9bRZMZ4L'))()
            end
        })
    end    

end     
    -- GAME TAB

Tabs["Game"]:AddParagraph({
    Title = "Game infomation",
})
Tabs["Game"]:AddParagraph({
    Title = "Name",
    Content = getGameName(),
})
Tabs["Game"]:AddButton({
    Title = "Get Player count",
    Description = "",
    Callback = function()
         Window:Dialog({
                Title = "D3xWare Toolbox",
                Content = #game.Players:GetPlayers(),
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            
                        end
                    },
                }
            })
    end
})
Tabs["Game"]:AddParagraph({
    Title = "Max Players",
    Content = game.Players.MaxPlayers
})
 Tabs["Game"]:AddParagraph({
    Title = "Game Id",
    Content = game.GameId,
})
    
    Tabs["Game"]:AddButton({
    Title = "Copy Game ID",
    Description = "Copy the place id of the game",
    Callback = function()
        toClipboard(game.GameId)
        Fluent:Notify({
        Title = "Copied!",
        Content = "Content has been copied!",
        SubContent = "Mabye follow deez-nuts445 on github?", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
        })
    end
})
    -- SERVER TAB
 Tabs["Server"]:AddParagraph({
    Title = "Place Id",
    Content = game.PlaceId,
})
    
    Tabs["Server"]:AddButton({
    Title = "Copy Place ID",
    Description = "Copy the place id of the game",
    Callback = function()
        toClipboard(game.PlaceId)
        Fluent:Notify({
        Title = "Copied!",
        Content = "Content has been copied!",
        SubContent = "Mabye follow deez-nuts445 on github?", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
        })
    end
})
  
    Tabs["Server"]:AddButton({
            Title = "Rejoin",
            Description = "Click to execute",
            Callback = function()
               game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
            end,    
        })
Tabs["Server"]:AddButton({
        Title = "Exit",
        Description  = "Click to exit with style",
        Callback = function()
       game:Shutdown()
        end
})
    
     Tabs["Server"]:AddParagraph({
       Title = "Place Joiner",
       Content = "D3xWare will help you find places in this game, you will then be able to teleport to them."
   })

    local drop = Tabs["Server"]:AddDropdown("Dropdown", {
        Title = "Places list",
        Values = placename,
        Multi = false,
        Default = 1,
    })
      drop:OnChanged(function(Value)
       shared.id = tonumber(getSubplaces()[Value]) or 0
    end)
  Tabs["Server"]:AddButton({
        Title = "Teleport",
        Description  = "Click to teleport to given place.",
        Callback = function()
        local db
            if not db then
                db = true
                game:GetService("TeleportService"):Teleport(shared.id)
            end
        end
})
    
    -- PLAYER TAB
local Input = Tabs["Player"]:AddInput("Speed", {
        Title = "Speed",
        --Default = tonumber(shared.s),
        Placeholder = "Changes your speed",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
           shared.s = Value
        end
    })  
local Input = Tabs["Player"]:AddInput("Jump Power", {
        Title = "Jump Power",
        --Default = tonumber(shared.j),
        Placeholder = "Change your jump power",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
           shared.j = Value
        end
    })  
      local Input = Tabs["Player"]:AddInput("Gravity", {
        Title = "FOV",
        --Default = tonumber(shared.f),
        Placeholder = "Changes your FOV",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
           shared.f = Value
        end
    })
        local Input = Tabs["Player"]:AddInput("Gravity", {
        Title = "Gravity",
        --Default = tonumber(shared.g),
        Placeholder = "Changes your gravity",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
           shared.g = Value
        end
    })  
     local Input = Tabs["Player"]:AddInput("sw", {
        Title = "Set CustomPhysicalProperties\n(Stregthen/Weaken)",
        --Default = tonumber(shared.a),
        Placeholder = "Enter a number/inf",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
         shared.a = Value
	    end
        
    })  
       Tabs["Player"]:AddButton({
        Title = "Confirm",
        Description  = "Click to change speed, jump power, gravity, fov and strength",
        Callback = function()
            game.workspace.Gravity = shared.g
            workspace.CurrentCamera.FieldOfView = shared.f
             game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = shared.s
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = shared.j
             for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		    if child.ClassName == "Part" then
				child.CustomPhysicalProperties = PhysicalProperties.new(shared.a, 0.3, 0.5)
		end
     end 
        Fluent:Notify({
        Title = "Done!",
        Content = "Use the keybind Left Ctrl + P to toggle freecam.",
        SubContent = "Mabye follow deez-nuts445 on github?", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
        })
        end
    })
    Tabs["Player"]:AddButton({
        Title = "Freecam Unlock",
        Description  = "Click to execute",
        Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/0AAaq28G"))()
        Fluent:Notify({
        Title = "Ran freecam unlock!",
        Content = "Use the keybind Left Ctrl + P to toggle freecam.",
        SubContent = "Mabye follow deez-nuts445 on github?", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
        })
        end
    })

    local Toggle = Tabs["Player"]:AddToggle("MyToggle", {Title = "Shiftlock", Default = game.Players.LocalPlayer.DevEnableMouseLock })

    Toggle:OnChanged(function()
        game.Players.LocalPlayer.DevEnableMouseLock = Options.MyToggle.Value
    end)
    
    Options.MyToggle:SetValue(game.Players.LocalPlayer.DevEnableMouseLock)

    
    -- TOOLS TAB

    local Keybind = Tabs["Tools"]:AddKeybind("Keybind", {
        Title = "Panic Key (leaves the game instantly)",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "Y", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        Callback = function(Value)
            game:Shutdown()
        end,
    })

   Tabs["Tools"]:AddButton({
       Title = "Find nearest player",
       Description = "Click to find (a bit broken)",
       Callback = function()
       stuff= GetClosestPlayer()
       dn=tostring(stuff[1]) or "Display"
       n=tostring(stuff[2]) or "Name"
       d=tonumber(stuff[3]) or 0
       msg = formatn(dn,n).." with a distance of about "..math.round(d).." studs."
        Window:Dialog({
                Title = "D3xWare Toolbox",
                Content = msg,
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                           
                        end
                    },
                }
            })
       end
   })

-- SETTINGS TAB

if queue_on_teleport then
    local t2 = Tabs["Settings"]:AddToggle("mmm",{Title="Execute back on moving servers", Default = a})

    t2:OnChanged(function()
        a = Options.mmm.Value
        TeleportCheck = false
    end)
end 

-- Backgears

task.spawn(function()
while wait() do  
    if a and queue_on_teleport and (not TeleportCheck) then
        TeleportCheck = true
        queue_on_teleport("print('hi')")
        queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/D3x-Scripts/D3xWare/main/src.lua'))()")
    end
end    
end)
                                
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("D3xWare")
SaveManager:SetFolder("D3xWare/Save")

InterfaceManager:BuildInterfaceSection(Tabs["Settings"])
SaveManager:BuildConfigSection(Tabs["Settings"])


Window:SelectTab(1)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

