require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_missile" )

CoD.vhud_agr_NotificationMissiles = InheritFrom( LUI.UIElement )
CoD.vhud_agr_NotificationMissiles.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_NotificationMissiles )
	self.id = "vhud_agr_NotificationMissiles"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 83 )
	self.anyChildUsesUpdateState = true
	
	local firstMissile0 = CoD.vhud_agr_missile.new( menu, controller )
	firstMissile0:setLeftRight( false, false, -42, 42 )
	firstMissile0:setTopBottom( false, false, -38.64, -4.36 )
	firstMissile0:linkToElementModel( self, nil, false, function ( model )
		firstMissile0:setModel( model, controller )
	end )
	firstMissile0:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 3 )
			end
		}
	} )
	firstMissile0:linkToElementModel( firstMissile0, "ammo", true, function ( model )
		menu:updateElementState( firstMissile0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( firstMissile0 )
	self.firstMissile0 = firstMissile0
	
	local secondMissile = CoD.vhud_agr_missile.new( menu, controller )
	secondMissile:setLeftRight( false, false, -42, 42 )
	secondMissile:setTopBottom( false, false, -20.5, 10.78 )
	secondMissile:linkToElementModel( self, nil, false, function ( model )
		secondMissile:setModel( model, controller )
	end )
	secondMissile:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 2 )
			end
		}
	} )
	secondMissile:linkToElementModel( secondMissile, "ammo", true, function ( model )
		menu:updateElementState( secondMissile, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( secondMissile )
	self.secondMissile = secondMissile
	
	local thirdMissile = CoD.vhud_agr_missile.new( menu, controller )
	thirdMissile:setLeftRight( false, false, -42, 42 )
	thirdMissile:setTopBottom( false, false, -4.86, 27.41 )
	thirdMissile:linkToElementModel( self, nil, false, function ( model )
		thirdMissile:setModel( model, controller )
	end )
	thirdMissile:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 1 )
			end
		}
	} )
	thirdMissile:linkToElementModel( thirdMissile, "ammo", true, function ( model )
		menu:updateElementState( thirdMissile, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( thirdMissile )
	self.thirdMissile = thirdMissile
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( false, false, -18.5, 18.5 )
	Bar:setTopBottom( false, false, 24.21, 28.61 )
	Bar:setRGB( 0.74, 0.99, 0.84 )
	Bar:setYRot( 130 )
	Bar:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebar" ) )
	Bar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bar )
	self.Bar = Bar
	
	local solidbar = LUI.UIImage.new()
	solidbar:setLeftRight( false, false, -18.5, 18.5 )
	solidbar:setTopBottom( false, false, 24.21, 28.62 )
	solidbar:setRGB( 0.74, 0.99, 0.84 )
	solidbar:setYRot( -50 )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.firstMissile0:close()
		element.secondMissile:close()
		element.thirdMissile:close()
		element.solidbar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

