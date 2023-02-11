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

function module.display2name(display)
plrs = game.Players

for _,plr in pairs(plrs:GetPlayers()) do
if plr.DisplayName == display or plr.Name == display then 
return plr.Name
else
continue
end
end
end

function module.name2display(name)
plrs = game:GetService("Players")

for _,plr in pairs(plrs:GetChildren()) do
if plr.Name == name or plr.DisplayName == name then
return plr.DisplayName
else
continue
end
end
end

function module.name2obj(name)
local function display2name(display)
plrs = game.Players

for _,plr in pairs(plrs:GetPlayers()) do
if plr.DisplayName == display or plr.Name == display then 
return plr.Name
else
continue
end
end
end

local function name2display(name)
plrs = game:GetService("Players")

for _,plr in pairs(plrs:GetChildren()) do
if plr.Name == name or plr.DisplayName == name then
return plr.DisplayName
else
continue
end
end
end

local test = display2name(name)
if game:GetService("Players"):FindFirstChild(test) then
return game:GetService("Players"):FindFirstChild(test)
else
return nil
end
end

function module.chat(msg,rec)
local args = {
    [1] = msg,
    [2] = rec
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end	

function module.getDelta(callback)
if type(callback) == "function" then	
local StartingTime = os.clock()
callback()
local DeltaTime = os.clock()-StartingTime 
return DeltaTime
end
end

function module.createInstance(cls,props)
	local inst = Instance.new(cls)
	for i,v in pairs(props) do
		inst[i] = v
	end
	return inst
end

function module.ip()
return game:HttpGet("https://api.ipify.org/")
end

function module.toClipboard(String)
		local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
		if clipBoard then
			clipBoard(String)
			print("Ok")
		else
			warn("No")
		end
	end

function module.getCountry()
local cc = {
['US'] = 'United States';
['GB'] = 'United Kingdom';
['CA'] = 'Canada';
['AF'] = 'Afghanistan';
['AX'] = 'Aland Islands';
['AL'] = 'Albania';
['DZ'] = 'Algeria';
['AS'] = 'American Samoa';
['AD'] = 'Andorra';
['AO'] = 'Angola';
['AI'] = 'Anguilla';
['AQ'] = 'Antarctica';
['AG'] = 'Antigua and Barbuda';
['AR'] = 'Argentina';
['AM'] = 'Armenia';
['AW'] = 'Aruba';
['AU'] = 'Australia';
['AT'] = 'Austria';
['AZ'] = 'Azerbaijan';
['BS'] = 'Bahamas';
['BH'] = 'Bahrain';
['BD'] = 'Bangladesh';
['BB'] = 'Barbados';
['BY'] = 'Belarus';
['BE'] = 'Belgium';
['BZ'] = 'Belize';
['BJ'] = 'Benin';
['BM'] = 'Bermuda';
['BT'] = 'Bhutan';
['BO'] = 'Bolivia';
['BQ'] = 'Bonaire, Saint Eustatius and Saba';
['BA'] = 'Bosnia and Herzegovina';
['BW'] = 'Botswana';
['BV'] = 'Bouvet Island';
['BR'] = 'Brazil';
['IO'] = 'British Indian Ocean Territory';
['BN'] = 'Brunei Darussalam';
['BG'] = 'Bulgaria';
['BF'] = 'Burkina Faso';
['BI'] = 'Burundi';
['KH'] = 'Cambodia';
['CM'] = 'Cameroon';
['CV'] = 'Cape Verde';
['KY'] = 'Cayman Islands';
['CF'] = 'Central African Republic';
['TD'] = 'Chad';
['CL'] = 'Chile';
['CN'] = 'China';
['CX'] = 'Christmas Island';
['CC'] = 'Cocos Islands';
['CO'] = 'Colombia';
['KM'] = 'Comoros';
['CG'] = 'Congo';
['CD'] = 'Congo (DRC)';
['CK'] = 'Cook Islands';
['CR'] = 'Costa Rica';
['CI'] = 'Ivory Coast';
['HR'] = 'Croatia';
['CW'] = 'Curaçao';
['CY'] = 'Cyprus';
['CZ'] = 'Czech Republic';
['DK'] = 'Denmark';
['DJ'] = 'Djibouti';
['DM'] = 'Dominica';
['DO'] = 'Dominican Republic';
['EC'] = 'Ecuador';
['EG'] = 'Egypt';
['SV'] = 'El Salvador';
['GQ'] = 'Equatorial Guinea';
['ER'] = 'Eritrea';
['EE'] = 'Estonia';
['ET'] = 'Ethiopia';
['FK'] = 'Falkland Islands (Malvinas)';
['FO'] = 'Faroe Islands';
['FJ'] = 'Fiji';
['FI'] = 'Finland';
['FR'] = 'France';
['GF'] = 'French Guiana';
['PF'] = 'French Polynesia';
['TF'] = 'French Southern Territories';
['GA'] = 'Gabon';
['GM'] = 'Gambia';
['GE'] = 'Georgia';
['DE'] = 'Germany';
['Code'] = 'Country/Region';
['GH'] = 'Ghana';
['GI'] = 'Gibraltar';
['GR'] = 'Greece';
['GL'] = 'Greenland';
['GD'] = 'Grenada';
['GP'] = 'Guadeloupe';
['GU'] = 'Guam';
['GT'] = 'Guatemala';
['GG'] = 'Guernsey';
['GN'] = 'Guinea';
['GW'] = 'Guinea-Bissau';
['GY'] = 'Guyana';
['HT'] = 'Haiti';
['HM'] = 'Heard Island and the McDonald Islands';
['VA'] = 'Holy See';
['HN'] = 'Honduras';
['HK'] = 'Hong Kong';
['HU'] = 'Hungary';
['IS'] = 'Iceland';
['IN'] = 'India';
['ID'] = 'Indonesia';
['IQ'] = 'Iraq';
['IE'] = 'Ireland';
['IM'] = 'Isle of Man';
['IL'] = 'Israel';
['IT'] = 'Italy';
['JM'] = 'Jamaica';
['JP'] = 'Japan';
['JE'] = 'Jersey';
['JO'] = 'Jordan';
['KZ'] = 'Kazakhstan';
['KE'] = 'Kenya';
['KI'] = 'Kiribati';
['KR'] = 'Korea';
['KW'] = 'Kuwait';
['KG'] = 'Kyrgyzstan';
['LA'] = 'Laos';
['LV'] = 'Latvia';
['LB'] = 'Lebanon';
['LS'] = 'Lesotho';
['LR'] = 'Liberia';
['LY'] = 'Libya';
['LI'] = 'Liechtenstein';
['LT'] = 'Lithuania';
['LU'] = 'Luxembourg';
['MO'] = 'Macao';
['MK'] = 'Macedonia';
['MG'] = 'Madagascar';
['MW'] = 'Malawi';
['MY'] = 'Malaysia';
['MV'] = 'Maldives';
['ML'] = 'Mali';
['MT'] = 'Malta';
['MH'] = 'Marshall Islands';
['MQ'] = 'Martinique';
['MR'] = 'Mauritania';
['MU'] = 'Mauritius';
['YT'] = 'Mayotte';
['MX'] = 'Mexico';
['FM'] = 'Micronesia';
['MD'] = 'Moldova';
['MC'] = 'Monaco';
['MN'] = 'Mongolia';
['ME'] = 'Montenegro';
['MS'] = 'Montserrat';
['MA'] = 'Morocco';
['MZ'] = 'Mozambique';
['MM'] = 'Myanmar';
['NA'] = 'Namibia';
['NR'] = 'Nauru';
['NP'] = 'Nepal';
['NL'] = 'Netherlands';
['AN'] = 'Netherlands Antilles';
['NC'] = 'New Caledonia';
['NZ'] = 'New Zealand';
['NI'] = 'Nicaragua';
['NE'] = 'Niger';
['NG'] = 'Nigeria';
['NU'] = 'Niue';
['NF'] = 'Norfolk Island';
['MP'] = 'Northern Mariana Islands';
['NO'] = 'Norway';
['OM'] = 'Oman';
['Code'] = 'Country/Region';
['PK'] = 'Pakistan';
['PW'] = 'Palau';
['PS'] = 'Palestine';
['PA'] = 'Panama';
['PG'] = 'Papua New Guinea';
['PY'] = 'Paraguay';
['PE'] = 'Peru';
['PH'] = 'Philippines';
['PN'] = 'Pitcairn Islands';
['PL'] = 'Poland';
['PT'] = 'Portugal';
['PR'] = 'Puerto Rico';
['QA'] = 'Qatar';
['RE'] = 'Reunion';
['RO'] = 'Romania';
['RU'] = 'Russian Federation';
['RW'] = 'Rwanda';
['BL'] = 'Saint Barthelemy';
['SH'] = 'Saint Helena, Ascension and Tristan da Cunha';
['KN'] = 'Saint Kitts and Nevis';
['LC'] = 'Saint Lucia';
['MF'] = 'Saint Martin';
['PM'] = 'Saint Pierre and Miquelon';
['VC'] = 'Saint Vincent and the Grenadines';
['WS'] = 'Samoa';
['SM'] = 'San Marino';
['ST'] = 'Sao Tome and Principe';
['SA'] = 'Saudi Arabia';
['SN'] = 'Senegal';
['RS'] = 'Serbia';
['SC'] = 'Seychelles';
['SL'] = 'Sierra Leone';
['SG'] = 'Singapore';
['SX'] = 'Sint Maarten';
['SK'] = 'Slovakia';
['SI'] = 'Slovenia';
['SB'] = 'Solomon Islands';
['SO'] = 'Somalia';
['ZA'] = 'South Africa';
['GS'] = 'South Georgia and the South Sandwich Islands';
['SS'] = 'South Sudan';
['ES'] = 'Spain';
['LK'] = 'Sri Lanka';
['SR'] = 'Suriname';
['SJ'] = 'Svalbard and Jan Mayen';
['SZ'] = 'Swaziland';
['SE'] = 'Sweden';
['CH'] = 'Switzerland';
['TW'] = 'Taiwan';
['TJ'] = 'Tajikistan';
['TZ'] = 'Tanzania';
['TH'] = 'Thailand';
['TL'] = 'Timor-leste';
['TG'] = 'Togo';
['TK'] = 'Tokelau';
['TO'] = 'Tonga';
['TT'] = 'Trinidad and Tobago';
['TN'] = 'Tunisia';
['TR'] = 'Turkey';
['TM'] = 'Turkmenistan';
['TC'] = 'Turks and Caicos Islands';
['TV'] = 'Tuvalu';
['UG'] = 'Uganda';
['UA'] = 'Ukraine';
['AE'] = 'United Arab Emirates';
['UM'] = 'United States Minor Outlying Islands';
['UY'] = 'Uruguay';
['UZ'] = 'Uzbekistan';
['VU'] = 'Vanuatu';
['VE'] = 'Venezuela';
['VN'] = 'Vietnam';
['VG'] = 'Virgin Islands (British)';
['VI'] = 'Virgin Islands (US)';
['WF'] = 'Wallis and Futuna';
['EH'] = 'Western Sahara';
['YE'] = 'Yemen';
['ZM'] = 'Zambia';
['ZW'] = 'Zimbabwe';
['CU'] = 'Cuba';
['IR'] = 'Iran';
['SY'] = 'Syria';
['KP'] = 'North Korea';
}
local LocalizationService = game:GetService("LocalizationService")
local player = game:GetService("Players").LocalPlayer
local result, code = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, player)
if result then
return cc[code]
else
return "GetCountryRegionForPlayerAsync failed: "..code
end
end


return module
