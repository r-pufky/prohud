-- disable teammate HUD's and general items if enabled.
if ProHud.data.enable then
  CloneClass(HUDTeammate)
  Hooks:PostHook(HUDTeammate, "init", "HideInit", function(self)
    local teammate_panel = self._panel:child("player")
    local radial_health_panel = teammate_panel:child("radial_health_panel")
    local radial_shield = radial_health_panel:child("radial_shield")
    local radial_health = radial_health_panel:child("radial_health")	
    local radial_custom = radial_health_panel:child("radial_custom")	
    local weapons_panel = teammate_panel:child("weapons_panel")	
    local radial_bg = radial_health_panel:child("radial_bg")	
    local radial_red = radial_health_panel:child("damage_indicator")	
    local radial_health = radial_health_panel:child("radial_health")	
    local grenades_panel = self._player_panel:child("grenades_panel")
    local cable_ties_panel = self._player_panel:child("cable_ties_panel")
    local deployable_equipment_panel = self._player_panel:child("deployable_equipment_panel")
    local name = self._panel:child("name")
    local callsign = self._panel:child("callsign")
    local callsign_bg = self._panel:child("callsign_bg")
    local name_bg = self._panel:child("name_bg")
    if ProHud.data.hide_health then
      radial_health:set_visible(false)
      radial_shield:set_visible(false)
      radial_custom:set_visible(false)
      radial_red:set_visible(false)
      radial_bg:set_visible(false)
      radial_health:set_alpha(0)
      radial_shield:set_alpha(0)
      radial_custom:set_alpha(0)
      radial_red:set_alpha(0)
      radial_bg:set_alpha(0)
    end
    if ProHud.data.hide_equipment then
      cable_ties_panel:set_visible(false)
      deployable_equipment_panel:set_visible(false)
      grenades_panel:set_visible(false)
      cable_ties_panel:set_alpha(0)
      deployable_equipment_panel:set_alpha(0)
      grenades_panel:set_alpha(0)
    end 
    if ProHud.data.hide_ammo then
      weapons_panel:set_visible(false)
      weapons_panel:set_alpha(0)
    end
    if ProHud.data.hide_names then
      name:set_visible(false)
      name:set_alpha(0) 
      name_bg:set_visible(false)
      name_bg:set_alpha(0)
      callsign:set_visible(false)
      callsign:set_alpha(0)
      callsign_bg:set_visible(false)
      callsign_bg:set_alpha(0)
    end    
  end)

  if ProHud.data.hide_team_interactions then
    function HUDTeammate:teammate_progress(enabled, tweakdata_id, timer, success) end
  end

  if ProHud.data.hide_pickups then
    function HUDTeammate:layout_special_equipments()
      local teammate_panel = self._panel
      local special_equipment = self._special_equipment
      local name = teammate_panel:child("name")
      local w = teammate_panel:w()
      for i, panel in ipairs(special_equipment) do
        if self._main_player then
          panel:set_visible(false)
          panel:set_alpha(0)
        end
      end
    end
  end
end