-- 47e0b933a3ddac92c0ac72fe930e3acf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.cac_TrainingSimNameLabel = InheritFrom( LUI.UIElement )
CoD.cac_TrainingSimNameLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_TrainingSimNameLabel )
	self.id = "cac_TrainingSimNameLabel"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 34 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2, 3 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow1:setAlpha( 0 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Guide = LUI.UIImage.new()
	Guide:setLeftRight( true, false, 0, 3 )
	Guide:setTopBottom( true, false, 0.71, 34 )
	Guide:setRGB( 1, 0.61, 0.15 )
	Guide:setAlpha( 0 )
	self:addElement( Guide )
	self.Guide = Guide
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, true, 1.5, -1.5 )
	TextBox0:setTopBottom( true, false, 0, 24 )
	TextBox0:setText( Engine.Localize( "MENU_NEW" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox0:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox0:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

