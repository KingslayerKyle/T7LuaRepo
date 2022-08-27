-- 95eb1c069406ad2fe42f47a52363a010
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_LockBox" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_LockArrow" )

CoD.vhud_ms_LockOnNotification = InheritFrom( LUI.UIElement )
CoD.vhud_ms_LockOnNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_LockOnNotification )
	self.id = "vhud_ms_LockOnNotification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local vhudmsLockBox = CoD.vhud_ms_LockBox.new( menu, controller )
	vhudmsLockBox:setLeftRight( false, false, -27.59, 27.59 )
	vhudmsLockBox:setTopBottom( false, false, -23.59, 31.59 )
	vhudmsLockBox:linkToElementModel( self, nil, false, function ( model )
		vhudmsLockBox:setModel( model, controller )
	end )
	vhudmsLockBox:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_CENTER )
			end
		},
		{
			stateName = "HasLock",
			condition = function ( menu, element, event )
				return VehicleHasEnemyLock( element, controller )
			end
		}
	} )
	vhudmsLockBox:linkToElementModel( vhudmsLockBox, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_CENTER, true, function ( model )
		menu:updateElementState( vhudmsLockBox, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_CENTER
		} )
	end )
	vhudmsLockBox:linkToElementModel( vhudmsLockBox, nil, true, function ( model )
		menu:updateElementState( vhudmsLockBox, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( vhudmsLockBox )
	self.vhudmsLockBox = vhudmsLockBox
	
	local vhudmsLockArrow = CoD.vhud_ms_LockArrow.new( menu, controller )
	vhudmsLockArrow:setLeftRight( false, false, -51, -15 )
	vhudmsLockArrow:setTopBottom( false, false, -19, 17 )
	vhudmsLockArrow:linkToElementModel( self, nil, false, function ( model )
		vhudmsLockArrow:setModel( model, controller )
	end )
	vhudmsLockArrow:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT )
			end
		}
	} )
	vhudmsLockArrow:linkToElementModel( vhudmsLockArrow, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT, true, function ( model )
		menu:updateElementState( vhudmsLockArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT
		} )
	end )
	self:addElement( vhudmsLockArrow )
	self.vhudmsLockArrow = vhudmsLockArrow
	
	local vhudmsLockArrow0 = CoD.vhud_ms_LockArrow.new( menu, controller )
	vhudmsLockArrow0:setLeftRight( false, false, 15, 51 )
	vhudmsLockArrow0:setTopBottom( false, false, -18, 18 )
	vhudmsLockArrow0:setZRot( 180 )
	vhudmsLockArrow0:linkToElementModel( self, nil, false, function ( model )
		vhudmsLockArrow0:setModel( model, controller )
	end )
	vhudmsLockArrow0:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT )
			end
		}
	} )
	vhudmsLockArrow0:linkToElementModel( vhudmsLockArrow0, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT, true, function ( model )
		menu:updateElementState( vhudmsLockArrow0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT
		} )
	end )
	self:addElement( vhudmsLockArrow0 )
	self.vhudmsLockArrow0 = vhudmsLockArrow0
	
	local vhudmsLockArrow1 = CoD.vhud_ms_LockArrow.new( menu, controller )
	vhudmsLockArrow1:setLeftRight( false, false, -19, 17 )
	vhudmsLockArrow1:setTopBottom( false, false, -1, 35 )
	vhudmsLockArrow1:setZRot( 90 )
	vhudmsLockArrow1:linkToElementModel( self, nil, false, function ( model )
		vhudmsLockArrow1:setModel( model, controller )
	end )
	vhudmsLockArrow1:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN )
			end
		}
	} )
	vhudmsLockArrow1:linkToElementModel( vhudmsLockArrow1, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN, true, function ( model )
		menu:updateElementState( vhudmsLockArrow1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN
		} )
	end )
	self:addElement( vhudmsLockArrow1 )
	self.vhudmsLockArrow1 = vhudmsLockArrow1
	
	local vhudmsLockArrow2 = CoD.vhud_ms_LockArrow.new( menu, controller )
	vhudmsLockArrow2:setLeftRight( false, false, -18, 18 )
	vhudmsLockArrow2:setTopBottom( false, false, -36, 0 )
	vhudmsLockArrow2:setZRot( -90 )
	vhudmsLockArrow2:linkToElementModel( self, nil, false, function ( model )
		vhudmsLockArrow2:setModel( model, controller )
	end )
	vhudmsLockArrow2:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP )
			end
		}
	} )
	vhudmsLockArrow2:linkToElementModel( vhudmsLockArrow2, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP, true, function ( model )
		menu:updateElementState( vhudmsLockArrow2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP
		} )
	end )
	self:addElement( vhudmsLockArrow2 )
	self.vhudmsLockArrow2 = vhudmsLockArrow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsLockBox:close()
		element.vhudmsLockArrow:close()
		element.vhudmsLockArrow0:close()
		element.vhudmsLockArrow1:close()
		element.vhudmsLockArrow2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

