CoD.VehicleGround_IrisInner = InheritFrom( LUI.UIElement )
CoD.VehicleGround_IrisInner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_IrisInner )
	self.id = "VehicleGround_IrisInner"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local IrisInner1 = LUI.UIImage.new()
	IrisInner1:setLeftRight( false, false, -630.5, -502.5 )
	IrisInner1:setTopBottom( false, false, -317, 307 )
	IrisInner1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisinner" ) )
	IrisInner1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisInner1 )
	self.IrisInner1 = IrisInner1
	
	local IrisInner2 = LUI.UIImage.new()
	IrisInner2:setLeftRight( false, false, 500.5, 628.5 )
	IrisInner2:setTopBottom( false, false, -293, 331 )
	IrisInner2:setZRot( -180 )
	IrisInner2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisinner" ) )
	IrisInner2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisInner2 )
	self.IrisInner2 = IrisInner2
	
	local IrisInner3 = LUI.UIImage.new()
	IrisInner3:setLeftRight( false, false, -327.5, -199.5 )
	IrisInner3:setTopBottom( false, false, -808, -184 )
	IrisInner3:setZRot( -61 )
	IrisInner3:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisinner" ) )
	IrisInner3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisInner3 )
	self.IrisInner3 = IrisInner3
	
	local IrisInner4 = LUI.UIImage.new()
	IrisInner4:setLeftRight( false, false, 263.5, 391.5 )
	IrisInner4:setTopBottom( false, false, -768, -144 )
	IrisInner4:setZRot( -124 )
	IrisInner4:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisinner" ) )
	IrisInner4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisInner4 )
	self.IrisInner4 = IrisInner4
	
	local IrisInner5 = LUI.UIImage.new()
	IrisInner5:setLeftRight( false, false, -327.5, -199.5 )
	IrisInner5:setTopBottom( false, false, 186, 810 )
	IrisInner5:setXRot( -180 )
	IrisInner5:setZRot( -61 )
	IrisInner5:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisinner" ) )
	IrisInner5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisInner5 )
	self.IrisInner5 = IrisInner5
	
	local IrisInner6 = LUI.UIImage.new()
	IrisInner6:setLeftRight( false, false, 264.5, 392.5 )
	IrisInner6:setTopBottom( false, false, 148, 772 )
	IrisInner6:setXRot( -180 )
	IrisInner6:setZRot( -124 )
	IrisInner6:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisinner" ) )
	IrisInner6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisInner6 )
	self.IrisInner6 = IrisInner6
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideVehicleReticle( self, controller, event )
			end
		}
	} )
	self:linkToElementModel( self, "vehicleType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicleType"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

