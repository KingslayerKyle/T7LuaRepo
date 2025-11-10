require( "ui.uieditor.widgets.EntityLockon.rocketLauncherLockon_Internal" )

CoD.rocketLauncherLockon = InheritFrom( LUI.UIElement )
CoD.rocketLauncherLockon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.rocketLauncherLockon )
	self.id = "rocketLauncherLockon"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 70 )
	self.anyChildUsesUpdateState = true
	
	local rocketLauncherLockonInternal0 = CoD.rocketLauncherLockon_Internal.new( menu, controller )
	rocketLauncherLockonInternal0:setLeftRight( true, true, 0, 0 )
	rocketLauncherLockonInternal0:setTopBottom( true, true, 0, 0 )
	rocketLauncherLockonInternal0:linkToElementModel( self, nil, false, function ( model )
		rocketLauncherLockonInternal0:setModel( model, controller )
	end )
	rocketLauncherLockonInternal0:mergeStateConditions( {
		{
			stateName = "LockedOn",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "status", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_LOCKED )
			end
		},
		{
			stateName = "AcquiringLock",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "status", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_LOCKING )
			end
		}
	} )
	rocketLauncherLockonInternal0:linkToElementModel( rocketLauncherLockonInternal0, "status", true, function ( model )
		menu:updateElementState( rocketLauncherLockonInternal0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	self:addElement( rocketLauncherLockonInternal0 )
	self.rocketLauncherLockonInternal0 = rocketLauncherLockonInternal0
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( element, controller )
		CallCustomElementFunction_Element( element, "setupRocketLauncherTarget", controller )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.rocketLauncherLockonInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

