-- disable objectives in upper left of screen if enabled.
if ProHud.data.enable then
  CloneClass(HUDObjectives)
  Hooks:PostHook(HUDObjectives, "init", "HideInit", function(self, hud, full_hud)
    local objectives_panel = self._hud_panel:child( "objectives_panel" ) 
    local objective_text = objectives_panel:child( "objective_text" ) 
    local icon_objectivebox = objectives_panel:child( "icon_objectivebox" ) 
    local amount_text = objectives_panel:child( "amount_text" ) 
    local objectives_panel = self._hud_panel:child( "objectives_panel" ) 
    if ProHud.data.hide_objectives then
     self._bg_box:set_alpha(0)
     self._bg_box:set_visible(false)
     icon_objectivebox:set_alpha(0)
     icon_objectivebox:set_visible(false)
     objective_text:set_alpha(0)
     objective_text:set_visible(false)
     amount_text:set_alpha(0)
     amount_text:set_visible(false)
     objectives_panel:set_visible(false)
    end
  end)

  if ProHud.data.hide_objectives then
    function HUDObjectives:_animate_show_text(objective_text, amount_text) end
  end
end