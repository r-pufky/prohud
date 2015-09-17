_G.ProHud = _G.ProHud or {}
ProHud._path = ModPath
ProHud.data_path = SavePath .. "prohud-config.json"
ProHud.data = {}

function ProHud:Defaults()
  -- global enable for prohud
  ProHud.data.enable = true
  -- hide assault / casing / point of no return / hostage boxes?
  ProHud.data.hide_phase_boxes = true
  ProHud.data.hide_objectives = true
  ProHud.data.hide_messages = true
  ProHud.data.hide_equipment = true
  ProHud.data.hide_ammo = false
  ProHud.data.hide_health = false
  ProHud.data.hide_interactions = false
  ProHud.data.hide_team_interactions = true
  ProHud.data.hide_pickups = true
  ProHud.data.hide_names = true
  ProHud.data.hide_custody = true
  ProHud.data.hide_downed = true
  log("Default prohud datauration loaded.")
  PrintTable(ProHud.data)
end

function ProHud:Load()
	local file = io.open(self.data_path, "r")
	if file then
		self.data = json.decode(file:read("*all"))
		file:close()
	else
    self:Defaults()
    self:Save()
    log("Created prohud defaults and saved config.")
  end
end

function ProHud:Save()
	local file = io.open(self.data_path, "w+" )
	if file then
		file:write(json.encode(self.data))
		file:close()
	end
end

ProHud:Load()

-- grab localized strings for menu displays.
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_ProHud", function(loc)
	for _, filename in pairs(file.GetFiles(ProHud._path .. "loc/")) do
		local str = filename:match('^(.*).txt$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			loc:load_localization_file(ProHud._path .. "loc/" .. filename)
			break
		end
	end
	loc:load_localization_file(ProHud._path .. "loc/english.txt", false)
end)
  
-- render menu from menu/options.txt and loc/*.txt; and provide needed callbacks.
Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_ProHud", function(menu_manager)
  MenuCallbackHandler.ProHudEnable = function(self, item)
		ProHud.data.enable = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudPhase = function(self, item)
		ProHud.data.hide_phase_boxes = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudObjectives = function(self, item)
		ProHud.data.hide_objectives = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudMessages = function(self, item)
		ProHud.data.hide_messages = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudEquipment = function(self, item)
		ProHud.data.hide_equipment = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudAmmo = function(self, item)
		ProHud.data.hide_ammo = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudHealth = function(self, item)
		ProHud.data.hide_health = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudInteractions = function(self, item)
		ProHud.data.hide_interactions = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudTeamInteractions = function(self, item)
		ProHud.data.hide_team_interactions = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudPickups = function(self, item)
		ProHud.data.hide_pickups = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudNames = function(self, item)
		ProHud.data.hide_names = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudCustody = function(self, item)
		ProHud.data.hide_custody = (item:value() == "on" and true or false)
		ProHud:Save()
	end
  MenuCallbackHandler.ProHudDowned = function(self, item)
		ProHud.data.hide_downed = (item:value() == "on" and true or false)
		ProHud:Save()
	end
	ProHud:Load()
	MenuHelper:LoadFromJsonFile(ProHud._path .. "menu/options.txt", ProHud, ProHud.data)
end)