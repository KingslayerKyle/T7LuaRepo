CoD.PersonalizeSpecTitle = InheritFrom( LUI.UIElement )
CoD.PersonalizeSpecTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeSpecTitle )
	self.id = "PersonalizeSpecTitle"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 562 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local weaponNameLabel = LUI.UITightText.new()
	weaponNameLabel:setLeftRight( 0, 0, 0, 562 )
	weaponNameLabel:setTopBottom( 0, 0, 0, 36 )
	weaponNameLabel:setRGB( 0.97, 0.32, 0.05 )
	weaponNameLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponNameLabel:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, text )
		ScaleWidgetToLabelLeftJustify( self, element, 2 )
		SetStateFromText( self, element, "DefaultState", "NoText" )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.weaponNameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

