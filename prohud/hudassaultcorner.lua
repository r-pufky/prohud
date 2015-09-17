-- disables phase box in upper right of screen, if enabled.
if ProHud.data.enable then
  CloneClass(HUDAssaultCorner)
  Hooks:PostHook(HUDAssaultCorner, "init", "HideInit", function(self, hud, full_hud)
    local assault_panel = self._hud_panel:child( "assault_panel" )
    local casing_panel = self._hud_panel:child("casing_panel")
    local hostages_panel = self._hud_panel:child("hostages_panel")
    local no_return_panel = self._hud_panel:child("point_of_no_return_panel")
    local casing_icon = casing_panel:child( "icon_casingbox" )
    local hostages_icon = hostages_panel:child( "hostages_icon" )
    local noreturn_icon = no_return_panel:child( "icon_noreturnbox" )
    local assault_icon = assault_panel:child( "icon_assaultbox" )

    if ProHud.data.hide_phase_boxes then
      self._bg_box:set_alpha(0)
      self._bg_box:set_visible(false)
      assault_icon:set_alpha(0)
      assault_icon:set_visible(false)
      self._hostages_bg_box:set_alpha(0)
      self._hostages_bg_box:set_visible(false)
      hostages_icon:set_alpha(0)
      hostages_icon:set_visible(false)
      self._casing_bg_box:set_alpha(0)
      self._casing_bg_box:set_visible(false)
      casing_icon:set_alpha(0)
      casing_icon:set_visible(false)
      self._noreturn_bg_box:set_alpha(0)
      self._noreturn_bg_box:set_visible(false)
      noreturn_icon:set_alpha(0)
      noreturn_icon:set_visible(false)   
    end
  end)
end

