CoD.GameMessages = {}
CoD.GameMessages.MPObituraryWindowIndex = 0
CoD.GameMessages.SPGameMessagesWindowIndex = 0
CoD.GameMessages.BoldGameMessagesWindowIndex = 1
CoD.GameMessages.SubtitlesWindowIndex = 2
CoD.GameMessages.ObituaryWindowUpdateVisibility = function ( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and (not CoD.IsShoutcaster( event.controller ) or CoD.ExeProfileVarBool( event.controller, "shoutcaster_killfeed" )) then
		self:setAlpha( 1 )
	else
		self:setAlpha( 0 )
	end
end

CoD.GameMessages.AddObituaryWindow = function ( self, defaultAnimationState, controller )
	local obituaryWindow = LUI.UIElement.new( defaultAnimationState )
	obituaryWindow:setupGameMessages( CoD.GameMessages.MPObituraryWindowIndex )
	obituaryWindow:setAlignment( LUI.Alignment.Left )
	obituaryWindow:setFont( CoD.fonts.ExtraSmall )
	obituaryWindow:registerEventHandler( "hud_update_refresh", CoD.GameMessages.ObituaryWindowUpdateVisibility )
	local UpdateVisibility_Obit_Internal = function ( model )
		CoD.GameMessages.ObituaryWindowUpdateVisibility( obituaryWindow, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	obituaryWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Obit_Internal )
	obituaryWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ), UpdateVisibility_Obit_Internal )
	obituaryWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Obit_Internal )
	obituaryWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Obit_Internal )
	self:addForceClosedSafeAreaChild( obituaryWindow )
end

CoD.GameMessages.AddSPGameMessagesWindow = function ( self, defaultAnimationState )
	local gameMessagesWindow = LUI.UIElement.new( defaultAnimationState )
	gameMessagesWindow:setupGameMessages( CoD.GameMessages.SPGameMessagesWindowIndex )
	gameMessagesWindow:setAlignment( LUI.Alignment.Left )
	gameMessagesWindow:setFont( CoD.fonts.ExtraSmall )
	self.safeArea:addElement( gameMessagesWindow )
end

CoD.GameMessages.AddSPBoldGameMessagesWindow = function ( self, defaultAnimationState )
	local gameMessagesWindow = LUI.UIElement.new( defaultAnimationState )
	gameMessagesWindow:setupGameMessages( CoD.GameMessages.BoldGameMessagesWindowIndex )
	gameMessagesWindow:setAlignment( LUI.Alignment.Center )
	gameMessagesWindow:setFont( CoD.fonts.ExtraSmall )
	self.safeArea:addElement( gameMessagesWindow )
end

CoD.GameMessages.AddSubtitlesWindow = function ( self, defaultAnimationState )
	local subtitlesWindow = LUI.UIElement.new( defaultAnimationState )
	subtitlesWindow:setupGameMessages( CoD.GameMessages.SubtitlesWindowIndex )
	subtitlesWindow:setAlignment( LUI.Alignment.Center )
	subtitlesWindow:setFont( CoD.fonts.ExtraSmall )
	self.safeArea:addElement( subtitlesWindow )
end

CoD.GameMessages.BoldGameMessagesWindowUpdateVisibility = function ( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		self:setAlpha( 1 )
	else
		self:setAlpha( 0 )
	end
end

CoD.GameMessages.BoldGameMessagesWindow = function ( self, defaultAnimationState, controller )
	local messageWindow = CoD.SplitscreenScaler.new( defaultAnimationState, 1.5 )
	messageWindow:setupGameMessages( CoD.GameMessages.BoldGameMessagesWindowIndex )
	messageWindow:setAlignment( LUI.Alignment.Center )
	messageWindow:setFont( CoD.fonts.Default )
	local UpdateVisibility_Bold_Internal = function ( model )
		CoD.GameMessages.BoldGameMessagesWindowUpdateVisibility( messageWindow, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	messageWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Bold_Internal )
	messageWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_OBITUARIES ), UpdateVisibility_Bold_Internal )
	messageWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Bold_Internal )
	messageWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Bold_Internal )
	messageWindow:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Bold_Internal )
	self:addForceClosedSafeAreaChild( messageWindow )
end

