-- 8e02e3dc6ff8fb46f58bf36208025239
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )

CoD.LoadingScreenFactionIcon = InheritFrom( LUI.UIElement )
CoD.LoadingScreenFactionIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenFactionIcon )
	self.id = "LoadingScreenFactionIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 138 )
	self:setTopBottom( true, false, 0, 138 )
	self.anyChildUsesUpdateState = true
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( true, true, 0, -0.25 )
	GlowPanel:setTopBottom( true, true, 0.13, -0.13 )
	GlowPanel:setAlpha( 0.35 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local FactionIconSolid = LUI.UIImage.new()
	FactionIconSolid:setLeftRight( true, true, 26.38, -26.63 )
	FactionIconSolid:setTopBottom( true, true, 26.38, -26.38 )
	FactionIconSolid:setRGB( 0, 0, 0 )
	FactionIconSolid:setAlpha( 0.97 )
	FactionIconSolid:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	self:addElement( FactionIconSolid )
	self.FactionIconSolid = FactionIconSolid
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( true, true, 26.38, -26.63 )
	FactionIcon:setTopBottom( true, true, 26.38, -26.38 )
	FactionIcon:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	FactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GlowPanel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

