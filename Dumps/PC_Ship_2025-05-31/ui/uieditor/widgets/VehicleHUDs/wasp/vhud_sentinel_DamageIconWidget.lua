require( "ui.uieditor.widgets.VehicleHUDs.genericVHUDdamageArea" )

CoD.vhud_sentinel_DamageIconWidget = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_DamageIconWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_DamageIconWidget )
	self.id = "vhud_sentinel_DamageIconWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 158 )
	self:setTopBottom( true, false, 0, 71 )
	self.anyChildUsesUpdateState = true
	
	local DamageIconLine0 = LUI.UIImage.new()
	DamageIconLine0:setLeftRight( false, false, -79.22, 79.22 )
	DamageIconLine0:setTopBottom( false, false, -35.65, 35.65 )
	DamageIconLine0:setRGB( 0.6, 0.82, 0.91 )
	DamageIconLine0:setAlpha( 0.3 )
	DamageIconLine0:setZoom( -20 )
	DamageIconLine0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_damageiconline" ) )
	DamageIconLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DamageIconLine0 )
	self.DamageIconLine0 = DamageIconLine0
	
	local DamageIconRed = LUI.UIImage.new()
	DamageIconRed:setLeftRight( false, false, -79.22, 79.22 )
	DamageIconRed:setTopBottom( false, false, -35.65, 35.65 )
	DamageIconRed:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_damageiconred" ) )
	DamageIconRed:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	DamageIconRed:setShaderVector( 1, 0, 0, 0, 0 )
	DamageIconRed:setShaderVector( 2, 1, 0, 0, 0 )
	DamageIconRed:setShaderVector( 3, 0, 0, 0, 0 )
	DamageIconRed:linkToElementModel( self, "damage", true, function ( model )
		local damage = Engine.GetModelValue( model )
		if damage then
			DamageIconRed:setShaderVector( 0, CoD.GetVectorComponentFromString( damage, 1 ), CoD.GetVectorComponentFromString( damage, 2 ), CoD.GetVectorComponentFromString( damage, 3 ), CoD.GetVectorComponentFromString( damage, 4 ) )
		end
	end )
	self:addElement( DamageIconRed )
	self.DamageIconRed = DamageIconRed
	
	local DamageIconLine = LUI.UIImage.new()
	DamageIconLine:setLeftRight( false, false, -79.22, 79.22 )
	DamageIconLine:setTopBottom( false, false, -35.65, 35.65 )
	DamageIconLine:setRGB( 0.6, 0.82, 0.91 )
	DamageIconLine:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_damageiconline" ) )
	DamageIconLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DamageIconLine )
	self.DamageIconLine = DamageIconLine
	
	local DamageIconDots = LUI.UIImage.new()
	DamageIconDots:setLeftRight( false, false, -79.22, 79.22 )
	DamageIconDots:setTopBottom( false, false, -35.65, 35.65 )
	DamageIconDots:setRGB( 0.6, 0.82, 0.91 )
	DamageIconDots:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_damageicondots" ) )
	DamageIconDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DamageIconDots )
	self.DamageIconDots = DamageIconDots
	
	local genericVHUDdamageArea0 = CoD.genericVHUDdamageArea.new( menu, controller )
	genericVHUDdamageArea0:setLeftRight( true, false, 29, 129 )
	genericVHUDdamageArea0:setTopBottom( true, false, -14.5, 85.5 )
	genericVHUDdamageArea0:setAlpha( 0 )
	genericVHUDdamageArea0:linkToElementModel( self, nil, false, function ( model )
		genericVHUDdamageArea0:setModel( model, controller )
	end )
	self:addElement( genericVHUDdamageArea0 )
	self.genericVHUDdamageArea0 = genericVHUDdamageArea0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				DamageIconLine0:completeAnimation()
				self.DamageIconLine0:setAlpha( 0.3 )
				self.clipFinished( DamageIconLine0, {} )
				DamageIconRed:completeAnimation()
				self.DamageIconRed:setAlpha( 1 )
				self.clipFinished( DamageIconRed, {} )
				DamageIconLine:completeAnimation()
				self.DamageIconLine:setAlpha( 1 )
				self.clipFinished( DamageIconLine, {} )
				DamageIconDots:completeAnimation()
				self.DamageIconDots:setAlpha( 1 )
				self.clipFinished( DamageIconDots, {} )
				genericVHUDdamageArea0:completeAnimation()
				self.genericVHUDdamageArea0:setAlpha( 0 )
				self.clipFinished( genericVHUDdamageArea0, {} )
			end
		},
		RAPS = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				DamageIconLine0:completeAnimation()
				self.DamageIconLine0:setAlpha( 0 )
				self.clipFinished( DamageIconLine0, {} )
				DamageIconRed:completeAnimation()
				self.DamageIconRed:setAlpha( 0 )
				self.clipFinished( DamageIconRed, {} )
				DamageIconLine:completeAnimation()
				self.DamageIconLine:setAlpha( 0 )
				self.clipFinished( DamageIconLine, {} )
				DamageIconDots:completeAnimation()
				self.DamageIconDots:setAlpha( 0 )
				self.clipFinished( DamageIconDots, {} )
				genericVHUDdamageArea0:completeAnimation()
				self.genericVHUDdamageArea0:setAlpha( 1 )
				self.clipFinished( genericVHUDdamageArea0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "RAPS",
			condition = function ( menu, element, event )
				return IsCampaign() and IsVehicleOfType( controller, "raps" )
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
		element.genericVHUDdamageArea0:close()
		element.DamageIconRed:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

