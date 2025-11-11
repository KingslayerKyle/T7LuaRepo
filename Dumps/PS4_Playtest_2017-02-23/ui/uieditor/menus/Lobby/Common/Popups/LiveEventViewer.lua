require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerFooterContainer" )
require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerMovieAndBackground" )
require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerStatusWidget" )

local PreLoadFunc = function ( self, controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LiveEventViewer.buttonPrompts" )
	if CoD.isPC then
		self:setHandleMouse( true )
		self.ImageWithButtonPrompt:setHandleMouse( true )
	end
	local hideButtonCondition = function ()
		return false
	end
	
	local showButtonCondition = function ()
		return true
	end
	
	local showPrompts = function ()
		SetProperty( self, "showPrompt", true )
		self:setState( "ShowPrompts" )
	end
	
	local hidePrompts = function ()
		SetProperty( self, "showPrompt", false )
		self:setState( "DefaultState" )
		if self.skipHideTimer then
			self.skipHideTimer:close()
			self.skipHideTimer = nil
		end
	end
	
	local createSkipTimer = function ()
		self.skipHideTimer = LUI.UITimer.newElementTimer( 5000, true, hidePrompts )
		self:addElement( self.skipHideTimer )
	end
	
	local onButtonPressAction = function ( element, menu, controller, model )
		if self.skipHideTimer then
			self.skipHideTimer:reset()
		else
			showPrompts()
			createSkipTimer()
		end
	end
	
	local circleButtonPress = function ( element, menu, controller, model )
		if PropertyIsTrue( self, "showPrompt" ) then
			GoBack( menu, controller )
		else
			onButtonPressAction( element, menu, controller, model )
		end
		return true
	end
	
	local squareButtonPress = function ( element, menu, controller, model )
		if PropertyIsTrue( self, "showPrompt" ) and IsMLGStream( controller ) then
			OpenPopup( menu, "LiveEventViewerQualities", controller )
			hidePrompts()
		else
			onButtonPressAction( element, menu, controller, model )
		end
		return true
	end
	
	local triangleButtonPress = function ( element, menu, controller, model )
		if PropertyIsTrue( self, "showPrompt" ) then
			if IsChildElementInState( menu, "LiveEventViewerMovieAndBackground", "Windowed" ) then
				SetElementStateByElementName( menu, "LiveEventViewerMovieAndBackground", controller, "DefaultState" )
				CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
				return true
			else
				SetElementStateByElementName( menu, "LiveEventViewerMovieAndBackground", controller, "Windowed" )
				CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
				return true
			end
		else
			onButtonPressAction( element, menu, controller, model )
		end
	end
	
	local onButtonPressActionIfDpad = function ( element, menu, controller, model )
		if IsDpadButton( model ) then
			onButtonPressAction( element, menu, controller, model )
		end
	end
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, onButtonPressActionIfDpad, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, onButtonPressActionIfDpad, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, onButtonPressActionIfDpad, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, onButtonPressActionIfDpad, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, onButtonPressAction, hideButtonCondition, false )
	if LUI.DEV == nil then
		self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, onButtonPressAction, hideButtonCondition, false )
	end
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, onButtonPressAction, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, onButtonPressAction, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, onButtonPressAction, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, onButtonPressAction, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, onButtonPressAction, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, onButtonPressAction, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, onButtonPressAction, hideButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, circleButtonPress, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_EXIT_LIVE_EVENT_VIEWER" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, squareButtonPress, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_MLG_CURRENT_QUALITY" )
		if IsMLGStream( controller ) then
			return true
		else
			return true
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, triangleButtonPress, function ( element, menu, controller )
		if menu.LiveEventViewerMovieAndBackground and IsChildElementInState( menu, "LiveEventViewerMovieAndBackground", "Windowed" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_FULLSCREEN" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_WINDOWED" )
			return true
		end
	end, false )
end

local PostLoadFunc = function ( self, controller )
	CoD.PlayFrontendMusic( "" )
	Dvar.ui_liveEventViewerOpen:set( true )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		Dvar.ui_liveEventViewerOpen:set( false )
		local lobbyNav = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
		if lobbyNav then
			CoD.PlayFrontendMusicForLobby( lobbyNav )
		end
	end )
end

LUI.createMenu.LiveEventViewer = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LiveEventViewer" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Special_widgets"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LiveEventViewer.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LiveEventViewerMovieAndBackground = CoD.LiveEventViewerMovieAndBackground.new( self, controller )
	LiveEventViewerMovieAndBackground:setLeftRight( 0, 1, 0, 0 )
	LiveEventViewerMovieAndBackground:setTopBottom( 0, 1, 0, 0 )
	LiveEventViewerMovieAndBackground:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( LiveEventViewerMovieAndBackground )
	self.LiveEventViewerMovieAndBackground = LiveEventViewerMovieAndBackground
	
	local LiveEventViewerFooterContainer0 = CoD.LiveEventViewerFooterContainer.new( self, controller )
	LiveEventViewerFooterContainer0:setLeftRight( 0, 1, 0, 0 )
	LiveEventViewerFooterContainer0:setTopBottom( 1, 1, -1080, 0 )
	self:addElement( LiveEventViewerFooterContainer0 )
	self.LiveEventViewerFooterContainer0 = LiveEventViewerFooterContainer0
	
	local LiveEventViewerStatusWidget0 = CoD.LiveEventViewerStatusWidget.new( self, controller )
	LiveEventViewerStatusWidget0:setLeftRight( 1, 1, -172, -96 )
	LiveEventViewerStatusWidget0:setTopBottom( 0, 0, 54, 92 )
	self:addElement( LiveEventViewerStatusWidget0 )
	self.LiveEventViewerStatusWidget0 = LiveEventViewerStatusWidget0
	
	self.resetProperties = function ()
		LiveEventViewerFooterContainer0:completeAnimation()
		LiveEventViewerFooterContainer0:setLeftRight( 0, 1, 0, 0 )
		LiveEventViewerFooterContainer0:setTopBottom( 1, 1, -1080, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				LiveEventViewerFooterContainer0:completeAnimation()
				self.LiveEventViewerFooterContainer0:setLeftRight( 0, 1, 0, 0 )
				self.LiveEventViewerFooterContainer0:setTopBottom( 1, 1, -885, 195 )
				self.clipFinished( LiveEventViewerFooterContainer0, {} )
			end,
			ShowPrompts = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local LiveEventViewerFooterContainer0Frame2 = function ( LiveEventViewerFooterContainer0, event )
					if not event.interrupted then
						LiveEventViewerFooterContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					LiveEventViewerFooterContainer0:setLeftRight( 0, 1, 0, 0 )
					LiveEventViewerFooterContainer0:setTopBottom( 1, 1, -1080, 0 )
					if event.interrupted then
						self.clipFinished( LiveEventViewerFooterContainer0, event )
					else
						LiveEventViewerFooterContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LiveEventViewerFooterContainer0:completeAnimation()
				self.LiveEventViewerFooterContainer0:setLeftRight( 0, 1, 0, 0 )
				self.LiveEventViewerFooterContainer0:setTopBottom( 1, 1, -885, 195 )
				LiveEventViewerFooterContainer0Frame2( LiveEventViewerFooterContainer0, {} )
			end
		},
		ShowPrompts = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local LiveEventViewerFooterContainer0Frame2 = function ( LiveEventViewerFooterContainer0, event )
					if not event.interrupted then
						LiveEventViewerFooterContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					LiveEventViewerFooterContainer0:setLeftRight( 0, 1, 0, 0 )
					LiveEventViewerFooterContainer0:setTopBottom( 1, 1, -885, 195 )
					if event.interrupted then
						self.clipFinished( LiveEventViewerFooterContainer0, event )
					else
						LiveEventViewerFooterContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LiveEventViewerFooterContainer0:completeAnimation()
				self.LiveEventViewerFooterContainer0:setLeftRight( 0, 1, 0, 0 )
				self.LiveEventViewerFooterContainer0:setTopBottom( 1, 1, -1080, 0 )
				LiveEventViewerFooterContainer0Frame2( LiveEventViewerFooterContainer0, {} )
			end
		}
	}
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "LiveEventViewerMovieAndBackground", controller, "Windowed" )
		UpdateButtonPromptState( self, element, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:subscribeToGlobalModel( controller, "LiveEventViewer", "stream", function ( model )
		local element = self
		if not HasLiveEvent( controller ) then
			DelayGoBack( self, controller )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LiveEventViewerMovieAndBackground:close()
		self.LiveEventViewerFooterContainer0:close()
		self.LiveEventViewerStatusWidget0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LiveEventViewer.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

