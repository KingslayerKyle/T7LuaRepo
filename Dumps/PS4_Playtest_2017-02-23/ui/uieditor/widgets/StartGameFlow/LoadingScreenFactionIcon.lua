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
	self:setLeftRight( 0, 0, 0, 207 )
	self:setTopBottom( 0, 0, 0, 207 )
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( 0, 1, 0, 0 )
	GlowPanel:setTopBottom( 0, 1, 0, 0 )
	GlowPanel:setAlpha( 0.35 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local FactionIconSolid = LUI.UIImage.new()
	FactionIconSolid:setLeftRight( 0, 1, 40, -40 )
	FactionIconSolid:setTopBottom( 0, 1, 40, -40 )
	FactionIconSolid:setRGB( 0, 0, 0 )
	FactionIconSolid:setAlpha( 0.97 )
	FactionIconSolid:setImage( RegisterImage( "t7_mp_hud_faction_icon_faction1" ) )
	self:addElement( FactionIconSolid )
	self.FactionIconSolid = FactionIconSolid
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( 0, 1, 40, -40 )
	FactionIcon:setTopBottom( 0, 1, 40, -40 )
	FactionIcon:setImage( RegisterImage( "t7_mp_hud_faction_icon_faction1" ) )
	FactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GlowPanel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

