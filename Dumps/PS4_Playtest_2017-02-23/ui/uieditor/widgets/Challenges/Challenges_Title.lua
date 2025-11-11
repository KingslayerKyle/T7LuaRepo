require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.Challenges_Title = InheritFrom( LUI.UIElement )
CoD.Challenges_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_Title )
	self.id = "Challenges_Title"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 154 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 1, -3, 5 )
	cacItemTitleGlow0:setTopBottom( 0, 1, -4, 4 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -80, 74 )
	Glow:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local weaponNameLabel = LUI.UIText.new()
	weaponNameLabel:setLeftRight( 0, 1, 8, -8 )
	weaponNameLabel:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	weaponNameLabel:setRGB( 0, 0, 0 )
	weaponNameLabel:setTTF( "fonts/escom.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacItemTitleGlow0:close()
		self.weaponNameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

