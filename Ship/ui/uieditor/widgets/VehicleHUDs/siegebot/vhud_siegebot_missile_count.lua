-- b89eb1175aca6f568fbdac64c92556aa
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_missile_icon" )

CoD.vhud_siegebot_missile_count = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_missile_count.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_siegebot_missile_count )
	self.id = "vhud_siegebot_missile_count"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 83 )
	self.anyChildUsesUpdateState = true
	
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
	
	local vhudsiegebotmissileicon1 = CoD.vhud_siegebot_missile_icon.new( menu, controller )
	vhudsiegebotmissileicon1:setLeftRight( true, false, -8, 92 )
	vhudsiegebotmissileicon1:setTopBottom( true, false, 37.28, 68.28 )
	vhudsiegebotmissileicon1:setYRot( 180 )
	vhudsiegebotmissileicon1:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotmissileicon1:setModel( model, controller )
	end )
	vhudsiegebotmissileicon1:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 1 )
			end
		}
	} )
	vhudsiegebotmissileicon1:linkToElementModel( vhudsiegebotmissileicon1, "ammo", true, function ( model )
		menu:updateElementState( vhudsiegebotmissileicon1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( vhudsiegebotmissileicon1 )
	self.vhudsiegebotmissileicon1 = vhudsiegebotmissileicon1
	
	local vhudsiegebotmissileicon2 = CoD.vhud_siegebot_missile_icon.new( menu, controller )
	vhudsiegebotmissileicon2:setLeftRight( true, false, -8, 92 )
	vhudsiegebotmissileicon2:setTopBottom( true, false, 21.14, 52.14 )
	vhudsiegebotmissileicon2:setYRot( 180 )
	vhudsiegebotmissileicon2:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotmissileicon2:setModel( model, controller )
	end )
	vhudsiegebotmissileicon2:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 2 )
			end
		}
	} )
	vhudsiegebotmissileicon2:linkToElementModel( vhudsiegebotmissileicon2, "ammo", true, function ( model )
		menu:updateElementState( vhudsiegebotmissileicon2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( vhudsiegebotmissileicon2 )
	self.vhudsiegebotmissileicon2 = vhudsiegebotmissileicon2
	
	local vhudsiegebotmissileicon3 = CoD.vhud_siegebot_missile_icon.new( menu, controller )
	vhudsiegebotmissileicon3:setLeftRight( true, false, -8, 92 )
	vhudsiegebotmissileicon3:setTopBottom( true, false, 4.86, 35.86 )
	vhudsiegebotmissileicon3:setYRot( 180 )
	vhudsiegebotmissileicon3:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotmissileicon3:setModel( model, controller )
	end )
	vhudsiegebotmissileicon3:mergeStateConditions( {
		{
			stateName = "Armed",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 3 )
			end
		}
	} )
	vhudsiegebotmissileicon3:linkToElementModel( vhudsiegebotmissileicon3, "ammo", true, function ( model )
		menu:updateElementState( vhudsiegebotmissileicon3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( vhudsiegebotmissileicon3 )
	self.vhudsiegebotmissileicon3 = vhudsiegebotmissileicon3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsiegebotmissileicon1:close()
		element.vhudsiegebotmissileicon2:close()
		element.vhudsiegebotmissileicon3:close()
		element.solidbar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
