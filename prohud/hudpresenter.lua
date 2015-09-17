-- Disable message notifications in center of screen if enabled.
if ProHud.data.enable then
  CloneClass(HUDPresenter)
  Hooks:PostHook(HUDPresenter, "init", "HideInit", function(self, hud, full_hud)
    if ProHud.data.hide_messages then
      self._bg_box:set_alpha(0)
      self._bg_box:set_visible(false)
    end
  end)
end