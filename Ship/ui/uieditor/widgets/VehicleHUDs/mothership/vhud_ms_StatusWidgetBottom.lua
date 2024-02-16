-- abbf8c4f732a9b3267431b4786d99109
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationOptic" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationFlir" )

CoD.vhud_ms_StatusWidgetBottom = InheritFrom( LUI.UIElement )
CoD.vhud_ms_StatusWidgetBottom.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = -20
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_StatusWidgetBottom )
	self.id = "vhud_ms_StatusWidgetBottom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 139 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local vhudmsNotificationOptic = CoD.vhud_ms_NotificationOptic.new( menu, controller )
	vhudmsNotificationOptic:setLeftRight( false, false, -71, 10 )
	vhudmsNotificationOptic:setTopBottom( false, false, -15, 15 )
	vhudmsNotificationOptic.OPTIC:setText( Engine.Localize( "MENU_HUD_VEHICLE_OPTIC" ) )
	vhudmsNotificationOptic:linkToElementModel( self, nil, false, function ( model )
		vhudmsNotificationOptic:setModel( model, controller )
	end )
	vhudmsNotificationOptic:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "fullscreenFilter", Enum.VehicleFullscreenFilter.VEHICLE_FULLSCREEN_FILTER_INFRARED )
			end
		}
	} )
	vhudmsNotificationOptic:linkToElementModel( vhudmsNotificationOptic, "fullscreenFilter", true, function ( model )
		menu:updateElementState( vhudmsNotificationOptic, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fullscreenFilter"
		} )
	end )
	self:addElement( vhudmsNotificationOptic )
	self.vhudmsNotificationOptic = vhudmsNotificationOptic
	
	local vhudmsNotificationFlir0 = CoD.vhud_ms_NotificationFlir.new( menu, controller )
	vhudmsNotificationFlir0:setLeftRight( false, false, -10, 71 )
	vhudmsNotificationFlir0:setTopBottom( false, false, -15, 15 )
	vhudmsNotificationFlir0.FLIR:setText( Engine.Localize( "MENU_HUD_VEHICLE_IR" ) )
	vhudmsNotificationFlir0:linkToElementModel( self, nil, false, function ( model )
		vhudmsNotificationFlir0:setModel( model, controller )
	end )
	vhudmsNotificationFlir0:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "fullscreenFilter", Enum.VehicleFullscreenFilter.VEHICLE_FULLSCREEN_FILTER_FLIR )
			end
		}
	} )
	vhudmsNotificationFlir0:linkToElementModel( vhudmsNotificationFlir0, "fullscreenFilter", true, function ( model )
		menu:updateElementState( vhudmsNotificationFlir0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fullscreenFilter"
		} )
	end )
	self:addElement( vhudmsNotificationFlir0 )
	self.vhudmsNotificationFlir0 = vhudmsNotificationFlir0
	
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
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsNotificationOptic:close()
		element.vhudmsNotificationFlir0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
