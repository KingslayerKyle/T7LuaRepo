-- a0b81a41a8e4084ff179ce58197ec6e4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_missile" )

CoD.vhud_ms_missilesWidget = InheritFrom( LUI.UIElement )
CoD.vhud_ms_missilesWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_missilesWidget )
	self.id = "vhud_ms_missilesWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local vhudmsmissile = CoD.vhud_ms_missile.new( menu, controller )
	vhudmsmissile:setLeftRight( false, false, -31, 17 )
	vhudmsmissile:setTopBottom( false, false, -28.5, -10.5 )
	vhudmsmissile:setZRot( -90 )
	vhudmsmissile:linkToElementModel( self, nil, false, function ( model )
		vhudmsmissile:setModel( model, controller )
	end )
	vhudmsmissile:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammoReady", 1 )
			end
		}
	} )
	vhudmsmissile:linkToElementModel( vhudmsmissile, "ammoReady", true, function ( model )
		menu:updateElementState( vhudmsmissile, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoReady"
		} )
	end )
	self:addElement( vhudmsmissile )
	self.vhudmsmissile = vhudmsmissile
	
	local vhudmsmissile0 = CoD.vhud_ms_missile.new( menu, controller )
	vhudmsmissile0:setLeftRight( false, false, -16.56, 31.44 )
	vhudmsmissile0:setTopBottom( false, false, -28.5, -10.5 )
	vhudmsmissile0:setZRot( -90 )
	vhudmsmissile0:linkToElementModel( self, nil, false, function ( model )
		vhudmsmissile0:setModel( model, controller )
	end )
	vhudmsmissile0:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammoReady", 1 )
			end
		}
	} )
	vhudmsmissile0:linkToElementModel( vhudmsmissile0, "ammoReady", true, function ( model )
		menu:updateElementState( vhudmsmissile0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoReady"
		} )
	end )
	self:addElement( vhudmsmissile0 )
	self.vhudmsmissile0 = vhudmsmissile0
	
	local vhudmsmissile1 = CoD.vhud_ms_missile.new( menu, controller )
	vhudmsmissile1:setLeftRight( false, false, -31, 17 )
	vhudmsmissile1:setTopBottom( false, false, 10.5, 28.5 )
	vhudmsmissile1:setZRot( -90 )
	vhudmsmissile1:linkToElementModel( self, nil, false, function ( model )
		vhudmsmissile1:setModel( model, controller )
	end )
	vhudmsmissile1:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammoReady", 1 )
			end
		}
	} )
	vhudmsmissile1:linkToElementModel( vhudmsmissile1, "ammoReady", true, function ( model )
		menu:updateElementState( vhudmsmissile1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoReady"
		} )
	end )
	self:addElement( vhudmsmissile1 )
	self.vhudmsmissile1 = vhudmsmissile1
	
	local vhudmsmissile2 = CoD.vhud_ms_missile.new( menu, controller )
	vhudmsmissile2:setLeftRight( false, false, -16.56, 31.44 )
	vhudmsmissile2:setTopBottom( false, false, 10.5, 28.5 )
	vhudmsmissile2:setZRot( -90 )
	vhudmsmissile2:linkToElementModel( self, nil, false, function ( model )
		vhudmsmissile2:setModel( model, controller )
	end )
	vhudmsmissile2:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammoReady", 1 )
			end
		}
	} )
	vhudmsmissile2:linkToElementModel( vhudmsmissile2, "ammoReady", true, function ( model )
		menu:updateElementState( vhudmsmissile2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoReady"
		} )
	end )
	self:addElement( vhudmsmissile2 )
	self.vhudmsmissile2 = vhudmsmissile2
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( false, false, -16.56, 16.44 )
	Bar:setTopBottom( false, false, 40.8, 45.21 )
	Bar:setRGB( 0.74, 0.94, 0.99 )
	Bar:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebar" ) )
	Bar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bar )
	self.Bar = Bar
	
	local solidbar = LUI.UIImage.new()
	solidbar:setLeftRight( false, false, -16.56, 16.44 )
	solidbar:setTopBottom( false, false, 40.8, 45.21 )
	solidbar:setRGB( 0.74, 0.94, 0.99 )
	solidbar:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebarsolid" ) )
	solidbar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	solidbar:setShaderVector( 1, 0, 0, 0, 0 )
	solidbar:setShaderVector( 2, 1, 0, 0, 0 )
	solidbar:setShaderVector( 3, 0, 0, 0, 0 )
	solidbar:linkToElementModel( self, "ammoReady", true, function ( model )
		local ammoReady = Engine.GetModelValue( model )
		if ammoReady then
			solidbar:setShaderVector( 0, CoD.GetVectorComponentFromString( ammoReady, 1 ), CoD.GetVectorComponentFromString( ammoReady, 2 ), CoD.GetVectorComponentFromString( ammoReady, 3 ), CoD.GetVectorComponentFromString( ammoReady, 4 ) )
		end
	end )
	self:addElement( solidbar )
	self.solidbar = solidbar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Bar:completeAnimation()
				self.Bar:setAlpha( 1 )
				self.clipFinished( Bar, {} )
				solidbar:completeAnimation()
				self.solidbar:setAlpha( 1 )
				self.clipFinished( solidbar, {} )
			end
		},
		Charging = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Bar:completeAnimation()
				self.Bar:setAlpha( 1 )
				self.clipFinished( Bar, {} )
				solidbar:completeAnimation()
				self.solidbar:setAlpha( 1 )
				self.clipFinished( solidbar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Charging",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThan( element, controller, "ammoReady", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "ammoReady", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoReady"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsmissile:close()
		element.vhudmsmissile0:close()
		element.vhudmsmissile1:close()
		element.vhudmsmissile2:close()
		element.solidbar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

