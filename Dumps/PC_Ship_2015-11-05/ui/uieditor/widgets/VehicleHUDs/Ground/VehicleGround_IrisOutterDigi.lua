CoD.VehicleGround_IrisOutterDigi = InheritFrom( LUI.UIElement )
CoD.VehicleGround_IrisOutterDigi.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_IrisOutterDigi )
	self.id = "VehicleGround_IrisOutterDigi"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local IrisOutterDigiL = LUI.UIImage.new()
	IrisOutterDigiL:setLeftRight( true, false, 0, 400 )
	IrisOutterDigiL:setTopBottom( true, true, 0, 0 )
	IrisOutterDigiL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutterdigil" ) )
	IrisOutterDigiL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterDigiL )
	self.IrisOutterDigiL = IrisOutterDigiL
	
	local IrisOutterDigiR = LUI.UIImage.new()
	IrisOutterDigiR:setLeftRight( false, true, -360, 0 )
	IrisOutterDigiR:setTopBottom( true, true, 0, 0 )
	IrisOutterDigiR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutterdigir" ) )
	IrisOutterDigiR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterDigiR )
	self.IrisOutterDigiR = IrisOutterDigiR
	
	self:mergeStateConditions( {
		{
			stateName = "LeavingOperationalZone",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		}
	} )
	self:linkToElementModel( self, "outOfRange", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

