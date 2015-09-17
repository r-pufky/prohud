-- disables interaction wheels if enabled.
if ProHud.data.enable then
  CloneClass(HUDInteraction)
  Hooks:PostHook(HUDInteraction, "init", "HideInit", function(self, hud, full_hud)
    if ProHud.data.hide_interactions then
      self._hud_panel:child(self._child_name_text):set_visible(false)
      self._hud_panel:child(self._child_name_text):set_alpha(0)
      self._hud_panel:child(self._child_ivalid_name_text):set_visible(false)
      self._hud_panel:child(self._child_ivalid_name_text):set_alpha(0)
    end
  end)

  Hooks:PostHook(HUDInteraction, "show_interaction_bar", "HideCircle", function(self)
    if ProHud.data.hide_interactions then
      self._interact_circle:set_visible(false)
      self._interact_circle:set_alpha(0)
    end
  end)

  if ProHud.data.hide_interactions then
    function HUDInteraction:_animate_interaction_complete(bitmap, circle)
      bitmap:parent():remove(bitmap)
      circle:remove()
    end
  end
end