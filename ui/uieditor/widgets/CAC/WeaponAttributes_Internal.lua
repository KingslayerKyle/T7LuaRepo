-- 0a519fa6838b81287786fe1f4d832127
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 372 )
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
	accuracyAttribute:setLeftRight( true, false, 88, 368 )
	accuracyAttribute:setTopBottom( true, false, 66, 80 )
	accuracyAttribute:linkToElementModel( self, nil, false, function ( model )
		accuracyAttribute:setModel( model, controller )
	end )
	accuracyAttribute:linkToElementModel( self, "accuracy", true, function ( model )
		local accuracy = Engine.GetModelValue( model )
		if accuracy then
			accuracyAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( controller, CoD.GetVectorComponentFromString( accuracy, 1 ), CoD.GetVectorComponentFromString( accuracy, 2 ), CoD.GetVectorComponentFromString( accuracy, 3 ), CoD.GetVectorComponentFromString( accuracy, 4 ) ) )
		end
	end )
	accuracyAttribute:linkToElementModel( self, "accuracy", true, function ( model )
		local accuracy = Engine.GetModelValue( model )
		if accuracy then
			accuracyAttribute.attachmentAttribute:setShaderVector( 0, GetWeaponAttributesForAttachment( controller, CoD.GetVectorComponentFromString( accuracy, 1 ), CoD.GetVectorComponentFromString( accuracy, 2 ), CoD.GetVectorComponentFromString( accuracy, 3 ), CoD.GetVectorComponentFromString( accuracy, 4 ) ) )
		end
	end )
	accuracyAttribute:mergeStateConditions( {
		{
			stateName = "Increase",
			condition = function ( menu, element, event )
				return IsCACWeaponAttributeIncrease( element, controller, "accuracy" )
			end
		},
		{
			stateName = "Decrease",
			condition = function ( menu, element, event )
				return not IsCACWeaponAttributeIncrease( element, controller, "accuracy" )
			end
		}
	} )
	accuracyAttribute:linkToElementModel( accuracyAttribute, "accuracy", true, function ( model )
		menu:updateElementState( accuracyAttribute, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "accuracy"
		} )
	end )
	self:addElement( accuracyAttribute )
	self.accuracyAttribute = accuracyAttribute
	
	local fireRateAttribute = CoD.WeaponAttributesBar.new( menu, controller )
	fireRateAttribute:setLeftRight( true, false, 88, 368 )
	fireRateAttribute:setTopBottom( true, false, 45, 59 )
	fireRateAttribute:linkToElementModel( self, nil, false, function ( model )
		fireRateAttribute:setModel( model, controller )
	end )
	fireRateAttribute:linkToElementModel( self, "fireRate", true, function ( model )
		local fireRate = Engine.GetModelValue( model )
		if fireRate then
			fireRateAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( controller, CoD.GetVectorComponentFromString( fireRate, 1 ), CoD.GetVectorComponentFromString( fireRate, 2 ), CoD.GetVectorComponentFromString( fireRate, 3 ), CoD.GetVectorComponentFromString( fireRate, 4 ) ) )
		end
	end )
	fireRateAttribute:linkToElementModel( self, "fireRate", true, function ( model )
		local fireRate = Engine.GetModelValue( model )
		if fireRate then
			fireRateAttribute.attachmentAttribute:setShaderVector( 0, GetWeaponAttributesForAttachment( controller, CoD.GetVectorComponentFromString( fireRate, 1 ), CoD.GetVectorComponentFromString( fireRate, 2 ), CoD.GetVectorComponentFromString( fireRate, 3 ), CoD.GetVectorComponentFromString( fireRate, 4 ) ) )
		end
	end )
	fireRateAttribute:mergeStateConditions( {
		{
			stateName = "Increase",
			condition = function ( menu, element, event )
				return IsCACWeaponAttributeIncrease( element, controller, "fireRate" )
			end
		},
		{
			stateName = "Decrease",
			condition = function ( menu, element, event )
				return not IsCACWeaponAttributeIncrease( element, controller, "fireRate" )
			end
		}
	} )
	fireRateAttribute:linkToElementModel( fireRateAttribute, "fireRate", true, function ( model )
		menu:updateElementState( fireRateAttribute, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fireRate"
		} )
	end )
	self:addElement( fireRateAttribute )
	self.fireRateAttribute = fireRateAttribute
	
	local rangeAttribute = CoD.WeaponAttributesBar.new( menu, controller )
	rangeAttribute:setLeftRight( true, false, 88, 368 )
	rangeAttribute:setTopBottom( true, false, 25, 39 )
	rangeAttribute:linkToElementModel( self, nil, false, function ( model )
		rangeAttribute:setModel( model, controller )
	end )
	rangeAttribute:linkToElementModel( self, "range", true, function ( model )
		local range = Engine.GetModelValue( model )
		if range then
			rangeAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( controller, CoD.GetVectorComponentFromString( range, 1 ), CoD.GetVectorComponentFromString( range, 2 ), CoD.GetVectorComponentFromString( range, 3 ), CoD.GetVectorComponentFromString( range, 4 ) ) )
		end
	end )
	rangeAttribute:linkToElementModel( self, "range", true, function ( model )
		local range = Engine.GetModelValue( model )
		if range then
			rangeAttribute.attachmentAttribute:setShaderVector( 0, GetWeaponAttributesForAttachment( controller, CoD.GetVectorComponentFromString( range, 1 ), CoD.GetVectorComponentFromString( range, 2 ), CoD.GetVectorComponentFromString( range, 3 ), CoD.GetVectorComponentFromString( range, 4 ) ) )
		end
	end )
	rangeAttribute:mergeStateConditions( {
		{
			stateName = "Increase",
			condition = function ( menu, element, event )
				return IsCACWeaponAttributeIncrease( element, controller, "range" )
			end
		},
		{
			stateName = "Decrease",
			condition = function ( menu, element, event )
				return not IsCACWeaponAttributeIncrease( element, controller, "range" )
			end
		}
	} )
	rangeAttribute:linkToElementModel( rangeAttribute, "range", true, function ( model )
		menu:updateElementState( rangeAttribute, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "range"
		} )
	end )
	self:addElement( rangeAttribute )
	self.rangeAttribute = rangeAttribute
	
	local damageAttribute = CoD.WeaponAttributesBar.new( menu, controller )
	damageAttribute:setLeftRight( true, false, 88, 368 )
	damageAttribute:setTopBottom( true, false, 4, 18 )
	damageAttribute:linkToElementModel( self, nil, false, function ( model )
		damageAttribute:setModel( model, controller )
	end )
	damageAttribute:linkToElementModel( self, "damage", true, function ( model )
		local damage = Engine.GetModelValue( model )
		if damage then
			damageAttribute.weaponAttribute:setShaderVector( 0, GetWeaponAttributes( controller, CoD.GetVectorComponentFromString( damage, 1 ), CoD.GetVectorComponentFromString( damage, 2 ), CoD.GetVectorComponentFromString( damage, 3 ), CoD.GetVectorComponentFromString( damage, 4 ) ) )
		end
	end )
	damageAttribute:linkToElementModel( self, "damage", true, function ( model )
		local damage = Engine.GetModelValue( model )
		if damage then
			damageAttribute.attachmentAttribute:setShaderVector( 0, GetWeaponAttributesForAttachment( controller, CoD.GetVectorComponentFromString( damage, 1 ), CoD.GetVectorComponentFromString( damage, 2 ), CoD.GetVectorComponentFromString( damage, 3 ), CoD.GetVectorComponentFromString( damage, 4 ) ) )
		end
	end )
	damageAttribute:mergeStateConditions( {
		{
			stateName = "Increase",
			condition = function ( menu, element, event )
				return IsCACWeaponAttributeIncrease( element, controller, "damage" )
			end
		},
		{
			stateName = "Decrease",
			condition = function ( menu, element, event )
				return not IsCACWeaponAttributeIncrease( element, controller, "damage" )
			end
		}
	} )
	damageAttribute:linkToElementModel( damageAttribute, "damage", true, function ( model )
		menu:updateElementState( damageAttribute, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "damage"
		} )
	end )
	self:addElement( damageAttribute )
	self.damageAttribute = damageAttribute
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( true, false, 199, 375 )
	frame:setTopBottom( true, false, -2, 86 )
	frame:setAlpha( 0.5 )
	frame:setImage( RegisterImage( "uie_t7_menu_cac_weaponstatsframe" ) )
	frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( frame )
	self.frame = frame
	
	local Pixel1 = LUI.UIImage.new()
	Pixel1:setLeftRight( true, false, 380, 416 )
	Pixel1:setTopBottom( true, false, -1, 3 )
	Pixel1:setAlpha( 0.2 )
	Pixel1:setYRot( -180 )
	Pixel1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 380, 416 )
	Pixel2:setTopBottom( true, false, 82, 86 )
	Pixel2:setAlpha( 0.2 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.accuracyAttribute:close()
		element.fireRateAttribute:close()
		element.rangeAttribute:close()
		element.damageAttribute:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

