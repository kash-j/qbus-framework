QBShared = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

QBShared.RandomStr = function(length)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return QBShared.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

QBShared.RandomInt = function(length)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return QBShared.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

QBShared.SplitStr = function(str, delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( str, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( str, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( str, delimiter, from  )
	end
	table.insert( result, string.sub( str, from  ) )
	return result
end

QBShared.Items = {
	-- // WEAPONS
	["weapon_unarmed"] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Handen", 					["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_knife"] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Mes", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "knife.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_nightstick"] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Wapenstok", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "nightstick.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_hammer"] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Hamer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_bat"] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Knuppel", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "baseballbat.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_golfclub"] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Golfclub", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_crowbar"] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Breekijzer", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_pistol"] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Pistol", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "pistol.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_combatpistol"] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Combat Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "combatpistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_appistol"] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "AP Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_pistol50"] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistol .50 Cal", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_microsmg"] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "microsmg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_smg"] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "SMG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "smg.png", 				["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_assaultsmg"] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "Assault SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_assaultrifle"] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Assault Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "assaultrifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_carbinerifle"] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "Carbine Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "carbinerifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_advancedrifle"] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Advanced Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_mg"] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Machinegun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_combatmg"] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "Combat MG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_pumpshotgun"] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "Pump Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "pumpshotgun.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_sawnoffshotgun"] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Sawn-off Shotgun", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "sawoffshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_assaultshotgun"] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Assault Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_bullpupshotgun"] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Bullpup Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_stungun"] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "stungun.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_sniperrifle"] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Sniper Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_heavysniper"] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Heavy Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_remotesniper"] 		 = {["name"] = "weapon_remotesniper", 	 	  	["label"] = "Remote Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER_REMOTE",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_grenadelauncher"] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Grenade Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_grenadelauncher_smoke"] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Smoke Grenade Launcher", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_rpg"] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RPG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_minigun"] 				 = {["name"] = "weapon_minigun", 		      	["label"] = "Minigun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MINIGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_grenade"] 				 = {["name"] = "weapon_grenade", 		      	["label"] = "Grenade", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_stickybomb"] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_smokegrenade"] 		 = {["name"] = "weapon_smokegrenade", 	      	["label"] = "Rookbom", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_bzgas"] 				 = {["name"] = "weapon_bzgas", 			      	["label"] = "BZ Gas", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_molotov"] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_fireextinguisher"] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Brandblusser", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_petrolcan"] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Benzineblik", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN",		["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_briefcase"] 			 = {["name"] = "weapon_briefcase", 		 	  	["label"] = "Koffer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_briefcase_02"] 		 = {["name"] = "weapon_briefcase_02", 	 	  	["label"] = "Koffer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_ball"] 				 = {["name"] = "weapon_ball", 			 	  	["label"] = "Bal", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_BALL",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_flare"] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Flare pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_snspistol"] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "SNS Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_bottle"] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Gebroken fles", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_gusenberg"] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson MG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_specialcarbine"] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Special Carbine", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_heavypistol"] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Heavy Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_bullpuprifle"] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Bullpup Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_dagger"] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Dagger", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_vintagepistol"] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Vintage Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_firework"] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Firework Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_musket"] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Musket", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_heavyshotgun"] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Heavy Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_marksmanrifle"] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Marksman Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_hominglauncher"] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Homing Launcher", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_proxmine"] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Proxmine Grenade", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_snowball"] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Sneeuwbal", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_flaregun"] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Flare Gun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_garbagebag"] 			 = {["name"] = "weapon_garbagebag", 		 	["label"] = "Vuilniszak", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_handcuffs"] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Handboeien", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_combatpdw"] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "Combat PDW", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_marksmanpistol"] 		 = {["name"] = "weapon_marksmanpistol", 	 	["label"] = "Marksman Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_knuckle"] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Boksbeugel", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_hatchet"] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hakbijl", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_railgun"] 				 = {["name"] = "weapon_railgun", 		 	  	["label"] = "Railgun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_machete"] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_machinepistol"] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec-9", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "tec9.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_switchblade"] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Switchblade", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_revolver"] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_dbshotgun"] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "Double-barrel Shotgun", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_compactrifle"] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Compact Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_autoshotgun"] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Auto Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_battleaxe"] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Battle Axe", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_compactlauncher"] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Compact Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_minismg"] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_pipebomb"] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe bom", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_poolcue"] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Poolcue", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	["weapon_wrench"] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Moersleutel", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	-- // ITEMS //
	["id_card"] 					 = {["name"] = "id_card", 			 	  	  	["label"] = "Identiteitskaart", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "id_card.png", 			["unique"] = true, 		["useable"] = true, 	["description"] = "This is a placeholder description"},
	["driver_license"] 				 = {["name"] = "driver_license", 			  	["label"] = "Rijbewijs", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = true, 	["description"] = "This is a placeholder description"},
	["tosti"] 						 = {["name"] = "tosti", 			 	  	  	["label"] = "Tosti", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "tosti.png", 			["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["water_bottle"] 				 = {["name"] = "water_bottle", 			  	  	["label"] = "Flesje water 500ml", 		["weight"] = 500, 		["type"] = "item", 		["image"] = "placeholder.png", 		["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["joint"] 						 = {["name"] = "joint", 			  	  		["label"] = "Joint", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "joint.png", 			["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["plastic"] 					 = {["name"] = "plastic", 			  	  	  	["label"] = "Plastic", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "placeholder.png", 		["unique"] = false, 	["useable"] = false, 	["description"] = "This is a placeholder description"},
	["metalscrap"] 					 = {["name"] = "metalscrap", 			  	  	["label"] = "Metaalschoot", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "metalscrap.png", 		["unique"] = false, 	["useable"] = false, 	["description"] = "This is a placeholder description"},
	["copper"] 					 	 = {["name"] = "copper", 			  	  		["label"] = "Koper", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "copper.png", 			["unique"] = false, 	["useable"] = false, 	["description"] = "This is a placeholder description"},
	["pistol_ammo"] 				 = {["name"] = "pistol_ammo", 			  	  	["label"] = "Pistol munitie (15)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistol_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["rifle_ammo"] 				 	 = {["name"] = "rifle_ammo", 			  	  	["label"] = "Rifle munitie (30)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["smg_ammo"] 				 	 = {["name"] = "smg_ammo", 			  	  		["label"] = "SMG munitie (20)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["shotgun_ammo"] 				 = {["name"] = "shotgun_ammo", 			  	  	["label"] = "Shotgun munitie (10)", 	["weight"] = 1000, 		["type"] = "item", 		["image"] = "shotgun_ammo.png", 	["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["mg_ammo"] 				 	 = {["name"] = "mg_ammo", 			  	  		["label"] = "MG munitie (30)", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "mg_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["lockpick"] 					 = {["name"] = "lockpick", 			 	  	  	["label"] = "Lockpick", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "lockpick.png", 		["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
	["repairkit"] 					 = {["name"] = "repairkit", 			 	  	["label"] = "Reperatieset", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "repairkit.png", 		["unique"] = false, 	["useable"] = true, 	["description"] = "This is a placeholder description"},
}

-- // HASH WEAPON ITEMS, NEED SOMETIMES TO GET INFO FOR CLIENT

QBShared.Weapons = {
	-- // WEAPONS
	[GetHashKey("weapon_unarmed")] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Handen", 					["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_knife")] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Mes", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_nightstick")] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Nightstick", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_hammer")] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Hamer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_bat")] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Knuppel", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_golfclub")] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Golfclub", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_crowbar")] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Breekijzer", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_pistol")] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Pistol", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_combatpistol")] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Combat Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "combatpistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_appistol")] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "AP Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_pistol50")] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistol .50 Cal", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_microsmg")] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_smg")] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "SMG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_assaultsmg")] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "Assault SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_assaultrifle")] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Assault Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_carbinerifle")] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "Carbine Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "carbinerifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_advancedrifle")] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Advanced Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_mg")] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Machinegun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_combatmg")] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "Combat MG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_pumpshotgun")] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "Pump Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_sawnoffshotgun")] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Sawn-off Shotgun", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_assaultshotgun")] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Assault Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_bullpupshotgun")] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Bullpup Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_stungun")] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_sniperrifle")] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Sniper Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_heavysniper")] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Heavy Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_remotesniper")] 		 = {["name"] = "weapon_remotesniper", 	 	  	["label"] = "Remote Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER_REMOTE",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_grenadelauncher")] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Grenade Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_grenadelauncher_smoke")] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Smoke Grenade Launcher", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_rpg")] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RPG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_minigun")] 				 = {["name"] = "weapon_minigun", 		      	["label"] = "Minigun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MINIGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_grenade")] 				 = {["name"] = "weapon_grenade", 		      	["label"] = "Grenade", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_stickybomb")] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_smokegrenade")] 		 = {["name"] = "weapon_smokegrenade", 	      	["label"] = "Rookbom", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_bzgas")] 				 = {["name"] = "weapon_bzgas", 			      	["label"] = "BZ Gas", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_molotov")] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_fireextinguisher")] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Brandblusser", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_petrolcan")] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Benzineblik", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN",		["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_briefcase")] 			 = {["name"] = "weapon_briefcase", 		 	  	["label"] = "Koffer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_briefcase_02")] 		 = {["name"] = "weapon_briefcase_02", 	 	  	["label"] = "Koffer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_ball")] 				 = {["name"] = "weapon_ball", 			 	  	["label"] = "Bal", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_BALL",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_flare")] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Flare pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_snspistol")] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "SNS Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_bottle")] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Gebroken fles", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_gusenberg")] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson SMG", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_specialcarbine")] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Special Carbine", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_heavypistol")] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Heavy Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_bullpuprifle")] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Bullpup Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_dagger")] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Dagger", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_vintagepistol")] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Vintage Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_firework")] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Firework Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_musket")] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Musket", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_heavyshotgun")] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Heavy Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_marksmanrifle")] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Marksman Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_hominglauncher")] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Homing Launcher", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_proxmine")] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Proxmine Grenade", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_snowball")] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Sneeuwbal", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_flaregun")] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Flare Gun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_garbagebag")] 			 = {["name"] = "weapon_garbagebag", 		 	["label"] = "Vuilniszak", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_handcuffs")] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Handboeien", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_combatpdw")] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "Combat PDW", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_marksmanpistol")] 		 = {["name"] = "weapon_marksmanpistol", 	 	["label"] = "Marksman Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_knuckle")] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Boksbeugel", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_hatchet")] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hakbijl", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_railgun")] 				 = {["name"] = "weapon_railgun", 		 	  	["label"] = "Railgun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_machete")] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_machinepistol")] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec-9", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_switchblade")] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Switchblade", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_revolver")] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_dbshotgun")] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "Double-barrel Shotgun", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_compactrifle")] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Compact Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_autoshotgun")] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Auto Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_battleaxe")] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Battle Axe", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_compactlauncher")] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Compact Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_minismg")] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_pipebomb")] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe bom", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_poolcue")] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Poolcue", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[GetHashKey("weapon_wrench")] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Moersleutel", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
}

-- // VEHICLES
QBShared.Vehicles = {
	["blade"] = {
		["name"] = "Blade",
		["brand"] = "Vapid",
		["model"] = "blade",
		["price"] = 19000,
		["category"] = "muscle",
		["hash"] = "-1205801634",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f3/Blade-GTAV-front.png"
	},
	["buccaneer"] = {
		["name"] = "Buccaneer",
		["brand"] = "Albany",
		["model"] = "buccaneer",
		["price"] = 19500,
		["category"] = "muscle",
		["hash"] = "-682211828",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9f/Buccaneer-GTAV-front.png"
	},
	["buccaneer2"] = {
		["name"] = "Buccaneer Rider",
		["brand"] = "Albany",
		["model"] = "buccaneer2",
		["price"] = 22500,
		["category"] = "muscle",
		["hash"] = "-1013450936",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a2/BuccaneerCustom-GTAO-front.png"
	},
	["chino"] = {
		["name"] = "Chino",
		["brand"] = "Vapid",
		["model"] = "chino",
		["price"] = 20000,
		["category"] = "muscle",
		["hash"] = "349605904",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/17/Chino-GTAV-front.png"
	},
	["chino2"] = {
		["name"] = "Chino Luxe",
		["brand"] = "Vapid",
		["model"] = "chino2",
		["price"] = 35000,
		["category"] = "muscle",
		["hash"] = "-1361687965",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3f/ChinoCustom-GTAO-front.png"
	},
	["coquette3"] = {
		["name"] = "Coquette BlackFin",
		["brand"] = "Invetero",
		["model"] = "coquette3",
		["price"] = 45000,
		["category"] = "muscle",
		["hash"] = "784565758",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/df/CoquetteBlackFin-GTAV-front.png"
	},
	["dominator"] = {
		["name"] = "Dominator",
		["brand"] = "Vapid",
		["model"] = "dominator",
		["price"] = 53000,
		["category"] = "muscle",
		["hash"] = "80636076",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/78/Dominator-GTAV-front.png"
	},
	["dukes"] = {
		["name"] = "Dukes",
		["brand"] = "Imponte",
		["model"] = "dukes",
		["price"] = 15000,
		["category"] = "muscle",
		["hash"] = "723973206",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Dukes-GTAV-front.png"
	},
	["gauntlet"] = {
		["name"] = "Gauntlet",
		["brand"] = "Bravado",
		["model"] = "gauntlet",
		["price"] = 39500,
		["category"] = "muscle",
		["hash"] = "-1800170043",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/dd/Gauntlet-GTAV-front.png"
	},
	["muscle"] = {
		["name"] = "Hotknife",
		["brand"] = "Vapid",
		["model"] = "hotknife",
		["price"] = 95000,
		["category"] = "muscle",
		["hash"] = "37348240",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Hotknife-GTAV-front.png"
	},
	["faction"] = {
		["name"] = "Faction",
		["brand"] = "Willard",
		["model"] = "faction",
		["price"] = 20000,
		["category"] = "muscle",
		["hash"] = "-2119578145",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Faction-GTAO-front.png"
	},
	["faction2"] = {
		["name"] = "Faction Rider",
		["brand"] = "Willard",
		["model"] = "faction2",
		["price"] = 22500,
		["category"] = "muscle",
		["hash"] = "-1790546981",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f0/FactionCustom-GTAO-front.png"
	},
	["nightshade"] = {
		["name"] = "Nightshade",
		["brand"] = "Imponte",
		["model"] = "nightshade",
		["price"] = 84000,
		["category"] = "muscle",
		["hash"] = "-1943285540",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3e/Nightshade-GTAO-front.png"
	},
	["phoenix"] = {
		["name"] = "Phoenix",
		["brand"] = "Imponte",
		["model"] = "phoenix",
		["price"] = 25000,
		["category"] = "muscle",
		["hash"] = "-2095439403",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/af/Phoenix-GTAV-front.png"
	},
	["picador"] = {
		["name"] = "Picador",
		["brand"] = "Cheval",
		["model"] = "picador",
		["price"] = 18000,
		["category"] = "muscle",
		["hash"] = "1507916787",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5a/Picador-GTAV-front.png"
	},
	["sabregt"] = {
		["name"] = "Sabre Turbo",
		["brand"] = "Declasse",
		["model"] = "sabregt",
		["price"] = 25000,
		["category"] = "muscle",
		["hash"] = "-1685021548",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e6/SabreTurbo-GTAV-front.png"
	},
	["sabregt2"] = {
		["name"] = "Sabre GT",
		["brand"] = "Declasse",
		["model"] = "sabregt2",
		["price"] = 29500,
		["category"] = "muscle",
		["hash"] = "223258115",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/18/SabreTurboCustom-GTAO-front.png"
	},
	["slamvan3"] = {
		["name"] = "Slam Van",
		["brand"] = "Vapid",
		["model"] = "slamvan3",
		["price"] = 35000,
		["category"] = "muscle",
		["hash"] = "1119641113",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/96/SlamvanCustom-GTAO-front.png"
	},
	["tampa"] = {
		["name"] = "Tampa",
		["brand"] = "Declasse",
		["model"] = "tampa",
		["price"] = 27500,
		["category"] = "muscle",
		["hash"] = "972671128",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d8/Tampa-GTAO-front.png"
	},
	["virgo"] = {
		["name"] = "Virgo",
		["brand"] = "Albany",
		["model"] = "virgo",
		["price"] = 19700,
		["category"] = "muscle",
		["hash"] = "-498054846",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/24/Virgo-GTAV-front.png"
	},
	["vigero"] = {
		["name"] = "Vigero",
		["brand"] = "Declasse",
		["model"] = "vigero",
		["price"] = 16500,
		["category"] = "muscle",
		["hash"] = "-825837129",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c4/Vigero-GTAV-front.png"
	},
	["voodoo"] = {
		["name"] = "Voodoo",
		["brand"] = "Declasse",
		["model"] = "voodoo",
		["price"] = 21000,
		["category"] = "muscle",
		["hash"] = "523724515",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fc/VoodooCustom-GTAO-front.png"
	},
	["blista"] = {
		["name"] = "Blista",
		["brand"] = "Dinka",
		["model"] = "blista",
		["price"] = 8000,
		["category"] = "compacts",
		["hash"] = "-344943009",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c0/Blista-GTAV-front.png"
	},
	["brioso"] = {
		["name"] = "Brioso R/A",
		["brand"] = "Grotti",
		["model"] = "brioso",
		["price"] = 14500,
		["category"] = "compacts",
		["hash"] = "1549126457",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/BriosoRA-GTAO-front.png"
	},
	["issi2"] = {
		["name"] = "Issi",
		["brand"] = "Weeny",
		["model"] = "issi2",
		["price"] = 12000,
		["category"] = "compacts",
		["hash"] = "-1177863319",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9c/IssiDown-GTAV-front.png"
	},
	["panto"] = {
		["name"] = "Panto",
		["brand"] = "Benefactor",
		["model"] = "panto",
		["price"] = 8500,
		["category"] = "compacts",
		["hash"] = "-431692672",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/ad/Panto-GTAV-front.png"
	},
	["prairie"] = {
		["name"] = "Prairie",
		["brand"] = "Bollokan",
		["model"] = "prairie",
		["price"] = 15000,
		["category"] = "compacts",
		["hash"] = "-1450650718",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/06/Prairie-GTAV-front.png"
	},
	["bison"] = {
		["name"] = "Bison",
		["brand"] = "Bravado",
		["model"] = "bison",
		["price"] = 34000,
		["category"] = "vans",
		["hash"] = "-16948145",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/69/Bison-GTAV-front.png"
	},
	["bobcatxl"] = {
		["name"] = "Bobcat XL",
		["brand"] = "Vapid",
		["model"] = "bobcatxl",
		["price"] = 23000,
		["category"] = "vans",
		["hash"] = "1069929536",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/37/BobcatXL-GTAV-front.png"
	},
	["burrito3"] = {
		["name"] = "Burrito",
		["brand"] = "Declasse",
		["model"] = "burrito3",
		["price"] = 38500,
		["category"] = "vans",
		["hash"] = "-1743316013",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/Burrito3-GTAV-front.png"
	},
	["gburrito2"] = {
		["name"] = "Burrito Custom",
		["brand"] = "Declasse",
		["model"] = "gburrito2",
		["price"] = 65000,
		["category"] = "vans",
		["hash"] = "296357396",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4f/GangBurrito2-GTAO-front.png"
	},
	["moonbeam"] = {
		["name"] = "Moonbeam",
		["brand"] = "Declasse",
		["model"] = "moonbeam",
		["price"] = 29500,
		["category"] = "vans",
		["hash"] = "525509695",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b3/Moonbeam-GTAO-front.png"
	},
	["rumpo"] = {
		["name"] = "Rumpo",
		["brand"] = "Bravado",
		["model"] = "rumpo",
		["price"] = 30000,
		["category"] = "vans",
		["hash"] = "1162065741",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d3/Rumpo-GTAV-front.png"
	},
	["asea"] = {
		["name"] = "Asea",
		["brand"] = "Declasse",
		["model"] = "asea",
		["price"] = 13000,
		["category"] = "sedans",
		["hash"] = "-1809822327",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/58/Asea-GTAV-front.png"
	},
	["cognoscenti"] = {
		["name"] = "Cognoscenti",
		["brand"] = "Enus",
		["model"] = "cognoscenti",
		["price"] = 40000,
		["category"] = "sedans",
		["hash"] = "-2030171296",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Cognoscenti-GTAO-front.png"
	},
	["emperor"] = {
		["name"] = "Emperor",
		["brand"] = "Albany",
		["model"] = "emperor",
		["price"] = 14500,
		["category"] = "sedans",
		["hash"] = "-685276541",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4c/Emperor-GTAV-front.png"
	},
	["fugitive"] = {
		["name"] = "Fugitive",
		["brand"] = "Cheval",
		["model"] = "fugitive",
		["price"] = 22500,
		["category"] = "sedans",
		["hash"] = "1909141499",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5c/Fugitive-GTAV-front.png"
	},
	["glendale"] = {
		["name"] = "Glendale",
		["brand"] = "Benefactor",
		["model"] = "glendale",
		["price"] = 11500,
		["category"] = "sedans",
		["hash"] = "75131841",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Glendale-GTAV-front.png"
	},
	["intruder"] = {
		["name"] = "Intruder",
		["brand"] = "Karin",
		["model"] = "intruder",
		["price"] = 15000,
		["category"] = "sedans",
		["hash"] = "886934177",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7c/Intruder-GTAV-front.png"
	},
	["premier"] = {
		["name"] = "Premier",
		["brand"] = "Declasse",
		["model"] = "premier",
		["price"] = 16500,
		["category"] = "sedans",
		["hash"] = "-1883869285",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/Premier-GTAV-front.png"
	},
	["primo2"] = {
		["name"] = "Primo Custom",
		["brand"] = "Albany",
		["model"] = "primo2",
		["price"] = 14500,
		["category"] = "sedans",
		["hash"] = "-2040426790",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/PrimoCustom-GTAO-front.png"
	},
	["regina"] = {
		["name"] = "Regina",
		["brand"] = "Dundreary",
		["model"] = "regina",
		["price"] = 10000,
		["category"] = "sedans",
		["hash"] = "-14495224",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/71/Regina-GTAV-front.png"
	},
	["schafter2"] = {
		["name"] = "Schafter",
		["brand"] = "Benefactor",
		["model"] = "schafter2",
		["price"] = 32000,
		["category"] = "sedans",
		["hash"] = "-1255452397",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/57/Schafter-GTAV-front.png"
	},
	["superd"] = {
		["name"] = "Super Diamond",
		["brand"] = "Enus",
		["model"] = "superd",
		["price"] = 108000,
		["category"] = "sedans",
		["hash"] = "1123216662",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d8/SuperDiamond-GTAV-front.png"
	},
	["tailgater"] = {
		["name"] = "Tailgater",
		["brand"] = "Obey",
		["model"] = "tailgater",
		["price"] = 45000,
		["category"] = "sedans",
		["hash"] = "-1008861746",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e1/Tailgater-GTAV-front.png"
	},
	["washington"] = {
		["name"] = "Washington",
		["brand"] = "Albany",
		["model"] = "washington",
		["price"] = 19000,
		["category"] = "sedans",
		["hash"] = "1777363799",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/12/Washington-GTAV-front.png"
	},
	["baller2"] = {
		["name"] = "Baller",
		["brand"] = "Gallivanter",
		["model"] = "baller2",
		["price"] = 79000,
		["category"] = "suvs",
		["hash"] = "142944341",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/ef/Baller2-GTAV-front.png"
	},
	["baller3"] = {
		["name"] = "Baller LE",
		["brand"] = "Gallivanter",
		["model"] = "baller3",
		["price"] = 90000,
		["category"] = "suvs",
		["hash"] = "1878062887",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/71/BallerLE-GTAO-front.png"
	},
	["cavalcade2"] = {
		["name"] = "Cavalcade",
		["brand"] = "Albany",
		["model"] = "cavalcade2",
		["price"] = 45000,
		["category"] = "suvs",
		["hash"] = "-789894171",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/08/Cavalcade2-GTAV-front.png"
	},
	["dubsta2"] = {
		["name"] = "Dubsta Luxuary",
		["brand"] = "Benefactor",
		["model"] = "dubsta2",
		["price"] = 165000,
		["category"] = "suvs",
		["hash"] = "-394074634",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fa/Dubsta2-GTAV-front.png"
	},
	["fq2"] = {
		["name"] = "FQ2",
		["brand"] = "Fathom",
		["model"] = "fq2",
		["price"] = 38000,
		["category"] = "suvs",
		["hash"] = "-1137532101",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6e/FQ2-GTAV-front.png"
	},
	["granger"] = {
		["name"] = "Granger",
		["brand"] = "Declasse",
		["model"] = "granger",
		["price"] = 43500,
		["category"] = "suvs",
		["hash"] = "-1775728740",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Granger-GTAV-front.png"
	},
	["gresley"] = {
		["name"] = "Gresley",
		["brand"] = "Bravado",
		["model"] = "gresley",
		["price"] = 47000,
		["category"] = "suvs",
		["hash"] = "-1543762099",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Gresley-GTAV-front.png"
	},
	["huntley"] = {
		["name"] = "Huntley S",
		["brand"] = "Enus",
		["model"] = "huntley",
		["price"] = 85000,
		["category"] = "suvs",
		["hash"] = "486987393",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2f/HuntleyS-GTAV-front.png"
	},
	["landstalker"] = {
		["name"] = "Landstalker",
		["brand"] = "Dundreary",
		["model"] = "landstalker",
		["price"] = 27000,
		["category"] = "suvs",
		["hash"] = "1269098716",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/77/Landstalker-GTAV-front.png"
	},
	["patriot"] = {
		["name"] = "Patriot",
		["brand"] = "Mammoth",
		["model"] = "patriot",
		["price"] = 32000,
		["category"] = "suvs",
		["hash"] = "-808457413",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/90/Patriot-GTAV-front.PNG"
	},
	["radi"] = {
		["name"] = "Radius",
		["brand"] = "Vapid",
		["model"] = "radi",
		["price"] = 24000,
		["category"] = "suvs",
		["hash"] = "-1651067813",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b6/Radius-GTAV-front.png"
	},
	["rocoto"] = {
		["name"] = "Rocoto",
		["brand"] = "Obey",
		["model"] = "rocoto",
		["price"] = 48500,
		["category"] = "suvs",
		["hash"] = "2136773105",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/28/Rocoto-GTAV-front.png"
	},
	["seminole"] = {
		["name"] = "Seminole",
		["brand"] = "Canis",
		["model"] = "seminole",
		["price"] = 29500,
		["category"] = "suvs",
		["hash"] = "1221512915",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/Seminole-GTAV-front.png"
	},
	["xls"] = {
		["name"] = "XLS",
		["brand"] = "Benefactor",
		["model"] = "xls",
		["price"] = 75000,
		["category"] = "suvs",
		["hash"] = "1203490606",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/XLS-GTAO-front.png"
	},
	["btype"] = {
		["name"] = "Roosevelt",
		["brand"] = "Albany",
		["model"] = "btype",
		["price"] = 325000,
		["category"] = "sportsclassics",
		["hash"] = "117401876",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/Roosevelt-GTAV-front.png"
	},
	["btype3"] = {
		["name"] = "Roosevelt Valor",
		["brand"] = "Albany",
		["model"] = "btype3",
		["price"] = 375000,
		["category"] = "sportsclassics",
		["hash"] = "-602287871",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2a/RooseveltValor-GTAO-front.png"
	},
	["btype2"] = {
		["name"] = "Franken Stange",
		["brand"] = "Albany",
		["model"] = "btype2",
		["price"] = 350000,
		["category"] = "sportsclassics",
		["hash"] = "-831834716",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/63/FränkenStange-GTAV-front.png"
	},
	["casco"] = {
		["name"] = "Casco",
		["brand"] = "Lampadati",
		["model"] = "casco",
		["price"] = 102000,
		["category"] = "sportsclassics",
		["hash"] = "941800958",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/86/Casco-GTAO-front.png"
	},
	["coquette2"] = {
		["name"] = "Coquette Classic",
		["brand"] = "Invetero",
		["model"] = "coquette2",
		["price"] = 125000,
		["category"] = "sportsclassics",
		["hash"] = "1011753235",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0b/CoquetteClassic-GTAV-front.png"
	},
	["monroe"] = {
		["name"] = "Monroe",
		["brand"] = "Pegassi",
		["model"] = "monroe",
		["price"] = 98500,
		["category"] = "sportsclassics",
		["hash"] = "-433375717",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/44/Monroe-GTAV-front.png"
	},
	["pigalle"] = {
		["name"] = "Pigalle",
		["brand"] = "Lampadati",
		["model"] = "pigalle",
		["price"] = 135000,
		["category"] = "sportsclassics",
		["hash"] = "1078682497",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d4/Pigalle-GTAV-front.png"
	},
	["stingergt"] = {
		["name"] = "Stinger GT",
		["brand"] = "Grotti",
		["model"] = "stingergt",
		["price"] = 184000,
		["category"] = "sportsclassics",
		["hash"] = "-2098947590",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c5/StingerGT-GTAO-front.png"
	},
	["feltzer3"] = {
		["name"] = "Stirling GT",
		["brand"] = "Benefactor",
		["model"] = "feltzer3",
		["price"] = 195000,
		["category"] = "sportsclassics",
		["hash"] = "-1566741232",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d2/StirlingGT-GTAV-front.png"
	},
	["ztype"] = {
		["name"] = "Z-Type",
		["brand"] = "Truffade",
		["model"] = "ztype",
		["price"] = 2500000,
		["category"] = "sportsclassics",
		["hash"] = "758895617",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9d/Z-Type-GTAV-front.png"
	},
	["coupes"] = {
		["name"] = "Cognoscenti Cabrio",
		["brand"] = "Enus",
		["model"] = "cogcabrio",
		["price"] = 45500,
		["category"] = "coupes",
		["hash"] = "330661258",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/28/CognoscentiCabrioUp-GTAV-front.png"
	},
	["exemplar"] = {
		["name"] = "Exemplar",
		["brand"] = "Dewbauchee",
		["model"] = "exemplar",
		["price"] = 65000,
		["category"] = "coupes",
		["hash"] = "-5153954",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Exemplar-GTAV-front.png"
	},
	["f620"] = {
		["name"] = "F620",
		["brand"] = "Ocelot",
		["model"] = "f620",
		["price"] = 37500,
		["category"] = "coupes",
		["hash"] = "-591610296",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f8/F620-GTAV-front.png"
	},
	["felon"] = {
		["name"] = "Felon",
		["brand"] = "Lampadati",
		["model"] = "felon",
		["price"] = 31000,
		["category"] = "coupes",
		["hash"] = "-391594584",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Felon-GTAV-front.png"
	},
	["felon2"] = {
		["name"] = "Felon GT",
		["brand"] = "Lampadati",
		["model"] = "felon2",
		["price"] = 37000,
		["category"] = "coupes",
		["hash"] = "-89291282",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0f/FelonGTDown-GTAV-front.png"
	},
	["jackal"] = {
		["name"] = "Jackal",
		["brand"] = "Ocelot",
		["model"] = "jackal",
		["price"] = 29000,
		["category"] = "coupes",
		["hash"] = "-624529134",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/48/Jackal-GTAV-front.png"
	},
	["oracle2"] = {
		["name"] = "Oracle XS",
		["brand"] = "Übermacht",
		["model"] = "oracle2",
		["price"] = 28000,
		["category"] = "coupes",
		["hash"] = "-511601230",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/22/OracleXS-GTAV-front.png"
	},
	["sentinel"] = {
		["name"] = "Sentinel",
		["brand"] = "Übermacht",
		["model"] = "sentinel",
		["price"] = 30000,
		["category"] = "coupes",
		["hash"] = "1349725314",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/75/SentinelUp-GTAV-front.png"
	},
	["sentinel2"] = {
		["name"] = "Sentinel XS",
		["brand"] = " Übermacht",
		["model"] = "sentinel2",
		["price"] = 36500,
		["category"] = "coupes",
		["hash"] = "873639469",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d0/SentinelXS-GTAV-front.png"
	},
	["windsor"] = {
		["name"] = "Windsor",
		["brand"] = "Enus",
		["model"] = "windsor",
		["price"] = 325000,
		["category"] = "coupes",
		["hash"] = "1581459400",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/26/Windsor-GTAV-front.png"
	},
	["windsor2"] = {
		["name"] = "Windsor Drop",
		["brand"] = "Enus",
		["model"] = "windsor2",
		["price"] = 355000,
		["category"] = "coupes",
		["hash"] = "-1930048799",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/31/WindsorDropUp-GTAO-front.png"
	},
	["zion"] = {
		["name"] = "Zion",
		["brand"] = "Übermacht",
		["model"] = "zion",
		["price"] = 25500,
		["category"] = "coupes",
		["hash"] = "-1122289213",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cc/Zion-GTAV-front.png"
	},
	["zion2"] = {
		["name"] = "Zion Cabrio",
		["brand"] = "Übermacht",
		["model"] = "zion2",
		["price"] = 27000,
		["category"] = "coupes",
		["hash"] = "-1193103848",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cb/ZionCabrioDown-GTAV-front.png"
	},
	["ninef"] = {
		["name"] = "9F",
		["brand"] = "Obey",
		["model"] = "ninef",
		["price"] = 135000,
		["category"] = "sports",
		["hash"] = "1032823388",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2d/9F-GTAV-front.png"
	},
	["ninef2"] = {
		["name"] = "9F Cabrio",
		["brand"] = "Obey",
		["model"] = "ninef2",
		["price"] = 142000,
		["category"] = "sports",
		["hash"] = "-1461482751",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a1/9FCabrio-GTAV-front.png"
	},
	["alpha"] = {
		["name"] = "Alpha",
		["brand"] = "Albany",
		["model"] = "alpha",
		["price"] = 38000,
		["category"] = "sports",
		["hash"] = "767087018",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/94/Alpha-GTAV-front.png"
	},
	["banshee"] = {
		["name"] = "Banshee",
		["brand"] = "Bravado",
		["model"] = "banshee",
		["price"] = 98000,
		["category"] = "sports",
		["hash"] = "-1041692462",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/82/Banshee-GTAV-front.png"
	},
	["bestiagts"] = {
		["name"] = "Bestia GTS",
		["brand"] = "Grotti",
		["model"] = "bestiagts",
		["price"] = 197000,
		["category"] = "sports",
		["hash"] = "1274868363",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a5/BestiaGTS-GTAO-front.png"
	},
	["buffalo"] = {
		["name"] = "Buffalo",
		["brand"] = "Bravado",
		["model"] = "buffalo",
		["price"] = 32000,
		["category"] = "sports",
		["hash"] = "-304802106",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7d/Buffalo-GTAV-front.png"
	},
	["buffalo2"] = {
		["name"] = "Buffalo S",
		["brand"] = "Bravado",
		["model"] = "buffalo2",
		["price"] = 39500,
		["category"] = "sports",
		["hash"] = "736902334",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e1/BuffaloS-GTAV-front.png"
	},
	["carbonizzare"] = {
		["name"] = "Carbonizzare",
		["brand"] = "Grotti",
		["model"] = "carbonizzare",
		["price"] = 219000,
		["category"] = "sports",
		["hash"] = "2072687711",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7b/CarbonizzareDown-GTAV-front.png"
	},
	["comet2"] = {
		["name"] = "Comet",
		["brand"] = "Pfister",
		["model"] = "comet2",
		["price"] = 142000,
		["category"] = "sports",
		["hash"] = "-1045541610",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d2/Comet-GTAV-front.png"
	},
	["coquette"] = {
		["name"] = "Coquette",
		["brand"] = "Invetero",
		["model"] = "coquette",
		["price"] = 97000,
		["category"] = "sports",
		["hash"] = "108773431",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/08/Coquette-GTAV-front.png"
	},
	["elegy2"] = {
		["name"] = "Elegy RH8",
		["brand"] = "Annis",
		["model"] = "elegy2",
		["price"] = 68500,
		["category"] = "sports",
		["hash"] = "-566387422",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4f/ElegyRH8-GTAV-front.png"
	},
	["feltzer2"] = {
		["name"] = "Feltzer",
		["brand"] = "Benefactor",
		["model"] = "feltzer2",
		["price"] = 83500,
		["category"] = "sports",
		["hash"] = "-1995326987",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8f/Feltzer-GTAVPC-Front.png"
	},
	["furoregt"] = {
		["name"] = "Furore GT",
		["brand"] = "Lampadati",
		["model"] = "furoregt",
		["price"] = 115000,
		["category"] = "sports",
		["hash"] = "-1089039904",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/56/FuroreGT-GTAV-front.png"
	},
	["fusilade"] = {
		["name"] = "Fusilade",
		["brand"] = "Schyster",
		["model"] = "fusilade",
		["price"] = 50000,
		["category"] = "sports",
		["hash"] = "499169875",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/Fusilade-GTAV-front.png"
	},
	["jester"] = {
		["name"] = "Jester",
		["brand"] = "Dinka",
		["model"] = "jester",
		["price"] = 265000,
		["category"] = "sports",
		["hash"] = "-1297672541",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/af/Jester-GTAV-front.png"
	},
	["khamelion"] = {
		["name"] = "Khamelion",
		["brand"] = "Hijak",
		["model"] = "khamelion",
		["price"] = 102000,
		["category"] = "sports",
		["hash"] = "544021352",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1f/Khamelion-GTAV-front.png"
	},
	["kuruma"] = {
		["name"] = "Kuruma",
		["brand"] = "Karin",
		["model"] = "kuruma",
		["price"] = 59500,
		["category"] = "sports",
		["hash"] = "-1372848492",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Kuruma-GTAO-front.png"
	},
	["lynx"] = {
		["name"] = "Lynx",
		["brand"] = "Ocelot",
		["model"] = "lynx",
		["price"] = 68500,
		["category"] = "sports",
		["hash"] = "482197771",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a7/Lynx-GTAO-front.png"
	},
	["mamba"] = {
		["name"] = "Mamba",
		["brand"] = "Declasse",
		["model"] = "mamba",
		["price"] = 86000,
		["category"] = "sportsclassics",
		["hash"] = "-1660945322",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d4/Mamba-GTAO-front.png"
	},
	["massacro"] = {
		["name"] = "Massacro",
		["brand"] = "Dewbauchee",
		["model"] = "massacro",
		["price"] = 165000,
		["category"] = "sports",
		["hash"] = "-142942670",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/12/Massacro-GTAV-front.png"
	},
	["rapidgt"] = {
		["name"] = "Rapid GT",
		["brand"] = "Dewbauchee",
		["model"] = "rapidgt",
		["price"] = 60000,
		["category"] = "sports",
		["hash"] = "-1934452204",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/42/RapidGT-GTAV-front.png"
	},
	["rapidgt2"] = {
		["name"] = "Rapid GT Convertible",
		["brand"] = "Dewbauchee",
		["model"] = "rapidgt2",
		["price"] = 65000,
		["category"] = "sports",
		["hash"] = "1737773231",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f8/RapidGT2-GTAV-front.png"
	},
	["schafter3"] = {
		["name"] = "Schafter V12",
		["brand"] = "Benefactor",
		["model"] = "schafter3",
		["price"] = 69000,
		["category"] = "sports",
		["hash"] = "-1485523546",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a6/SchafterV12-GTAO-front.png"
	},
	["seven70"] = {
		["name"] = "Seven-70",
		["brand"] = "Dewbauchee",
		["model"] = "seven70",
		["price"] = 85000,
		["category"] = "sports",
		["hash"] = "-1757836725",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/21/Seven70-GTAO-front.png"
	},
	["sultan"] = {
		["name"] = "Sultan",
		["brand"] = "Karin",
		["model"] = "sultan",
		["price"] = 56500,
		["category"] = "sports",
		["hash"] = "970598228",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/bb/Sultan-GTAV-front.png"
	},
	["surano"] = {
		["name"] = "Surano",
		["brand"] = " Benefactor",
		["model"] = "surano",
		["price"] = 89000,
		["category"] = "sports",
		["hash"] = "384071873",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fd/SuranoDown-GTAV-front.png"
	},
	["verlierer2"] = {
		["name"] = "Verlierer",
		["brand"] = "Bravado",
		["model"] = "verlierer2",
		["price"] = 90500,
		["category"] = "sports",
		["hash"] = "1102544804",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/Verlierer-GTAO-front.png"
	},
	["adder"] = {
		["name"] = "Adder",
		["brand"] = "Truffade",
		["model"] = "adder",
		["price"] = 1000000,
		["category"] = "super",
		["hash"] = "-1216765807",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9e/Adder-GTAV-front.png"
	},
	["banshee2"] = {
		["name"] = "Banshee 900R",
		["brand"] = "Bravado",
		["model"] = "banshee2",
		["price"] = 178000,
		["category"] = "super",
		["hash"] = "633712403",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e2/Banshee900RTopless-GTAO-front.png"
	},
	["bullet"] = {
		["name"] = "Bullet",
		["brand"] = "Vapid",
		["model"] = "bullet",
		["price"] = 190000,
		["category"] = "super",
		["hash"] = "-1696146015",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3d/Bullet-GTAV-front.png"
	},
	["cheetah"] = {
		["name"] = "Cheetah",
		["brand"] = "Grotti",
		["model"] = "cheetah",
		["price"] = 395000,
		["category"] = "super",
		["hash"] = "-1311154784",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1e/Cheetah-GTAV-Front.png"
	},
	["entityxf"] = {
		["name"] = "Entity XF",
		["brand"] = "Överflöd",
		["model"] = "entityxf",
		["price"] = 825000,
		["category"] = "super",
		["hash"] = "-1291952903",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/95/EntityXF-GTAV-front.png"
	},
	["fmj"] = {
		["name"] = "FMJ",
		["brand"] = "Vapid",
		["model"] = "fmj",
		["price"] = 335000,
		["category"] = "super",
		["hash"] = "1426219628",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/FMJ-GTAO-front.png"
	},
	["infernus"] = {
		["name"] = "Infernus",
		["brand"] = "Pegassi",
		["model"] = "infernus",
		["price"] = 285000,
		["category"] = "super",
		["hash"] = "418536135",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0e/Infernus-GTAV-front.png"
	},
	["pfister811"] = {
		["name"] = "811",
		["brand"] = "Pfister",
		["model"] = "pfister811",
		["price"] = 583000,
		["category"] = "super",
		["hash"] = "-1829802492",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c7/811A-GTAO-front.png"
	},
	["reaper"] = {
		["name"] = "Reaper",
		["brand"] = "Pegassi",
		["model"] = "reaper",
		["price"] = 365000,
		["category"] = "super",
		["hash"] = "234062309",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5f/Reaper-GTAO-front.png"
	},
	["t20"] = {
		["name"] = "T20",
		["brand"] = "Progen",
		["model"] = "t20",
		["price"] = 1680000,
		["category"] = "super",
		["hash"] = "1663218586",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/20/T20-GTAV-front.png"
	},
	["turismor"] = {
		["name"] = "Turismo R",
		["brand"] = "Grotti",
		["model"] = "turismor",
		["price"] = 750000,
		["category"] = "super",
		["hash"] = "408192225",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/61/TurismoR-GTAV-front.png"
	},
	["vacca"] = {
		["name"] = "Vacca",
		["brand"] = "Pegassi",
		["model"] = "vacca",
		["price"] = 255000,
		["category"] = "super",
		["hash"] = "338562499",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/Vacca-GTAV-front.png"
	},
	["voltic"] = {
		["name"] = "Voltic",
		["brand"] = "Coil",
		["model"] = "voltic",
		["price"] = 120000,
		["category"] = "super",
		["hash"] = "-1622444098",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/87/Voltic-GTAV-front.png"
	},
	["prototipo"] = {
		["name"] = "X80 Proto",
		["brand"] = "Grotti",
		["model"] = "prototipo",
		["price"] = 1430000,
		["category"] = "super",
		["hash"] = "2123327359",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b3/X80Proto-GTAO-front.png"
	},
	["zentorno"] = {
		["name"] = "Zentorno",
		["brand"] = "Pegassi",
		["model"] = "zentorno",
		["price"] = 1250000,
		["category"] = "super",
		["hash"] = "-1403128555",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/60/Zentorno-GTAV-front.png"
	},
	["avarus"] = {
		["name"] = "Avarus",
		["brand"] = "LCC",
		["model"] = "avarus",
		["price"] = 6500,
		["category"] = "motorcycles",
		["hash"] = "-2115793025",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1a/Avarus-GTAO-front.png"
	},
	["bagger"] = {
		["name"] = "Bagger",
		["brand"] = "WMC",
		["model"] = "bagger",
		["price"] = 7000,
		["category"] = "motorcycles",
		["hash"] = "-2140431165",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/10/Bagger-GTAV-front.png"
	},
	["bati"] = {
		["name"] = "Bati 801",
		["brand"] = "Pegassi",
		["model"] = "bati",
		["price"] = 17500,
		["category"] = "motorcycles",
		["hash"] = "-114291515",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/65/Bati801-GTAV-FrontQuarter.png"
	},
	["carbonrs"] = {
		["name"] = "Carbon RS",
		["brand"] = "Nagasaki",
		["model"] = "carbonrs",
		["price"] = 14500,
		["category"] = "motorcycles",
		["hash"] = "11251904",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2d/CarbonRS-GTAV-front.png"
	},
	["chimera"] = {
		["name"] = "Chimera",
		["brand"] = "Nagasaki",
		["model"] = "chimera",
		["price"] = 15000,
		["category"] = "motorcycles",
		["hash"] = "6774487",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8a/Chimera-GTAO-front.png"
	},
	["daemon"] = {
		["name"] = "Daemon",
		["brand"] = "WMC",
		["model"] = "daemon",
		["price"] = 12500,
		["category"] = "motorcycles",
		["hash"] = "2006142190",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Daemon2-GTAO-front.png"
	},
	["defiler"] = {
		["name"] = "Defiler",
		["brand"] = "Shitzu",
		["model"] = "defiler",
		["price"] = 13500,
		["category"] = "motorcycles",
		["hash"] = "822018448",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f5/Defiler-GTAO-front.png"
	},
	["esskey"] = {
		["name"] = "Esskey",
		["brand"] = "Pegassi",
		["model"] = "esskey",
		["price"] = 6000,
		["category"] = "motorcycles",
		["hash"] = "2035069708",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4e/Esskey-GTAO-front.png"
	},
	["faggio"] = {
		["name"] = "Faggio Sport",
		["brand"] = "Pegassi",
		["model"] = "faggio",
		["price"] = 750,
		["category"] = "motorcycles",
		["hash"] = "55628203",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/50/FaggioSport-GTAO-front.png"
	},
	["hakuchou"] = {
		["name"] = "Hakuchou",
		["brand"] = "Shitzu",
		["model"] = "hakuchou",
		["price"] = 16000,
		["category"] = "motorcycles",
		["hash"] = "1265391242",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/ab/Hakuchou-GTAV-front.png"
	},
	["hexer"] = {
		["name"] = "Hexer",
		["brand"] = "LCC",
		["model"] = "hexer",
		["price"] = 7500,
		["category"] = "motorcycles",
		["hash"] = "301427732",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/64/Hexer-GTAV-front.png"
	},
	["nemesis"] = {
		["name"] = "Nemesis",
		["brand"] = "Principe",
		["model"] = "nemesis",
		["price"] = 12000,
		["category"] = "motorcycles",
		["hash"] = "-634879114",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4b/Nemesis-GTAV-front.png"
	},
	["nightblade"] = {
		["name"] = "Nightblade",
		["brand"] = "WMC",
		["model"] = "nightblade",
		["price"] = 14500,
		["category"] = "motorcycles",
		["hash"] = "-1606187161",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Nightblade-GTAO-front.png"
	},
	["pcj"] = {
		["name"] = "PCJ-600",
		["brand"] = "Shitzu",
		["model"] = "pcj",
		["price"] = 13500,
		["category"] = "motorcycles",
		["hash"] = "-909201658",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/74/PCJ600-GTAV-front.png"
	},
	["ruffian"] = {
		["name"] = "Ruffian",
		["brand"] = "Pegassi",
		["model"] = "ruffian",
		["price"] = 14000,
		["category"] = "motorcycles",
		["hash"] = "-893578776",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/70/Ruffian-GTAV-front-variant2.png"
	},
	["thrust"] = {
		["name"] = "Thrust",
		["brand"] = "Dinka",
		["model"] = "thrust",
		["price"] = 16000,
		["category"] = "motorcycles",
		["hash"] = "1836027715",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4e/Thrust-GTAV-front.png"
	},
	["visione"] = {
		["name"] = "Visione",
		["brand"] = "Grotti",
		["model"] = "visione",
		["price"] = 1750000,
		["category"] = "sports",
		["hash"] = "-998177792",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/57/Visione-GTAO-front.png"
	},
	["gt500"] = {
		["name"] = "GT500",
		["brand"] = "Grotti",
		["model"] = "gt500",
		["price"] = 255000,
		["category"] = "sportsclassics",
		["hash"] = "-2079788230",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/25/GT500-GTAO-front.png"
	},
	["cyclone"] = {
		["name"] = "Cyclone",
		["brand"] = "Coil",
		["model"] = "cyclone",
		["price"] = 1200000,
		["category"] = "super",
		["hash"] = "1392481335",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Cyclone-GTAO-front.png"
	},
	["comet5"] = {
		["name"] = "Comet SR",
		["brand"] = "Pfister",
		["model"] = "comet5",
		["price"] = 252000,
		["category"] = "sports",
		["hash"] = "661493923",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0f/CometSR-GTAO-front.png"
	},
	["rapidgt3"] = {
		["name"] = "Rapid GT",
		["brand"] = "Dewbauchee",
		["model"] = "rapidgt3",
		["price"] = 445000,
		["category"] = "sportsclassics",
		["hash"] = "2049897956",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/13/RapidGTClassic-GTAO-front.png"
	},
	["streiter"] = {
		["name"] = "Streiter",
		["brand"] = "Benefactor",
		["model"] = "streiter",
		["price"] = 98000,
		["category"] = "sports",
		["hash"] = "1741861769",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/38/Streiter-GTAO-front.png"
	},
	["pariah"] = {
		["name"] = "Pariah",
		["brand"] = "Ocelot",
		["model"] = "pariah",
		["price"] = 395000,
		["category"] = "sports",
		["hash"] = "867799010",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Pariah-GTAO-front.png"
	},
	["raiden"] = {
		["name"] = "Raiden",
		["brand"] = "Coil",
		["model"] = "raiden",
		["price"] = 150000,
		["category"] = "sports",
		["hash"] = "-1529242755",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b5/Raiden-GTAO-front.png"
	},
	["hustler"] = {
		["name"] = "Hustler",
		["brand"] = "Vapid",
		["model"] = "hustler",
		["price"] = 75500,
		["category"] = "muscle",
		["hash"] = "600450546",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f1/Hustler-GTAO-front.png"
	},
	["yosemite"] = {
		["name"] = "Yosemite",
		["brand"] = "Declasse",
		["model"] = "yosemite",
		["price"] = 19500,
		["category"] = "muscle",
		["hash"] = "1871995513",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/09/Yosemite-GTAO-front.png"
	},
	["hermes"] = {
		["name"] = "Hermes",
		["brand"] = "Albany",
		["model"] = "hermes",
		["price"] = 125500,
		["category"] = "muscle",
		["hash"] = "15219735",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9b/Hermes-GTAO-front.png"
	},
	["sc1"] = {
		["name"] = "SC1",
		["brand"] = "Übermacht",
		["model"] = "sc1",
		["price"] = 750000,
		["category"] = "super",
		["hash"] = "1352136073",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3a/SC1-GTAO-front.png"
	},
	["z190"] = {
		["name"] = "190Z",
		["brand"] = "Karin",
		["model"] = "z190",
		["price"] = 330000,
		["category"] = "sportsclassics",
		["hash"] = "838982985",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/be/190z-GTAO-front.png"
	},
	["neon"] = {
		["name"] = "Neon",
		["brand"] = "Pfister",
		["model"] = "neon",
		["price"] = 185000,
		["category"] = "sports",
		["hash"] = "-1848994066",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c0/Neon-GTAO-front.png"
	},
	["autarch"] = {
		["name"] = "Autarch",
		["brand"] = "Överflöd",
		["model"] = "autarch",
		["price"] = 1800000,
		["category"] = "super",
		["hash"] = "-313185164",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6c/Autarch-GTAO-front.png"
	},
	["blista2"] = {
		["name"] = "Blista Compact",
		["brand"] = "Dinka",
		["model"] = "blista2",
		["price"] = 12500,
		["category"] = "compacts",
		["hash"] = "1039032026",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/06/BlistaCompact-GTAV-front.png"
	},
	["issi3"] = {
		["name"] = "Issi Classic",
		["brand"] = "Weeny",
		["model"] = "issi3",
		["price"] = 10000,
		["category"] = "compacts",
		["hash"] = "931280609",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9f/IssiClassic-GTAO-front.png"
	},
	["dilettante"] = {
		["name"] = "Dilettante",
		["brand"] = "Karin",
		["model"] = "dilettante",
		["price"] = 13000,
		["category"] = "compacts",
		["hash"] = "-1130810103",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/Dilettante-GTAV-front.png"
	},
	["rhapsody"] = {
		["name"] = "Rhapsody",
		["brand"] = "Declasse",
		["model"] = "rhapsody",
		["price"] = 10000,
		["category"] = "compacts",
		["hash"] = "841808271",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cc/Rhapsody-GTAV-front.png"
	},
	["stalion"] = {
		["name"] = "Stallion",
		["brand"] = "Declasse",
		["model"] = "stalion",
		["price"] = 23500,
		["category"] = "muscle",
		["hash"] = "1923400478",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/00/Stallion-GTAV-front.png"
	},
	["infernus2"] = {
		["name"] = "Infernus Classic",
		["brand"] = "Pegassi",
		["model"] = "infernus2",
		["price"] = 200000,
		["category"] = "sportsclassics",
		["hash"] = "-1405937764",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/73/InfernusClassic-GTAO-front.png"
	},
	["ruston"] = {
		["name"] = "Ruston",
		["brand"] = "Hijak",
		["model"] = "ruston",
		["price"] = 165000,
		["category"] = "sports",
		["hash"] = "719660200",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2c/Ruston-GTAO-front.png"
	},
	["specter"] = {
		["name"] = "Specter",
		["brand"] = "Dewbauchee",
		["model"] = "specter",
		["price"] = 155000,
		["category"] = "sports",
		["hash"] = "1886268224",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7b/Specter-GTAO-front.png"
	},
	["cheetah2"] = {
		["name"] = "Cheetah Classic",
		["brand"] = "Grotti",
		["model"] = "cheetah2",
		["price"] = 220000,
		["category"] = "sports",
		["hash"] = "223240013",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/38/CheetahClassic-GTAO-front.png"
	},
	["torero"] = {
		["name"] = "Torero",
		["brand"] = "Pegassi",
		["model"] = "torero",
		["price"] = 285500,
		["category"] = "sportsclassics",
		["hash"] = "1504306544",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Torero-GTAO-front.png"
	},
	["gp1"] = {
		["name"] = "GP1",
		["brand"] = "Progen",
		["model"] = "gp1",
		["price"] = 462000,
		["category"] = "super",
		["hash"] = "1234311532",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8a/GP1-GTAO-front.png"
	},
	["penetrator"] = {
		["name"] = "Penetrator",
		["brand"] = "Ocelot",
		["model"] = "penetrator",
		["price"] = 567000,
		["category"] = "super",
		["hash"] = "-1758137366",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9c/Penetrator-GTAO-front.png"
	},
	["tempesta"] = {
		["name"] = "Tempesta",
		["brand"] = "Pegassi",
		["model"] = "tempesta",
		["price"] = 400000,
		["category"] = "super",
		["hash"] = "272929391",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/35/Tempesta-GTAO-front.png"
	},
	["vagner"] = {
		["name"] = "Vagner",
		["brand"] = "Dewbauchee",
		["model"] = "vagner",
		["price"] = 1460000,
		["category"] = "super",
		["hash"] = "1939284556",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/14/Vagner-GTAO-front.png"
	},
	["italigtb"] = {
		["name"] = "Itali GTB",
		["brand"] = "Progen",
		["model"] = "italigtb",
		["price"] = 1200000,
		["category"] = "super",
		["hash"] = "-482719877",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/44/ItaliGTB-GTAO-front.png"
	},
	["xa21"] = {
		["name"] = "XA-21",
		["brand"] = "Ocelot",
		["model"] = "xa21",
		["price"] = 2150000,
		["category"] = "super",
		["hash"] = "917809321",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/69/XA21-GTAO-front.png"
	},
	["jester3"] = {
		["name"] = "Jester Classic",
		["brand"] = "Dinka",
		["model"] = "jester3",
		["price"] = 215000,
		["category"] = "sports",
		["hash"] = "-214906006",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1a/JesterClassic-GTAO-front.png"
	},
	["elegy"] = {
		["name"] = "Elegy Retro Custom",
		["brand"] = "Annis",
		["model"] = "elegy",
		["price"] = 60000,
		["category"] = "sports",
		["hash"] = "196747873 ",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/68/ElegyRetroCustom-GTAO-front.png"
	},
	["dominator3"] = {
		["name"] = "Dominator GTX",
		["brand"] = "Vapid",
		["model"] = "dominator3",
		["price"] = 87500,
		["category"] = "muscle",
		["hash"] = "-986944621",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8b/DominatorGTX-GTAO-front.png"
	},
	["tezeract"] = {
		["name"] = "Tezeract",
		["brand"] = "Pegassi",
		["model"] = "tezeract",
		["price"] = 2350000,
		["category"] = "super",
		["hash"] = "1031562256",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/Tezeract-GTAO-front.png"
	},
	["entity2"] = {
		["name"] = "Entity XXR",
		["brand"] = "Överflöd",
		["model"] = "entity2",
		["price"] = 1532000,
		["category"] = "super",
		["hash"] = "-2120700196",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9a/EntityXXR-GTAO-front.png"
	},
	["nero"] = {
		["name"] = "Nero",
		["brand"] = "Truffade",
		["model"] = "nero",
		["price"] = 2352000,
		["category"] = "super",
		["hash"] = "1034187331",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5e/Nero-GTAO-front.png"
	},
	["comet3"] = {
		["name"] = "Comet Retro Custom",
		["brand"] = "Pfister",
		["model"] = "comet3",
		["price"] = 125000,
		["category"] = "sports",
		["hash"] = "-2022483795",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/CometRetroCustom-GTAO-front.png"
	},
	["taipan"] = {
		["name"] = "Taipan",
		["brand"] = "Cheval",
		["model"] = "taipan",
		["price"] = 1650000,
		["category"] = "super",
		["hash"] = "-1134706562",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4c/Taipan-GTAO-front.png"
	},
	["tyrant"] = {
		["name"] = "Tyrant",
		["brand"] = " Överflöd",
		["model"] = "tyrant",
		["price"] = 2100000,
		["category"] = "super",
		["hash"] = "-376434238",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f7/Tyrant-GTAO-front.png"
	},
	["osiris"] = {
		["name"] = "Osiris",
		["brand"] = "Pegassi",
		["model"] = "osiris",
		["price"] = 1400000,
		["category"] = "super",
		["hash"] = "1987142870",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Osiris-GTAV-front.png"
	},
	["flashgt"] = {
		["name"] = "Flash GT",
		["brand"] = "Vapid",
		["model"] = "flashgt",
		["price"] = 111000,
		["category"] = "sports",
		["hash"] = "-1259134696",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3b/FlashGT-GTAO-front.png"
	},
	["specter2"] = {
		["name"] = "Specter Custom",
		["brand"] = "Dewbauchee",
		["model"] = "specter2",
		["price"] = 178000,
		["category"] = "sports",
		["hash"] = "1074745671",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/01/SpecterCustom-GTAO-front.png"
	},
	["surge"] = {
		["name"] = "Surge",
		["brand"] = "Cheval",
		["model"] = "surge",
		["price"] = 28500,
		["category"] = "sedans",
		["hash"] = "-1894894188",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c2/Surge-GTAV-front.png"
	},
	["ellie"] = {
		["name"] = "Ellie",
		["brand"] = "Vapid",
		["model"] = "ellie",
		["price"] = 50000,
		["category"] = "muscle",
		["hash"] = "-1267543371",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Ellie-GTAO-front.png"
	},
	["bjxl"] = {
		["name"] = "BeeJay XL",
		["brand"] = "Karin",
		["model"] = "bjxl",
		["price"] = 47000,
		["category"] = "suvs",
		["hash"] = "850565707",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/da/BeeJayXL-GTAV-front.png"
	},
	["faggio3"] = {
		["name"] = "Faggio Mod",
		["brand"] = "Pegassi",
		["model"] = "faggio3",
		["price"] = 900,
		["category"] = "motorcycles",
		["hash"] = "-1289178744",
		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png"
	}
}