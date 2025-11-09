local UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_inventory" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

local PostLoadFunc = function ( self, controller )
	self:setAlpha( 0 )
	self:registerEventHandler( "hud_update_refresh", UpdateVisibility )
	local UpdateVisibility_Internal = function ( model )
		UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), UpdateVisibility_Internal )
end

CoD.EMP_WeaponInfo = InheritFrom( LUI.UIElement )
CoD.EMP_WeaponInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EMP_WeaponInfo )
	self.id = "EMP_WeaponInfo"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 341 )
	self:setTopBottom( true, false, 0, 171 )
	
	local EMPWeaponInfo = LUI.UIImage.new()
	EMPWeaponInfo:setLeftRight( true, false, 37, 341 )
	EMPWeaponInfo:setTopBottom( true, false, -13, 171 )
	EMPWeaponInfo:setRGB( 1, 1, 1 )
	EMPWeaponInfo:setImage( RegisterImage( "uie_t7_cp_hud_ammowidget_empstub1" ) )
	EMPWeaponInfo:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	EMPWeaponInfo:setShaderVector( 0, 35.93, 0, 0, 0 )
	EMPWeaponInfo:setShaderVector( 1, 0.83, 0, 0, 0 )
	EMPWeaponInfo:setShaderVector( 2, 0.49, 0, 0, 0 )
	self:addElement( EMPWeaponInfo )
	self.EMPWeaponInfo = EMPWeaponInfo
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

