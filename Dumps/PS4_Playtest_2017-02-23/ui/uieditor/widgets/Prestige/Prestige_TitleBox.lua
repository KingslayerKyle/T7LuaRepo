require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.Prestige_TitleBox = InheritFrom( LUI.UIElement )
CoD.Prestige_TitleBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_TitleBox )
	self.id = "Prestige_TitleBox"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 528 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, -4, 4 )
	TitleGlow1:setTopBottom( 0, 1, -4, 4 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -81, 73 )
	Glow:setTopBottom( 0.5, 0.5, -45, 51 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 4, 828 )
	Title:setTopBottom( 0.5, 0.5, -18, 18 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( Engine.Localize( "Care Package" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.06, 0, 0, 0 )
	Title:setShaderVector( 1, 0.02, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 0.6 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Title )
	self.Title = Title
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

