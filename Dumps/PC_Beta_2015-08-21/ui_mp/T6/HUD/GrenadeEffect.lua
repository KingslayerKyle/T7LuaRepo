CoD.GrenadeEffect = {}
CoD.GrenadeEffect.new = function ( f1_arg0 )
	local self = LUI.UIElement.new()
	self:setAlpha( 0 )
	local f1_local1, f1_local2 = Engine.GetUserSafeArea()
	
	local safeArea = LUI.UIElement.new()
	safeArea:setLeftRight( false, false, -f1_local1 / 2, f1_local1 / 2 )
	safeArea:setTopBottom( false, false, -f1_local2 / 2, f1_local2 / 2 )
	self:addElement( safeArea )
	self.safeArea = safeArea
	
	self:registerEventHandler( "prox_grenade_notify", CoD.GrenadeEffect.GrenadeExplode )
	local f1_local4 = function ( f2_arg0 )
		CoD.GrenadeEffect.UpdateVisibility( self, {
			controller = f1_arg0
		} )
	end
	
	local f1_local5 = Engine.GetModelForController( f1_arg0 )
	self:subscribeToModel( Engine.GetModel( f1_local5, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), f1_local4 )
	self:subscribeToModel( Engine.GetModel( f1_local5, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), f1_local4 )
	self:subscribeToModel( Engine.GetModel( f1_local5, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f1_local4 )
	return self
end

CoD.GrenadeEffect.UpdateVisibility = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controller
	if not Engine.IsVisibilityBitSet( f3_local0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( f3_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f3_local0, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		if f3_arg0.visible ~= true then
			f3_arg0:setAlpha( 1 )
			f3_arg0.visible = true
		end
	elseif f3_arg0.visible == true then
		f3_arg0:setAlpha( 0 )
		f3_arg0.visible = nil
	end
	f3_arg0:dispatchEventToChildren( f3_arg1 )
end

CoD.GrenadeEffect.GrenadeExplode = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.data[1]
	local f4_local1 = f4_arg1.data[2]
	local f4_local2 = f4_arg1.data[3]
	local f4_local3 = 30
	local f4_local4, f4_local5, f4_local6, f4_local7, f4_local8, f4_local9, f4_local10, f4_local11 = nil
	local f4_local12 = 80
	local f4_local13 = 200
	local f4_local14 = 512
	local f4_local15 = 256
	local f4_local16, f4_local17, f4_local18, f4_local19 = nil
	local f4_local20 = 1
	local f4_local21 = 0
	if f4_local0 <= f4_local3 then
		f4_local4 = 0
		f4_local5 = 30
		f4_local6 = 0
		f4_local7 = 0
		f4_local8 = 0
		f4_local9 = 256
		f4_local10 = 1
		f4_local11 = 1
		f4_local16 = math.random( f4_local4, f4_local5 )
		f4_local17 = f4_local6 + f4_local2 / f4_local13 * (f4_local7 - f4_local6)
		f4_local18 = math.random( f4_local8, f4_local9 )
		f4_local19 = f4_local10 + f4_local2 / f4_local13 * (f4_local11 - f4_local10)
		f4_local14 = f4_local14 * f4_local19
		f4_local15 = f4_local15 * f4_local19
		f4_local21 = 90
	else
		f4_local4 = 0
		f4_local5 = 30
		f4_local6 = 0
		f4_local7 = 0
		f4_local8 = 0
		f4_local9 = 256
		f4_local10 = 1
		f4_local11 = 1
		f4_local16 = 90 + math.random( f4_local4, f4_local5 )
		f4_local17 = f4_local6 + f4_local2 / f4_local13 * (f4_local7 - f4_local6)
		f4_local18 = f4_local0 / f4_local12 * 320
		f4_local19 = f4_local10 + f4_local2 / f4_local13 * (f4_local11 - f4_local10)
		f4_local14 = f4_local14 * f4_local19
		f4_local15 = f4_local15 * f4_local19
		if f4_local1 > 90 then
			f4_local20 = -1
		end
	end
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:setAlpha( 0 )
	f4_arg0.safeArea:addElement( self )
	local f4_local23, f4_local24, f4_local25 = nil
	local f4_local26 = 0
	local f4_local27 = 30
	local f4_local28 = 512
	local f4_local29 = 256
	local f4_local30 = 0
	local f4_local31 = 0
	local f4_local32 = 0
	local f4_local33 = 256
	f4_local23 = f4_local21 + math.random( f4_local26, f4_local27 )
	f4_local24 = math.random( f4_local30, f4_local31 )
	f4_local25 = math.random( f4_local32, f4_local33 )
	self:registerEventHandler( "transition_complete_state_full_alpha", CoD.GrenadeEffect.SwitchToAlphaMed )
	self:registerEventHandler( "transition_complete_state_alpha_med", CoD.GrenadeEffect.SwitchToZeroAlpha )
	self:registerEventHandler( "transition_complete_state_alpha_zero", CoD.GrenadeEffect.CloseOut )
	self:beginAnimation( "state_full_alpha", 100 )
	self:setAlpha( 1 )
	self.image = dropletsImage
end

CoD.GrenadeEffect.SwitchToAlphaMed = function ( f5_arg0, f5_arg1 )
	if f5_arg1.interrupted ~= true then
		f5_arg0:beginAnimation( "state_alpha_med", 1000, true, false )
		f5_arg0:setAlpha( 0.7 )
	end
end

CoD.GrenadeEffect.SwitchToZeroAlpha = function ( f6_arg0, f6_arg1 )
	if f6_arg1.interrupted ~= true then
		f6_arg0:beginAnimation( "state_alpha_zero", 5000, false, true )
		f6_arg0:setAlpha( 0 )
	end
end

CoD.GrenadeEffect.CloseOut = function ( f7_arg0, f7_arg1 )
	if f7_arg1.interrupted ~= true then
		f7_arg0:close()
	end
end

