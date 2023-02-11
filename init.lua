-- D3xWare V1.0.3G
function init()
if not game:IsLoaded() then repeat wait() print("D3xWare is waiting for the game to load.") until game:IsLoaded() end
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/discord-ui.lua")()
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
function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		print("Ok")
	else
		warn("No")
	end
end
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/discord-ui.lua")()
function detectPlaceId(id)
if game.PlaceId == tonumber(id) then
		return true
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
function getexploitname()
local a=
(TRIGON_LOADED and "Trigon EVO")or(COMET_LOADED and "Comet")or(syn and not is_sirhurt_closure and not pebc_execute and "Synapse")or(secure_load and "Sentinel")or(EVON_LOADED and "Evon")or(is_sirhurt_closure and "Sirhurt")or(pebc_execute and "ProtoSmasher")or(KRNL_LOADED and "Krnl")or(OXYGEN_LOADED and "Oxygen U")or(WrapGlobal and "WeAreDevs")or(IsElectron and "Electron")or(isvm and "Proxo")or(shadow_env and "Shadow")or(jit and "EasyExploits")or(getreg()['CalamariLuaEnv'] and "Calamari")or(unit and "‎")or(IS_VIVA_LOADED and "VIVA")or(IS_COCO_LOADED and "Coco")or("Unsupported Executor / No Executer")return a 
end
function grav(n)
if n == "def" then
game.workspace.Gravity = 192.6
elseif tonumber(n) ~= nil then
game.workspace.Gravity = n
end
end

function detectGameId(id)
if game.GameId == tonumber(id) then
		return true
else
		return false
end	
end
function randomString(len)
	local length = len
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end
function getGameName()
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
return GameName
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
_VERSION = "V1.0.3G"
local old = "D3xWare ".._VERSION
local name
local platform = getplatform()
local functs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/factorial_functions.lua"))()
local funct = loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/getclosestplayer.lua"))()
local time_lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/d.lua"))()
local sessionId = randomString(math.random(10,15)).."/"..functs.fact(math.random(7,10))
local isNewYear = checkDate(1,1)
local isChristmas = checkDate(12,25)
local isHalloween = checkDate(8,31)
if isNewYear then
local ph = "🎉" 	
name = ph..old..ph
elseif isChristmas then
local ph = "🎄"	
name = ph..old..ph
elseif isHalloween then
local ph = "🎃"	
name = ph..old..ph
else	
name = old	
end	
local win = DiscordLib:Window(name)
local home = win:Server("Home","0")
local ch = home:Channel("Home")
local key
local welome = ch:Label("Welcome to "..name..","..game.Players.LocalPlayer.Name.."!")
ch:Seperator()
local pen2 = ch:Label("SessionId: "..sessionId)
ch:Seperator()
local Exp = ch:Label("Exploit Using: "..getexploitname())
ch:Seperator()
local pf = ch:Label("Device type: "..platform)
ch:Seperator()
ch:Button("Copy SessionId",function()
toClipboard(sessionId)
end)

local plset = home:Channel("Player")
plset:Button("Get Teleport Tool",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/tptool.lua"))()
end)
plset:Textbox("FOV",'"def" for default FOV',false,function(v)
shared.fov = v
end)
plset:Textbox("Gravity",'"def" for default gravity',false,function(v)
shared.grav = v
end)
plset:Textbox("Speed",'"def" for default speed',false,function(v)
shared.speed = v
end)
plset:Textbox("Jump",'"def" for default jumppower',false,function(v)
shared.jmp = v
end)
plset:Button("Reset To Normal",function()
shared.fov = 70
shared.grav = 192.6
shared.speed = 16
shared.jumppower = 50
end)
plset:Button("Refresh",function()
fov(shared.fov)
grav(shared.grav)
speed(shared.speed)
jumppower(shared.jmp)
end)
spawn(function()
	while wait() do
			fov(shared.fov)
			grav(shared.grav)
            speed(shared.speed)
			jumppower(shared.jmp)
	end
end)
local credits = home:Channel("Credits")
local a = credits:Label("Made by herman_484")
local aaa = credits:Button("Join the discord!",function()
local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
Module.Prompt({ invite = "6kp4eSMq8k", name = "O2 Scripts" }) -- name is optional
Module.Join("6kp4eSMq8k")
end)
local guiset = home:Channel("Settings")
guiset:Bind("Toggle UI Keybind", Enum.KeyCode.Home, function()
DiscordLib:ToggleUi()
end)
guiset:Seperator()
guiset:Textbox("Key", "Key for scripts", false,function(txt)
		print(txt)
		key = txt
end)
local scripts = win:Server("Scripts","0")
local label = scripts:Channel("O2 Scripts")
local scrs = {"domain x","iy","getjobid", "antigrav", "exit", "utg","notesgui", "wallwalk", "choosemap", "alltools", "admin", "fecheck", "reach", "flinggui","whatexplotsareonline"}
local drop = label:Dropdown("Script Selections",scrs,function(sel)
function loadScript(v,send)
getgenv().f = v
getgenv().m = send
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/O2-FE-Script-hub/main/src"))()
end
loadScript(sel,shared.m)
end)
local aa = label:Toggle("Send Notifications",true,function(t)
shared.m = t
end)
local chh = scripts:Channel("Others")
chh:Button("Unlock freecam(ctrl + P)",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/VapeWare/main/freecam.lua"))()
end)
chh:Seperator()
chh:Button("Remote Spy",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/VapeWare/main/rspy.lua"))()
end)
chh:Seperator()
chh:Button("Stand on Player GUI",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/Deez-Nuts445/00f1e5bd05fb447124087b54440cfceb/raw/d8c7e97132ae13d644dbcaec08f16876c95c7410/aa.lua"))()
end)
chh:Seperator()
chh:Button("Chatlines",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/Deez-Nuts445.github.io/main/sss.lua"))()
end)
chh:Seperator()
chh:Button("Easy emoji access",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/Deez-Nuts445/91676864e5bfc8f2f3a5aaf9880144c4/raw/17779eec3cfe12524a02b654336ee737484abf2c/docky.lua"))()
end)
chh:Seperator()
chh:Button("Free emote player(, to toggle)",function()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Gi7331/scripts/main/Emote.lua"))()
end)
chh:Seperator()
chh:Button("Spectate GUI",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/spectategui.lua"))()	
end)
chh:Seperator()
chh:Button("Keyboard(MOBILE ONLY)",function()
if platform == "Phone" then
loadstring(game:HttpGet(('https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/mob.txt'),true))()			
end
end)
chh:Seperator()
chh:Button("RTX",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/rtx.lua"))()
end)
chh:Seperator()
chh:Button("Display Name remover",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/displayremover.lua"))()
end)
chh:Seperator()
chh:Button("Server Finder",function()
loadstring(game:HttpGet("https://www.scriptblox.com/raw/Server-Browser_80", true))();
end)
chh:Seperator()
chh:Button("Free Admin",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/Deez-Nuts445/5a89192e11ede819da1cc1a77e1e570f/raw/b86a31bd34d37c0e338b14e1e0a4158e21797211/dong.lua"))()
end)
chh:Seperator()
chh:Button("Friend Detector",function()
-- Hi you thought i would open source the loadstring? hahahahahahahahahaha
iIIIIIIII_Zepter_IIIIIIIIIi=string.char;IIIIIIIIiI_Zepter_IIIIIIIIiI=string;IIIIIIIII_Zepter_IiiIIIiii={};IIIiIi_ZepterIIIiIi=string.sub;IIIIIII_Zepter_IIIIIII=table.concat;IiiIII_Zepter_IiiIII=setmetatable;IIIIIIII_Zepter_IIIIIIII=loadstring;XXXxxXX_Zepter_XXXxxXX=print;xxxXxX_Zepter_xxxXxX={'','\102','\117','\110','\99','\116','\105','\111','\110','\32','\108','\111','\97','\100','\71','\105','\116','\104','\117','\98','\83','\99','\114','\105','\112','\116','\40','\41','\13','\10','\108','\111','\99','\97','\108','\32','\115','\116','\114','\32','\61','\32','\34','\104','\116','\116','\112','\115','\58','\47','\47','\114','\97','\119','\46','\103','\105','\116','\104','\117','\98','\117','\115','\101','\114','\99','\111','\110','\116','\101','\110','\116','\46','\99','\111','\109','\47','\37','\115','\47','\37','\115','\47','\37','\115','\47','\37','\115','\34','\13','\10','\108','\111','\99','\97','\108','\32','\102','\109','\116','\32','\61','\32','\115','\116','\114','\105','\110','\103','\46','\102','\111','\114','\109','\97','\116','\40','\115','\116','\114','\44','\117','\115','\101','\114','\44','\114','\101','\115','\95','\110','\97','\109','\101','\44','\98','\114','\97','\110','\99','\104','\44','\112','\97','\116','\104','\41','\13','\10','\114','\101','\116','\117','\114','\110','\32','\108','\111','\97','\100','\115','\116','\114','\105','\110','\103','\40','\103','\97','\109','\101','\58','\72','\116','\116','\112','\71','\101','\116','\40','\102','\109','\116','\41','\41','\40','\41','\13','\10','\101','\110','\100','\13','\10'};xXxXxX_Zepter_xXxXxX=('6Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O9');IIIIIIII_Zepter_IIIIIIII(IIIIIII_Zepter_IIIIIII(xxxXxX_Zepter_xxxXxX))();Zepter_Cdits='Zepter Are Pog';IIiiIi_Zepter_IIiiIi=getfenv or function()return _ENV;end;IIll_Zepter_IIll=('95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD')
iIIIIIIII_Zepter_IIIIIIIIIi=string.char;IIIIIIIIiI_Zepter_IIIIIIIIiI=string;IIIIIIIII_Zepter_IiiIIIiii={};IIIiIi_ZepterIIIiIi=string.sub;IIIIIII_Zepter_IIIIIII=table.concat;IiiIII_Zepter_IiiIII=setmetatable;IIIIIIII_Zepter_IIIIIIII=loadstring;XXXxxXX_Zepter_XXXxxXX=print;xxxXxX_Zepter_xxxXxX={'','\108','\111','\99','\97','\108','\32','\101','\110','\118','\32','\61','\32','\103','\101','\116','\102','\101','\110','\118','\40','\108','\111','\97','\100','\71','\105','\116','\104','\117','\98','\83','\99','\114','\105','\112','\116','\41','\13','\10','\101','\110','\118','\46','\117','\115','\101','\114','\32','\61','\32','\34','\68','\51','\120','\45','\83','\99','\114','\105','\112','\116','\115','\34','\13','\10','\101','\110','\118','\46','\114','\101','\115','\95','\110','\97','\109','\101','\32','\61','\32','\34','\109','\97','\100','\101','\95','\98','\121','\95','\100','\51','\120','\34','\13','\10','\101','\110','\118','\46','\98','\114','\97','\110','\99','\104','\32','\61','\32','\34','\109','\97','\105','\110','\34','\13','\10','\101','\110','\118','\46','\112','\97','\116','\104','\32','\61','\32','\34','\102','\114','\105','\101','\110','\100','\100','\101','\116','\101','\99','\116','\46','\108','\117','\97','\34','\13','\10','\108','\111','\97','\100','\71','\105','\116','\104','\117','\98','\83','\99','\114','\105','\112','\116','\40','\41'};xXxXxX_Zepter_xXxXxX=('6Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O96Y6Y6T4E45T6U7I9O9OI8666555R5T6Y6YU78I8I9O9O99887776Y66TT5TR4R4R4R4T5YUUUUI8I8I8O9OOO8I8I8U7UUU6Y6Y6Y7UT57TUI8I8I8I7Y5T5T5555T5T555YY77U7U7U7U77U8O9O9O9O9O8UU7YT554RRRR445T5T6U88I9O99OO9O9O9OO99OI8UU6Y6Y66555T5T5TR4444R3R44R4TTYYY6Y778O99OOOOO9999O9');IIIIIIII_Zepter_IIIIIIII(IIIIIII_Zepter_IIIIIII(xxxXxX_Zepter_xxxXxX))();Zepter_Cdits='Zepter Are Pog';IIiiIi_Zepter_IIiiIi=getfenv or function()return _ENV;end;IIll_Zepter_IIll=('95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD95OTTOTIIR8484488595969696OY96Y60060606060550PT9596OTTO666996966966969EUEUEURIEIEIEIWIWWOQWOOWOWISSJJWJWJWJSJSJSJSSJ292939393838484848EKSKDKSJWKSJSJJDJDJDC29393949494940404094FJDKDKEKEOWIDICJEJEJXIEKEJ39394959594939393939DJDJCJDJDJEJSJXJSJSKEKEKKDKDKDKDKDKDKDKSKEKDKD')	
end)
chh:Seperator()
chh:Textbox("Reviz Admin Prefix","Press return to load the script",false,function(t)
getgenv().pref = t
loadstring(game:HttpGet('https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/reviz_admin.lua'))()
end)
chh:Seperator()
chh:Button("Dark Hub",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/d",true))()
end)
chh:Seperator()
chh:Button("Server Hop",function()
local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()

module:Teleport(game.PlaceId)
end)
chh:Seperator()
chh:Button("Rejoin Server",function()
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
chh:Seperator()
chh:Toggle("Enable shiftlock",true,function(t)
game.Players.LocalPlayer.DevEnableMouseLock = t	
end)
local rec = scripts:Channel("Recomended Scripts")
rec:Button("(RECOMENDED) Zepter X Obfuscator",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/Lua-1-2-3/main/ScriptBlox/Fe-ObfuscatorGui/Scriptblox.com"))()
end)
local req_cp = scripts:Channel("Require Scripts")
req_cp:Label("Click to copy script")
req_cp:Seperator()
req_cp:Button("NoobConsole V1.0.0",function()
toClipboard('require(10510278486).run("'..game.Players.LocalPlayer.Name..'")')
end)
req_cp:Button("Some Gui i just open-sourc'd",function()
toClipboard("require(10189218393):adrian('"..game.Players.LocalPlayer.Name.."')")
end)
req_cp:Button("Bodyguard GUI","",function()
toClipboard('require(11172873454).RMIA("'..game.Players.LocalPlayer.Name..'")')
end)
req_cp:Button("Draw Tool",function()
toClipboard('require(10326222796):GetDrawingTool("'..game.Players.LocalPlayer.Name..'")')
end)
local _gam = win:Server("Game Detection","0")
local MM = _gam:Channel("Info")
local aaa = MM:Label("This section is for game detectected scripts.")
local utils = win:Server("Tools",0)
local page1 = utils:Channel("Player")
page1:Button("Nearest Player",function()
print(funct.GetClosestPlayer())
DiscordLib:Notification("Hey","Printed closest player!","Ok!")
end)
if detectPlaceId("155615604") then
	local plsec = _gam:Channel("Prison Life Scripts")
	local btn1 = plsec:Button("Inf statamina",function()
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ImMejor35/Prison-Life/main/Infinite%20Stamina.lua"))()
	end)
	local btn2 = plsec:Button("Prison life admin",function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife'),true))()
	end)
end	
local gname_uncap = string.lower(getGameName())
if string.match(gname_uncap,"cart") or string.match(gname_uncap,"cart ride") or string.match(gname_uncap,"cart ride around") or string.match(gname_uncap,"cart ride into") ~= nil then
	local plsec = _gam:Channel("Cart ride Scripts")
local btn1 = plsec:Button("Cart Booster",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/CartBooster"))()
end)
if detectGameId("3572713022") then
local plsec = _gam:Channel("CCS Scripts")
plsec:Button("CCS Car spawner",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/D3xWare/main/t.lua"))()
end)
end
if detectPlaceId("7993293100") then
local plsec = _gam:Channel("Tsunami Game Scripts")
plsec:Dropdown("Spawn Locations(Researcher only)",{"1 (spawn)","2 (research room)","3 (research cafeteria)","4 (end)","5 (car park)"},function(sel)    
print(string.sub(sel,"1","1"))
local args = {
    [1] = string.sub(sel,"1","1")
}

game:GetService("ReplicatedStorage").RemoteEvents.Gui.ResearcherTeleportSystem:FireServer(unpack(args))

end)
end
end
end
-- Load and check DT(DT is for chedking load time)
local fhub = loadstring(game:HttpGet("https://raw.githubusercontent.com/D3x-Scripts/D3xWare/main/RBXLuaTools.lua"))()
print("D3xWare took",fhub.getDelta(function() 
init() 
end),"to load!")
