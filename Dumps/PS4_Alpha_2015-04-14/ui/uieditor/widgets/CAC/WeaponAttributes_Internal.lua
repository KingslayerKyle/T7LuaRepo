require( "ui.uieditor.widgets.CAC.WeaponAttributesBar" )

CoD.WeaponAttributes_Internal = InheritFrom( LUI.UIElement )
CoD.WeaponAttributes_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponAttributes_Internal )
	self.id = "WeaponAttributes_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 84 )
	self.anyChildUsesUpdateState = true
	
	local damageLabel = LUI.UITightText.new()
	damageLabel:setLeftRight( true, false, 0, 62 )
	damageLabel:setTopBottom( true, false, 2, 22 )
	damageLabel:setRGB( 0.76, 0.76, 0.76 )
	damageLabel:setText( Engine.Localize( "MPUI_DAMAGE_CAPS" ) )
	damageLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	damageLabel:setLetterSpacing( 0.6 )
	self:addElement( damageLabel )
	self.damageLabel = damageLabel
	
	local rangeLabel = LUI.UITightText.new()
	rangeLabel:setLeftRight( true, false, 0, 51 )
	rangeLabel:setTopBottom( true, false, 22, 42 )
	rangeLabel:setRGB( 0.76, 0.76, 0.76 )
	rangeLabel:setText( Engine.Localize( "MPUI_RANGE_CAPS" ) )
	rangeLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rangeLabel:setLetterSpacing( 0.6 )
	self:addElement( rangeLabel )
	self.rangeLabel = rangeLabel
	
	local fireRangeLabel = LUI.UITightText.new()
	fireRangeLabel:setLeftRight( true, false, 0, 79 )
	fireRangeLabel:setTopBottom( true, false, 42, 62 )
	fireRangeLabel:setRGB( 0.76, 0.76, 0.76 )
	fireRangeLabel:setText( Engine.Localize( "MPUI_FIRE_RATE_CAPS" ) )
	fireRangeLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	fireRangeLabel:setLetterSpacing( 0.6 )
	self:addElement( fireRangeLabel )
	self.fireRangeLabel = fireRangeLabel
	
	local accuracyLabel = LUI.UITightText.new()
	accuracyLabel:setLeftRight( true, false, 0, 74 )
	accuracyLabel:setTopBottom( true, false, 62, 82 )
	accuracyLabel:setRGB( 0.76, 0.76, 0.76 )
	accuracyLabel:setText( Engine.Localize( "MPUI_ACCURACY_CAPS" ) )
	accuracyLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	accuracyLabel:setLetterSpacing( 0.6 )
	self:addElement( accuracyLabel )
	self.accuracyLabel = accuracyLabel
	
	local accuracyAttribute = CoD.WeaponAttributesBar.new( menu, controller )
	accuracyAttribute:setLeftRight( true, false, 82, 353 )
	accuracyAttribute:setTopBottom( true, false, 66, 80 )
	accuracyAttribute:setRGB( 1, 1, 1 )
	accuracyAttribute:linkToElementModel( self, "accuracy", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			accuracyAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( accuracyAttribute )
	self.accuracyAttribute = accuracyAttribute
	
	local fireRateAttribute = CoD.WeaponAttributesBar.new( menu, controller )
	fireRateAttribute:setLeftRight( true, false, 82, 353 )
	fireRateAttribute:setTopBottom( true, false, 46, 60 )
	fireRateAttribute:setRGB( 1, 1, 1 )
	fireRateAttribute:linkToElementModel( self, "fireRate", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			fireRateAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( fireRateAttribute )
	self.fireRateAttribute = fireRateAttribute
	
	local rangeAttribute = CoD.WeaponAttributesBar.new( menu, controller )
	rangeAttribute:setLeftRight( true, false, 82, 353 )
	rangeAttribute:setTopBottom( true, false, 25, 39 )
	rangeAttribute:setRGB( 1, 1, 1 )
	rangeAttribute:linkToElementModel( self, "range", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rangeAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( rangeAttribute )
	self.rangeAttribute = rangeAttribute
	
	local damageAttribute = CoD.WeaponAttributesBar.new( menu, controller )
	damageAttribute:setLeftRight( true, false, 82, 353 )
	damageAttribute:setTopBottom( true, false, 4, 18 )
	damageAttribute:setRGB( 1, 1, 1 )
	damageAttribute:linkToElementModel( self, "damage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			damageAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( damageAttribute )
	self.damageAttribute = damageAttribute
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( true, false, 188, 364 )
	frame:setTopBottom( true, false, -2, 86 )
	frame:setRGB( 1, 1, 1 )
	frame:setImage( RegisterImage( "uie_t7_menu_cac_weaponstatsframe" ) )
	frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( frame )
	self.frame = frame
	
	local Pixel1 = LUI.UIImage.new()
	Pixel1:setLeftRight( true, false, 380, 416 )
	Pixel1:setTopBottom( true, false, -1, 3 )
	Pixel1:setRGB( 1, 1, 1 )
	Pixel1:setAlpha( 0.2 )
	Pixel1:setYRot( -180 )
	Pixel1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 380, 416 )
	Pixel2:setTopBottom( true, false, 82, 86 )
	Pixel2:setRGB( 1, 1, 1 )
	Pixel2:setAlpha( 0.2 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	self.close = function ( self )
		self.accuracyAttribute:close()
		self.fireRateAttribute:close()
		self.rangeAttribute:close()
		self.damageAttribute:close()
		CoD.WeaponAttributes_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

