-- 2f4ab7a17ccd07592bcfdc58ff2d6e1a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Notif.ZmNotif1_BckScl" )

CoD.ZmNotif1Factory = InheritFrom( LUI.UIElement )
CoD.ZmNotif1Factory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmNotif1Factory )
	self.id = "ZmNotif1Factory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 224 )
	self:setTopBottom( true, false, 0, 55 )
	
	local GLowMultiply = LUI.UIImage.new()
	GLowMultiply:setLeftRight( true, true, -55, 41 )
	GLowMultiply:setTopBottom( false, false, -45, 45 )
	GLowMultiply:setRGB( 0.63, 0.63, 0.63 )
	GLowMultiply:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GLowMultiply:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( GLowMultiply )
	self.GLowMultiply = GLowMultiply
	
	local Label2 = LUI.UITightText.new()
	Label2:setLeftRight( false, false, -20, 21 )
	Label2:setTopBottom( true, false, 7.63, 45.63 )
	Label2:setRGB( 0, 0.58, 1 )
	Label2:setAlpha( 0.2 )
	Label2:setText( Engine.Localize( "MENU_NEW" ) )
	Label2:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	Label2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label2:setShaderVector( 0, 0.21, 0, 0, 0 )
	Label2:setShaderVector( 1, 0, 0, 0, 0 )
	Label2:setShaderVector( 2, 1, 0, 0, 0 )
	Label2:setLetterSpacing( 0.2 )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( false, false, -20, 21 )
	Label1:setTopBottom( true, false, 7.63, 45.63 )
	Label1:setRGB( 0.62, 0.96, 0.99 )
	Label1:setText( Engine.Localize( "MENU_NEW" ) )
	Label1:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( Label1, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 3 )
	end )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Flckr = LUI.UIImage.new()
	Flckr:setLeftRight( true, true, 8, -13 )
	Flckr:setTopBottom( false, false, -27.38, 21.63 )
	Flckr:setRGB( 0, 0.61, 1 )
	Flckr:setAlpha( 0.5 )
	Flckr:setImage( RegisterImage( "uie_t7_zm_hud_notif_txtbacking" ) )
	Flckr:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Flckr:setShaderVector( 0, 1.71, 1, 0, 0 )
	Flckr:setShaderVector( 1, 0, 100, 0, 0 )
	self:addElement( Flckr )
	self.Flckr = Flckr
	
	local BckScl = CoD.ZmNotif1_BckScl.new( menu, controller )
	BckScl:setLeftRight( true, true, 0, 0 )
	BckScl:setTopBottom( false, false, -26.38, 22.63 )
	BckScl:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BckScl )
	self.BckScl = BckScl
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -36.17, 33.17 )
	Glow:setTopBottom( false, false, -33.75, 32 )
	Glow:setRGB( 0, 0.39, 1 )
	Glow:setAlpha( 0.43 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BckScl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

