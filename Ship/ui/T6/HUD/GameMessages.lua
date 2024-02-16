-- 61c85155bee7be4b86d24c6b932318c6
-- This hash is used for caching, delete to decompile the file again

CoD.GameMessages = {}
CoD.GameMessages.MPObituraryWindowIndex = 0
CoD.GameMessages.SPGameMessagesWindowIndex = 0
CoD.GameMessages.BoldGameMessagesWindowIndex = 1
CoD.GameMessages.SubtitlesWindowIndex = 2
CoD.GameMessages.ObituaryWindowUpdateVisibility = function ( f1_arg0, f1_arg1 )
	if Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ) and not Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and (not CoD.IsShoutcaster( f1_arg1.controller ) or CoD.ShoutcasterProfileVarBool( f1_arg1.controller, "shoutcaster_killfeed" )) then
		f1_arg0:setAlpha( 1 )
	else
		f1_arg0:setAlpha( 0 )
	end
end

CoD.GameMessages.AddObituaryWindow = function ( f2_arg0, f2_arg1, f2_arg2 )
	local self = LUI.UIElement.new( f2_arg1 )
	self:setupGameMessages( CoD.GameMessages.MPObituraryWindowIndex )
	self:setAlignment( LUI.Alignment.Left )
	self:setFont( CoD.fonts.ExtraSmall )
	local f2_local1 = function ( f3_arg0 )
		CoD.GameMessages.ObituaryWindowUpdateVisibility( self, {
			controller = f2_arg2
		} )
	end
	
	local f2_local2 = Engine.GetModelForController( f2_arg2 )
	self:subscribeToModel( Engine.GetModel( f2_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f2_local1 )
	self:subscribeToModel( Engine.GetModel( f2_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ), f2_local1 )
	self:subscribeToModel( Engine.GetModel( f2_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f2_local1 )
	self:subscribeToModel( Engine.GetModel( f2_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f2_local1 )
	self:subscribeToModel( Engine.GetModel( f2_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f2_local1 )
	f2_arg0:addForceClosedSafeAreaChild( self )
end

CoD.GameMessages.AddSPGameMessagesWindow = function ( menu, controller )
	local self = LUI.UIElement.new( controller )
	self:setupGameMessages( CoD.GameMessages.SPGameMessagesWindowIndex )
	self:setAlignment( LUI.Alignment.Left )
	self:setFont( CoD.fonts.ExtraSmall )
	menu.safeArea:addElement( self )
end

CoD.GameMessages.AddSPBoldGameMessagesWindow = function ( menu, controller )
	local self = LUI.UIElement.new( controller )
	self:setupGameMessages( CoD.GameMessages.BoldGameMessagesWindowIndex )
	self:setAlignment( LUI.Alignment.Center )
	self:setFont( CoD.fonts.ExtraSmall )
	menu.safeArea:addElement( self )
end

CoD.GameMessages.AddSubtitlesWindow = function ( menu, controller )
	local self = LUI.UIElement.new( controller )
	self:setupGameMessages( CoD.GameMessages.SubtitlesWindowIndex )
	self:setAlignment( LUI.Alignment.Center )
	self:setFont( CoD.fonts.Default )
	self:setPriority( 100001 )
	local f6_local1 = menu:getParent()
	f6_local1:addElement( self )
end

CoD.GameMessages.BoldGameMessagesWindowUpdateVisibility = function ( f7_arg0, f7_arg1 )
	if Engine.IsVisibilityBitSet( f7_arg1.controller, Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ) and not Engine.IsVisibilityBitSet( f7_arg1.controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f7_arg1.controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f7_arg1.controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f7_arg1.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		f7_arg0:setAlpha( 1 )
	else
		f7_arg0:setAlpha( 0 )
	end
end

CoD.GameMessages.BoldGameMessagesWindow = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = CoD.SplitscreenScaler.new( f8_arg1, 1.5 )
	f8_local0:setupGameMessages( CoD.GameMessages.BoldGameMessagesWindowIndex )
	f8_local0:setAlignment( LUI.Alignment.Center )
	f8_local0:setFont( CoD.fonts.Default )
	local f8_local1 = function ( f9_arg0 )
		CoD.GameMessages.BoldGameMessagesWindowUpdateVisibility( f8_local0, {
			controller = f8_arg2
		} )
	end
	
	local f8_local2 = Engine.GetModelForController( f8_arg2 )
	f8_local0:subscribeToModel( Engine.GetModel( f8_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f8_local1 )
	f8_local0:subscribeToModel( Engine.GetModel( f8_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ), f8_local1 )
	f8_local0:subscribeToModel( Engine.GetModel( f8_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f8_local1 )
	f8_local0:subscribeToModel( Engine.GetModel( f8_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f8_local1 )
	f8_local0:subscribeToModel( Engine.GetModel( f8_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f8_local1 )
	f8_arg0:addForceClosedSafeAreaChild( f8_local0 )
end

