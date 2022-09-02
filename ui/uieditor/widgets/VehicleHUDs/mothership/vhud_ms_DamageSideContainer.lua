-- 0556a7a292e79369a208c28f69d03e41
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_DamageIconSide" )

CoD.vhud_ms_DamageSideContainer = InheritFrom( LUI.UIElement )
CoD.vhud_ms_DamageSideContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_DamageSideContainer )
	self.id = "vhud_ms_DamageSideContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 61 )
	self:setTopBottom( true, false, 0, 26 )
	self.anyChildUsesUpdateState = true
	
	local vhudmsDamageIconSideLeft = CoD.vhud_ms_DamageIconSide.new( menu, controller )
	vhudmsDamageIconSideLeft:setLeftRight( false, false, -32.25, -6.25 )
	vhudmsDamageIconSideLeft:setTopBottom( false, false, -12.75, 12.75 )
	vhudmsDamageIconSideLeft:setYRot( 180 )
	vhudmsDamageIconSideLeft:linkToElementModel( self, nil, false, function ( model )
		vhudmsDamageIconSideLeft:setModel( model, controller )
	end )
	vhudmsDamageIconSideLeft:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfEnumModelValueTrue( element, controller, Enum.VehiclePartDestroyed.VEHICLE_PART_DESTROYED_1 )
			end
		}
	} )
	vhudmsDamageIconSideLeft:linkToElementModel( vhudmsDamageIconSideLeft, Enum.VehiclePartDestroyed.VEHICLE_PART_DESTROYED_1, true, function ( model )
		menu:updateElementState( vhudmsDamageIconSideLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = Enum.VehiclePartDestroyed.VEHICLE_PART_DESTROYED_1
		} )
	end )
	self:addElement( vhudmsDamageIconSideLeft )
	self.vhudmsDamageIconSideLeft = vhudmsDamageIconSideLeft
	
	local vhudmsDamageIconSideRight = CoD.vhud_ms_DamageIconSide.new( menu, controller )
	vhudmsDamageIconSideRight:setLeftRight( false, false, 4.75, 30.25 )
	vhudmsDamageIconSideRight:setTopBottom( false, false, -12.75, 12.75 )
	vhudmsDamageIconSideRight:linkToElementModel( self, nil, false, function ( model )
		vhudmsDamageIconSideRight:setModel( model, controller )
	end )
	vhudmsDamageIconSideRight:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfEnumModelValueTrue( element, controller, Enum.VehiclePartDestroyed.VEHICLE_PART_DESTROYED_2 )
			end
		}
	} )
	vhudmsDamageIconSideRight:linkToElementModel( vhudmsDamageIconSideRight, Enum.VehiclePartDestroyed.VEHICLE_PART_DESTROYED_2, true, function ( model )
		menu:updateElementState( vhudmsDamageIconSideRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = Enum.VehiclePartDestroyed.VEHICLE_PART_DESTROYED_2
		} )
	end )
	self:addElement( vhudmsDamageIconSideRight )
	self.vhudmsDamageIconSideRight = vhudmsDamageIconSideRight
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsDamageIconSideLeft:close()
		element.vhudmsDamageIconSideRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

