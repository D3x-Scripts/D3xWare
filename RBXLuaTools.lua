--[[

File name: RBXLuaTools.lua
File Description: tools for exploiting.

]]--

local module = {}

function module.services()
local Services = setmetatable({},{
	__index = function(self, ind)
		if ypcall(function()game:GetService(ind)end) then
			return game:GetService(ind)
		else
			return nil
		end
	end
})
return Services
end

function module.firebutton(button)
    if button ~= nil then
       for i,signal in pairs(getconnections(button.MouseButton1Click)) do
           signal:Fire()
       end
       for i,signal in pairs(getconnections(button.MouseButton1Down)) do
           signal:Fire()
       end
       for i,signal in pairs(getconnections(button.Activated)) do
           signal:Fire()
       end
    end
end

function module.checkDate(mth,day)
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

function module.getplatform()
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

function module.randomString(len)
	local length = len
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local o = loadstring(game:HttpGet("https://raw.githubusercontent.com/Deez-Nuts445/GHSandbox_LUA_1/main/factorial_functions.lua"))()

function module.fact(n)
return o.fact(tonumber(n))
end

function module.unfact(n)
return o.unfact(tonumber(n))
end

function module.getTable(arg)
local returned = {}
local args = {
    [1] = arg
}
if type(args[1]) == "table" then
for i,v in pairs(args[1]) do
table.insert(returned,v)
end
end
end


return module
