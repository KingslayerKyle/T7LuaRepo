-- e8fb5ce8023ad5e2d944d134c4313c2f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.TitleWidget = InheritFrom( LUI.UIElement )
CoD.TitleWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TitleWidget )
	self.id = "TitleWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 103 )
	self:setTopBottom( true, false, 0, 32 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, -2, 3 )
	cacItemTitleGlow0:setTopBottom( true, true, -3, 3 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local weaponNameLabel = LUI.UIText.new()
	weaponNameLabel:setLeftRight( true, true, -277, 277 )
	weaponNameLabel:setTopBottom( false, false, -11, 11 )
	weaponNameLabel:setRGB( 0, 0, 0 )
	weaponNameLabel:setTTF( "fonts/escom.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 2 )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacItemTitleGlow0:close()
		element.weaponNameLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

