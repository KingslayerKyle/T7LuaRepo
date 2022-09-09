-- 00e8a435974f85e096eb8ed57bf41e84
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controller
	if Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and (not CoD.IsShoutcaster( f1_local0 ) or CoD.ShoutcasterProfileVarBool( f1_local0, "shoutcaster_inventory" ) and Engine.IsSpectatingActiveClient( f1_local0 )) and CoD.FSM_VISIBILITY( f1_local0 ) == 0 then
		if f1_arg0.visible ~= true then
			f1_arg0:setAlpha( 1 )
			f1_arg0.visible = true
		end
	elseif f1_arg0.visible == true then
		f1_arg0:setAlpha( 0 )
		f1_arg0.visible = nil
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:setAlpha( 0 )
	local f2_local0 = function ( f3_arg0 )
		f0_local0( f2_arg0, {
			controller = f2_arg1
		} )
	end
	
	local f2_local1 = Engine.GetModelForController( f2_arg1 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), f2_local0 )
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
