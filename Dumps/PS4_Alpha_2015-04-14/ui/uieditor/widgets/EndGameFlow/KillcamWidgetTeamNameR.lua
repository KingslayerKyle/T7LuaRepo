require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.KillcamWidgetTeamNameR = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetTeamNameR.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetTeamNameR )
	self.id = "KillcamWidgetTeamNameR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 292 )
	self:setTopBottom( true, false, 0, 34 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, -2, 3 )
	cacItemTitleGlow0:setTopBottom( true, true, -3, 3 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setRGB( 1, 1, 1 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local weaponNameLabel = LUI.UIText.new()
	weaponNameLabel:setLeftRight( false, true, -292, -5.93 )
	weaponNameLabel:setTopBottom( false, false, -13, 19 )
	weaponNameLabel:setRGB( 0, 0, 0 )
	weaponNameLabel:setTTF( "fonts/Entovo.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, text )
		ScaleWidgetToLabelRightAligned( self, element, 2 )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	self.close = function ( self )
		self.cacItemTitleGlow0:close()
		self.weaponNameLabel:close()
		CoD.KillcamWidgetTeamNameR.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

