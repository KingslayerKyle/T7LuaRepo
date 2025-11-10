require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatBaseWeaponValue" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatVariantValue" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatName" )

CoD.GunsmithStatElement = InheritFrom( LUI.UIElement )
CoD.GunsmithStatElement.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatElement )
	self.id = "GunsmithStatElement"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 24 )
	
	local weaponStatValue = CoD.GunsmithStatBaseWeaponValue.new( menu, controller )
	weaponStatValue:setLeftRight( true, true, 0, 0 )
	weaponStatValue:setTopBottom( true, false, 0, 24 )
	weaponStatValue:linkToElementModel( self, nil, false, function ( model )
		weaponStatValue:setModel( model, controller )
	end )
	weaponStatValue:linkToElementModel( self, "weaponStatValue", true, function ( model )
		local _weaponStatValue = Engine.GetModelValue( model )
		if _weaponStatValue then
			weaponStatValue.weaponStatValue:setText( Engine.Localize( _weaponStatValue ) )
		end
	end )
	self:addElement( weaponStatValue )
	self.weaponStatValue = weaponStatValue
	
	local variantStatValue = CoD.GunsmithStatVariantValue.new( menu, controller )
	variantStatValue:setLeftRight( true, true, 0, 0 )
	variantStatValue:setTopBottom( true, false, 0, 24 )
	variantStatValue:linkToElementModel( self, nil, false, function ( model )
		variantStatValue:setModel( model, controller )
	end )
	variantStatValue:linkToElementModel( self, "variantStatValue", true, function ( model )
		local _variantStatValue = Engine.GetModelValue( model )
		if _variantStatValue then
			variantStatValue.variantValue:setText( Engine.Localize( _variantStatValue ) )
		end
	end )
	self:addElement( variantStatValue )
	self.variantStatValue = variantStatValue
	
	local statName = CoD.GunsmithStatName.new( menu, controller )
	statName:setLeftRight( true, true, 0, 0 )
	statName:setTopBottom( true, false, 0, 24 )
	statName:linkToElementModel( self, nil, false, function ( model )
		statName:setModel( model, controller )
	end )
	statName:linkToElementModel( self, "statName", true, function ( model )
		local _statName = Engine.GetModelValue( model )
		if _statName then
			statName.statName:setText( Engine.Localize( _statName ) )
		end
	end )
	self:addElement( statName )
	self.statName = statName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponStatValue:completeAnimation()
				self.weaponStatValue:setAlpha( 0 )
				self.clipFinished( weaponStatValue, {} )
				variantStatValue:completeAnimation()
				self.variantStatValue:setAlpha( 0 )
				self.clipFinished( variantStatValue, {} )
				statName:completeAnimation()
				self.statName:setAlpha( 1 )
				self.clipFinished( statName, {} )
			end
		},
		StatName = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponStatValue:completeAnimation()
				self.weaponStatValue:setAlpha( 0 )
				self.clipFinished( weaponStatValue, {} )
				variantStatValue:completeAnimation()
				self.variantStatValue:setAlpha( 0 )
				self.clipFinished( variantStatValue, {} )
				statName:completeAnimation()
				self.statName:setAlpha( 1 )
				self.clipFinished( statName, {} )
			end
		},
		VariantStatValue = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponStatValue:completeAnimation()
				self.weaponStatValue:setAlpha( 0 )
				self.clipFinished( weaponStatValue, {} )
				variantStatValue:completeAnimation()
				self.variantStatValue:setAlpha( 1 )
				self.clipFinished( variantStatValue, {} )
				statName:completeAnimation()
				self.statName:setAlpha( 0 )
				self.clipFinished( statName, {} )
			end
		},
		WeaponStatValue = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponStatValue:completeAnimation()
				self.weaponStatValue:setAlpha( 1 )
				self.clipFinished( weaponStatValue, {} )
				variantStatValue:completeAnimation()
				self.variantStatValue:setAlpha( 0 )
				self.clipFinished( variantStatValue, {} )
				statName:completeAnimation()
				self.statName:setAlpha( 0 )
				self.clipFinished( statName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "StatName",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "statName" )
			end
		},
		{
			stateName = "VariantStatValue",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "variantStatValue" )
			end
		},
		{
			stateName = "WeaponStatValue",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "weaponStatValue" )
			end
		}
	} )
	self:linkToElementModel( self, "type", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "type"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weaponStatValue:close()
		element.variantStatValue:close()
		element.statName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

