require( "ui.uieditor.widgets.VehicleHUDs.genericVHUDdamageArea" )

CoD.dpsHUD_DamageIconWidget = InheritFrom( LUI.UIElement )
CoD.dpsHUD_DamageIconWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.dpsHUD_DamageIconWidget )
	self.id = "dpsHUD_DamageIconWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local mlrs = CoD.genericVHUDdamageArea.new( menu, controller )
	mlrs:setLeftRight( false, false, -50, 50 )
	mlrs:setTopBottom( false, false, -50, 50 )
	mlrs.lineBack:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_quadmlrs_damageiconlinergb" ) )
	mlrs.fill:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_quadmlrs_damageiconred" ) )
	mlrs.lineFront:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_quadmlrs_damageiconlinergb" ) )
	mlrs:linkToElementModel( self, nil, false, function ( model )
		mlrs:setModel( model, controller )
	end )
	self:addElement( mlrs )
	self.mlrs = mlrs
	
	local quadtank = CoD.genericVHUDdamageArea.new( menu, controller )
	quadtank:setLeftRight( false, false, -50, 50 )
	quadtank:setTopBottom( false, false, -50, 50 )
	quadtank:setAlpha( 0 )
	quadtank.lineBack:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_quadtank_damageiconlinergb" ) )
	quadtank.fill:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_quadtank_damageiconred" ) )
	quadtank.lineFront:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_quadtank_damageiconlinergb" ) )
	quadtank:linkToElementModel( self, nil, false, function ( model )
		quadtank:setModel( model, controller )
	end )
	self:addElement( quadtank )
	self.quadtank = quadtank
	
	local siegebot = CoD.genericVHUDdamageArea.new( menu, controller )
	siegebot:setLeftRight( false, false, -50, 50 )
	siegebot:setTopBottom( false, false, -50, 50 )
	siegebot:setAlpha( 0 )
	siegebot.lineBack:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_siegbot_damageiconlinergb" ) )
	siegebot.fill:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_siegbot_damageiconred" ) )
	siegebot.lineFront:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_siegbot_damageiconlinergb" ) )
	siegebot:linkToElementModel( self, nil, false, function ( model )
		siegebot:setModel( model, controller )
	end )
	self:addElement( siegebot )
	self.siegebot = siegebot
	
	local amws = CoD.genericVHUDdamageArea.new( menu, controller )
	amws:setLeftRight( false, false, -50, 50 )
	amws:setTopBottom( false, false, -42, 42 )
	amws:setAlpha( 0 )
	amws.lineBack:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_damageiconlinergb" ) )
	amws.fill:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_damageiconred" ) )
	amws.lineFront:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_damageiconlinergb" ) )
	amws:linkToElementModel( self, nil, false, function ( model )
		amws:setModel( model, controller )
	end )
	self:addElement( amws )
	self.amws = amws
	
	local turret = CoD.genericVHUDdamageArea.new( menu, controller )
	turret:setLeftRight( false, false, -50, 50 )
	turret:setTopBottom( false, false, -50, 50 )
	turret:setAlpha( 0 )
	turret.lineBack:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_turret_damageiconlinergb" ) )
	turret.fill:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_turret_damageiconred" ) )
	turret.lineFront:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_turret_damageiconlinergb" ) )
	turret:linkToElementModel( self, nil, false, function ( model )
		turret:setModel( model, controller )
	end )
	self:addElement( turret )
	self.turret = turret
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				mlrs:completeAnimation()
				self.mlrs:setAlpha( 0 )
				self.clipFinished( mlrs, {} )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MLRS = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				mlrs:completeAnimation()
				self.mlrs:setAlpha( 1 )
				self.clipFinished( mlrs, {} )
			end
		},
		Quadtank = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				mlrs:completeAnimation()
				self.mlrs:setAlpha( 0 )
				self.clipFinished( mlrs, {} )
				quadtank:completeAnimation()
				self.quadtank:setAlpha( 1 )
				self.clipFinished( quadtank, {} )
			end
		},
		Siegebot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				mlrs:completeAnimation()
				self.mlrs:setAlpha( 0 )
				self.clipFinished( mlrs, {} )
				siegebot:completeAnimation()
				self.siegebot:setAlpha( 1 )
				self.clipFinished( siegebot, {} )
			end
		},
		AMWS = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				mlrs:completeAnimation()
				self.mlrs:setAlpha( 0 )
				self.clipFinished( mlrs, {} )
				amws:completeAnimation()
				self.amws:setAlpha( 1 )
				self.clipFinished( amws, {} )
			end
		},
		Turret = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				mlrs:completeAnimation()
				self.mlrs:setAlpha( 0 )
				self.clipFinished( mlrs, {} )
				turret:completeAnimation()
				self.turret:setAlpha( 1 )
				self.clipFinished( turret, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "MLRS",
			condition = function ( menu, element, event )
				return IsVehicleOfType( controller, "mlrs" )
			end
		},
		{
			stateName = "Quadtank",
			condition = function ( menu, element, event )
				return IsVehicleOfType( controller, "quadtank" )
			end
		},
		{
			stateName = "Siegebot",
			condition = function ( menu, element, event )
				return IsVehicleOfType( controller, "siegebot" )
			end
		},
		{
			stateName = "AMWS",
			condition = function ( menu, element, event )
				return IsVehicleOfType( controller, "amws", "pamws" )
			end
		},
		{
			stateName = "Turret",
			condition = function ( menu, element, event )
				return IsVehicleOfType( controller, "turret" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "vehicle.vehicleType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicle.vehicleType"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.mlrs:close()
		element.quadtank:close()
		element.siegebot:close()
		element.amws:close()
		element.turret:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

