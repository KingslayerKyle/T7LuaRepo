-- 9f44307eb7cf4c73e1c7ac6b7893d852
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_missile_count" )
require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_missile_label" )
require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_NotificationLine" )

CoD.vhud_siegebot_missile_container = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_missile_container.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_missile_container )
	self.id = "vhud_siegebot_missile_container"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 155 )
	self.anyChildUsesUpdateState = true
	
	local vhudsiegebotmissilecount = CoD.vhud_siegebot_missile_count.new( menu, controller )
	vhudsiegebotmissilecount:setLeftRight( true, false, -1.5, 82.5 )
	vhudsiegebotmissilecount:setTopBottom( true, false, 39.8, 122.8 )
	vhudsiegebotmissilecount:setAlpha( 0.8 )
	vhudsiegebotmissilecount:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotmissilecount:setModel( model, controller )
	end )
	self:addElement( vhudsiegebotmissilecount )
	self.vhudsiegebotmissilecount = vhudsiegebotmissilecount
	
	local vhudsiegebotmissilelabel = CoD.vhud_siegebot_missile_label.new( menu, controller )
	vhudsiegebotmissilelabel:setLeftRight( true, false, -40, 121 )
	vhudsiegebotmissilelabel:setTopBottom( true, false, 114.8, 144.8 )
	vhudsiegebotmissilelabel:setYRot( -50 )
	vhudsiegebotmissilelabel.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_MISSILES_R1" ) )
	self:addElement( vhudsiegebotmissilelabel )
	self.vhudsiegebotmissilelabel = vhudsiegebotmissilelabel
	
	local vhudsiegebotNotificationLine = CoD.vhud_siegebot_NotificationLine.new( menu, controller )
	vhudsiegebotNotificationLine:setLeftRight( true, false, 2.04, 81.04 )
	vhudsiegebotNotificationLine:setTopBottom( true, false, 42.43, 50.43 )
	vhudsiegebotNotificationLine:setAlpha( 0.8 )
	vhudsiegebotNotificationLine:setYRot( -50 )
	self:addElement( vhudsiegebotNotificationLine )
	self.vhudsiegebotNotificationLine = vhudsiegebotNotificationLine
	
	local vhudsiegebotNotificationLine0 = CoD.vhud_siegebot_NotificationLine.new( menu, controller )
	vhudsiegebotNotificationLine0:setLeftRight( true, false, 2.04, 81.04 )
	vhudsiegebotNotificationLine0:setTopBottom( true, false, 114.8, 122.8 )
	vhudsiegebotNotificationLine0:setAlpha( 0.8 )
	vhudsiegebotNotificationLine0:setYRot( -50 )
	self:addElement( vhudsiegebotNotificationLine0 )
	self.vhudsiegebotNotificationLine0 = vhudsiegebotNotificationLine0
	
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
		EMP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EMP",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsiegebotmissilecount:close()
		element.vhudsiegebotmissilelabel:close()
		element.vhudsiegebotNotificationLine:close()
		element.vhudsiegebotNotificationLine0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

