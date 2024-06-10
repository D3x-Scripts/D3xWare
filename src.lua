local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local plr = game.Players.LocalPlayer
local line = "Hello"
function detectPlaceId(id)
return  (game.PlaceId == tonumber(id))
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
    version = "V1.0.3C",
   holidays = {
       Christmas = "put func",
       NYE = "put func",
       NY = "put func",
   },
    plines = {
        "Defiently not gonna delete the old one again...",
        "Made with :love: by herman_484",
		"Hehehehah",
    },
	dlines = {
		m = {
			"Good Morning,","Why play now","Good day,"
		},
		n = {
			"Good afternoon my","Best time to play now, ","Hello,"
		},
		i = {
			"Sweet Dreams,"
		}
   }
}
local dline = "Hewo"
local hour = gettime(24):format("#H")

if between(24,hour,11) then
dline = info["dlines"]["m"][math.random(1,#info["dlines"]["m"])] 
elseif between(12,hour,18) then
dline = info["dlines"]["n"][math.random(1,#info["dlines"]["n"])]
else
dline = info["dlines"]["i"][math.random(1,#info["dlines"]["i"])]
end

title = "D3xWare version "..info["version"]

 a = math.random(1,#info["plines"])
 line = info["plines"][a]

-- Start of UI Configuration

configs = {
    win = {
    Title = title,
    SubTitle = line,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
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
        Scripts = {
            Title = "Scripts",
            Icon = "scroll",
        },
        Player = {
            Title = "Player",
            Icon = "user",
        },
        Settings = {
            Title = "Settings",
            Icon = "settings",
        },
    }
}

local Window = Fluent:CreateWindow(configs["win"])

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Home = Window:AddTab(configs["tab"]["Home"]),
    Scripts = Window:AddTab(configs["tab"]["Scripts"]),
    Game = Window:AddTab(configs["tab"]["Game"]),
    Player = Window:AddTab(configs["tab"]["Player"]),
    Settings = Window:AddTab(configs["tab"]["Settings"]),
}

local Options = Fluent.Options

    Fluent:Notify({
        Title = "Hey, over here1",
        Content = "Join our group at BloxRob Studios!",
        SubContent = "Mabye follow deez-nuts445 on github?", -- Optional
        Duration = 2 -- Set to nil to make the notification not disappear
    })

    Tabs.Home:AddParagraph({
        Title = "Welcome Back!",
        Content = dline.." "..plr.DisplayName.."("..plr.Name..")!"
    })
	 Tabs.Home:AddParagraph({
        Title = "Device Using:",
        Content = getplatform(),
    })

  -- SCRIPT TAB

    Tabs["Scripts"]:AddParagraph({
        Title = "Popular Scripts",
        Content = "Scripts popular in the exploiting community.",
    })
function loadScript(v)
getgenv().f = v
getgenv().m = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/O2-FE-Script-hub/main/src"))()
end

    Tabs["Scripts"]:AddButton({
        Title = "Infinite Yield",
        Description = "Click to execute",
        Callback = function()
            loadScript("iy")
        end,
    })
    
    Tabs["Scripts"]:AddButton({
        Title = "Domain X",
        Description = "Click to execute",
        Callback = function()
          loadScript("domain x")
        end,
    })
     Tabs["Scripts"]:AddButton({
        Title = "Ultimate Trolling GUI",
        Description = "Click to execute",
        Callback = function()
          loadScript("utg")
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
  game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua")
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
          loadScript("notesgui")
        end,
    }) 
       Tabs["Scripts"]:AddButton({
        Title = "Dark Hub",
        Description = "Click to execute",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/d",true))()
        end,
       })
        Tabs["Scripts"]:AddButton({
        Title = "Remove display names",
        Description = "Click to execute",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/displayremover.lua"))()
        end,
    })
     Tabs["Scripts"]:AddParagraph({
        Title = "Game Scripts",
        Content = "If you join a supported game, then you will see some scripts.", 
     })

if detectPlaceId("155615604") or detectPlaceId("7993293100") then
        Fluent:Notify({
        Title = "Game Detected!",
        Content = "The game you joined,","idk","has scripts built in scripts. Go to the Scripts tab to try them out!",
        SubContent = "Mabye follow deez-nuts445 on github?", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
        })
        if detectPlaceId("155615604") then
            Tabs["Scripts"]:AddButton({
            Title = "Inf Statima (PRISON LIFE)",
            Description = "Click to execute",
            Callback = function()
                loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ImMejor35/Prison-Life/main/Infinite%20Stamina.lua"))()
            end,
           
         })
            Tabs["Scripts"]:AddButton({
            Title = "Admin (PRISON LIFE)",
            Description = "Click to execute",
            Callback = function()
                loadstring(game:HttpGet("https://pastebin.com/raw/rfAULQ83"))()
            end,    
        })
        end     

    if detectPlaceId("7993293100") then
     local drop = Tabs["Scripts"]:AddDropdown("Dropdown", {
        Title = "Teleport to",
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

end     
    -- GAME TAB

Tabs["Game"]:AddParagraph({
    Title = "Game infomation",
})
Tabs["Game"]:AddParagraph({
    Title = "Name",
    Content = getGameName(),
})

Tabs["Game"]:AddParagraph({
    Title = "Players / Max Players",
    Content = #game.Players:GetPlayers().."/"..game.Players.MaxPlayers
})
Tabs["Game"]:AddParagraph({
    Title = "PlaceId",
    Content = game.PlaceId,
})

    -- PLAYER TAB
local Input = Tabs["Player"]:AddInput("Speed", {
        Title = "Speed",
        Default = "16",
        Placeholder = "Change your speed",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
           shared.s = Value
        end
    })  
local Input = Tabs["Player"]:AddInput("Jump Power", {
        Title = "Jump Power",
        Default = "50",
        Placeholder = "Change your jump power",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
           shared.j = Value
        end
    })  
      local Slider = Tabs["Player"]:AddSlider("FOV", {
        Title = "FOV",
        Description = "Change your FOV",
        Default = 70,
        Min = 1,
        Max = 200,
        Rounding = 1,
        Callback = function(Value)
           shared.f = Value
        end
    })
        local Input = Tabs["Player"]:AddInput("Gravity", {
        Title = "Gravity",
        Default = "196.2",
        Placeholder = "Change your gravity",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
           shared.g = Value
        end
    })  

    Tabs["Player"]:AddButton({
        Title = "Freecam Unlock",
        Description  = "Click to execute",
        Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/0AAaq28G"))()
        
        end
    })

    local Toggle = Tabs["Player"]:AddToggle("Shiftlock", {Title = "Shiftlock", Default = game.Players.LocalPlayer.DevEnableMouseLock })
    Toggle:OnChanged(function()
        game.Players.LocalPlayer.DevEnableMouseLock = Options.Shiftlock.Value
    end)

-- Backgears
function grav(n)
if n == "def" then
game.workspace.Gravity = 192.6
elseif tonumber(n) ~= nil then
game.workspace.Gravity = n
end
end
function fov(v)
if v == "def" then
workspace.CurrentCamera.FieldOfView = 70
elseif tonumber(v) ~= nil then
workspace.CurrentCamera.FieldOfView = v
end
end
function speed(v)
local lp = game.Players.LocalPlayer
local char = lp.Character
if v == "def" then
char.Humanoid.WalkSpeed = 16
elseif tonumber(v) ~= nil then
char.Humanoid.WalkSpeed = v
end
end
function jumppower(v)
local lp = game.Players.LocalPlayer
local char = lp.Character
if v == "def" then
char.Humanoid.JumpPower = 50
elseif tonumber(v) ~= nil then
char.Humanoid.JumpPower = v
end
end
spawn(function()
while wait() do
    fov(shared.f)
    grav(shared.g)
    speed(shared.s)
    jumppower(shared.j)
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
