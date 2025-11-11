require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatBaseWeaponValue" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatName" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatVariantValue" )

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
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local weaponStatValue = CoD.GunsmithStatBaseWeaponValue.new( menu, controller )
	weaponStatValue:setLeftRight( 0, 1, 0, 0 )
	weaponStatValue:setTopBottom( 0, 0, 0, 36 )
	weaponStatValue:linkToElementModel( self, nil, false, function ( model )
		weaponStatValue:setModel( model, controller )
	end )
	weaponStatValue:linkToElementModel( self, "weaponStatValue", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponStatValue.weaponStatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( weaponStatValue )
	self.weaponStatValue = weaponStatValue
	
	local variantStatValue = CoD.GunsmithStatVariantValue.new( menu, controller )
	variantStatValue:setLeftRight( 0, 1, 0, 0 )
	variantStatValue:setTopBottom( 0, 0, 0, 36 )
	variantStatValue:linkToElementModel( self, nil, false, function ( model )
		variantStatValue:setModel( model, controller )
	end )
	variantStatValue:linkToElementModel( self, "variantStatValue", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			variantStatValue.variantValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( variantStatValue )
	self.variantStatValue = variantStatValue
	
	local statName = CoD.GunsmithStatName.new( menu, controller )
	statName:setLeftRight( 0, 1, 0, 0 )
	statName:setTopBottom( 0, 0, 0, 36 )
	statName:linkToElementModel( self, nil, false, function ( model )
		statName:setModel( model, controller )
	end )
	statName:linkToElementModel( self, "statName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			statName.statName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( statName )
	self.statName = statName
	
	self.resetProperties = function ()
		variantStatValue:completeAnimation()
		weaponStatValue:completeAnimation()
		statName:completeAnimation()
		variantStatValue:setAlpha( 1 )
		weaponStatValue:setAlpha( 1 )
		statName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				weaponStatValue:completeAnimation()
				self.weaponStatValue:setAlpha( 0 )
				self.clipFinished( weaponStatValue, {} )
				variantStatValue:completeAnimation()
				self.variantStatValue:setAlpha( 0 )
				self.clipFinished( variantStatValue, {} )
			end
		},
		StatName = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				weaponStatValue:completeAnimation()
				self.weaponStatValue:setAlpha( 0 )
				self.clipFinished( weaponStatValue, {} )
				variantStatValue:completeAnimation()
				self.variantStatValue:setAlpha( 0 )
				self.clipFinished( variantStatValue, {} )
			end
		},
		VariantStatValue = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				weaponStatValue:completeAnimation()
				self.weaponStatValue:setAlpha( 0 )
				self.clipFinished( weaponStatValue, {} )
				statName:completeAnimation()
				self.statName:setAlpha( 0 )
				self.clipFinished( statName, {} )
			end
		},
		WeaponStatValue = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.weaponStatValue:close()
		self.variantStatValue:close()
		self.statName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

