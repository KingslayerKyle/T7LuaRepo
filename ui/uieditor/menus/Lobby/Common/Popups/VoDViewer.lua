-- 8c026a9b9fd6bbb6ec3b9a73bae9ba9e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.VoDViewerMovieAndBackground" )
require( "ui.uieditor.widgets.Lobby.Common.VoDViewerFooterContainer" )

local PreLoadFunc = function ( self, controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VoDViewer.buttonPrompts" )
	if CoD.isPC then
		self:setHandleMouse( true )
		self.ImageWithButtonPrompt:setHandleMouse( true )
	end
	self:registerEventHandler( "finished_movie_playback", function ( element, event )
		GoBack( element, controller )
	end )
	local f1_local0 = function ()
		return false
	end
	
	local f1_local1 = function ()
		return true
	end
	
	local f1_local2 = function ()
		SetProperty( self, "showPrompt", true )
		self:setState( "ShowPrompts" )
	end
	
	local f1_local3 = function ()
		SetProperty( self, "showPrompt", false )
		self:setState( "DefaultState" )
		if self.skipHideTimer then
			self.skipHideTimer:close()
			self.skipHideTimer = nil
		end
	end
	
	local f1_local4 = function ()
		self.skipHideTimer = LUI.UITimer.newElementTimer( 5000, true, f1_local3 )
		self:addElement( self.skipHideTimer )
	end
	
	local f1_local5 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if self.skipHideTimer then
			self.skipHideTimer:reset()
		else
			f1_local2()
			f1_local4()
		end
	end
	
	local f1_local6 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if PropertyIsTrue( self, "showPrompt" ) then
			GoBack( f9_arg1, f9_arg2 )
		else
			f1_local5( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		end
		return true
	end
	
	local f1_local7 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if PropertyIsTrue( self, "showPrompt" ) and HasLiveEventStreamQualities() then
			OpenPopup( f10_arg1, "LiveEventViewerQualities", f10_arg2 )
			f1_local3()
		else
			f1_local5( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		end
		return true
	end
	
	local f1_local8 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if PropertyIsTrue( self, "showPrompt" ) then
			if IsChildElementInState( f11_arg1, "LiveEventViewerMovieAndBackground", "Windowed" ) then
				SetElementStateByElementName( f11_arg1, "LiveEventViewerMovieAndBackground", f11_arg2, "DefaultState" )
				CoD.Menu.UpdateButtonShownState( f11_arg0, f11_arg1, f11_arg2, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
				return true
			else
				SetElementStateByElementName( f11_arg1, "LiveEventViewerMovieAndBackground", f11_arg2, "Windowed" )
				CoD.Menu.UpdateButtonShownState( f11_arg0, f11_arg1, f11_arg2, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
				return true
			end
		else
			f1_local5( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		end
	end
	
	local f1_local9 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if IsDpadButton( f12_arg3 ) then
			f1_local5( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		end
	end
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, f1_local9, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, f1_local9, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, f1_local9, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, f1_local9, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, f1_local5, f1_local0, false )
	if LUI.DEV == nil then
		self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, f1_local5, f1_local0, false )
	end
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, f1_local5, f1_local0, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, f1_local6, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CLOSE" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, f1_local7, function ( f14_arg0, f14_arg1, f14_arg2 )
		if HasLiveEventStreamQualities() then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_MLG_CURRENT_QUALITY" )
			return true
		else
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, f1_local8, function ( f15_arg0, f15_arg1, f15_arg2 )
		if f15_arg1.LiveEventViewerMovieAndBackground and IsChildElementInState( f15_arg1, "LiveEventViewerMovieAndBackground", "Windowed" ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_FULLSCREEN" )
			return true
		else
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_WINDOWED" )
			return true
		end
	end, false )
end

local PostLoadFunc = function ( f16_arg0, f16_arg1 )
	CoD.PlayFrontendMusic( "" )
	Dvar.ui_liveEventViewerOpen:set( true )
	LUI.OverrideFunction_CallOriginalSecond( f16_arg0, "close", function ( element )
		Dvar.ui_liveEventViewerOpen:set( false )
		local f17_local0 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
		if f17_local0 then
			CoD.PlayFrontendMusicForLobby( f17_local0 )
		end
	end )
end

LUI.createMenu.VoDViewer = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VoDViewer" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Special_widgets"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VoDViewer.buttonPrompts" )
	local f18_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LiveEventViewerMovieAndBackground = CoD.VoDViewerMovieAndBackground.new( f18_local1, controller )
	LiveEventViewerMovieAndBackground:setLeftRight( true, true, 0, 0 )
	LiveEventViewerMovieAndBackground:setTopBottom( true, true, 0, 0 )
	LiveEventViewerMovieAndBackground:registerEventHandler( "menu_loaded", function ( element, event )
		local f19_local0 = nil
		SizeToSafeArea( element, controller )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	self:addElement( LiveEventViewerMovieAndBackground )
	self.LiveEventViewerMovieAndBackground = LiveEventViewerMovieAndBackground
	
	local LiveEventViewerFooterContainer0 = CoD.VoDViewerFooterContainer.new( f18_local1, controller )
	LiveEventViewerFooterContainer0:setLeftRight( true, true, 0, 0 )
	LiveEventViewerFooterContainer0:setTopBottom( false, true, -720, 0 )
	self:addElement( LiveEventViewerFooterContainer0 )
	self.LiveEventViewerFooterContainer0 = LiveEventViewerFooterContainer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LiveEventViewerFooterContainer0:completeAnimation()
				self.LiveEventViewerFooterContainer0:setLeftRight( true, true, 0, 0 )
				self.LiveEventViewerFooterContainer0:setTopBottom( false, true, -590, 130 )
				self.clipFinished( LiveEventViewerFooterContainer0, {} )
			end,
			ShowPrompts = function ()
				self:setupElementClipCounter( 1 )
				local LiveEventViewerFooterContainer0Frame2 = function ( LiveEventViewerFooterContainer0, event )
					if not event.interrupted then
						LiveEventViewerFooterContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					LiveEventViewerFooterContainer0:setLeftRight( true, true, 0, 0 )
					LiveEventViewerFooterContainer0:setTopBottom( false, true, -720, 0 )
					if event.interrupted then
						self.clipFinished( LiveEventViewerFooterContainer0, event )
					else
						LiveEventViewerFooterContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LiveEventViewerFooterContainer0:completeAnimation()
				self.LiveEventViewerFooterContainer0:setLeftRight( true, true, 0, 0 )
				self.LiveEventViewerFooterContainer0:setTopBottom( false, true, -590, 130 )
				LiveEventViewerFooterContainer0Frame2( LiveEventViewerFooterContainer0, {} )
			end
		},
		ShowPrompts = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LiveEventViewerFooterContainer0:completeAnimation()
				self.LiveEventViewerFooterContainer0:setLeftRight( true, true, 0, 0 )
				self.LiveEventViewerFooterContainer0:setTopBottom( false, true, -720, 0 )
				self.clipFinished( LiveEventViewerFooterContainer0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local LiveEventViewerFooterContainer0Frame2 = function ( LiveEventViewerFooterContainer0, event )
					if not event.interrupted then
						LiveEventViewerFooterContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					LiveEventViewerFooterContainer0:setLeftRight( true, true, 0, 0 )
					LiveEventViewerFooterContainer0:setTopBottom( false, true, -590, 130 )
					if event.interrupted then
						self.clipFinished( LiveEventViewerFooterContainer0, event )
					else
						LiveEventViewerFooterContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LiveEventViewerFooterContainer0:completeAnimation()
				self.LiveEventViewerFooterContainer0:setLeftRight( true, true, 0, 0 )
				self.LiveEventViewerFooterContainer0:setTopBottom( false, true, -720, 0 )
				LiveEventViewerFooterContainer0Frame2( LiveEventViewerFooterContainer0, {} )
			end
		}
	}
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f26_local0 = nil
		SetElementStateByElementName( self, "LiveEventViewerMovieAndBackground", controller, "Windowed" )
		UpdateButtonPromptState( f18_local1, element, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		if not f26_local0 then
			f26_local0 = element:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:subscribeToGlobalModel( controller, "LiveEventViewer", "currentQuality", function ( model )
		UpdateButtonPromptState( f18_local1, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	LiveEventViewerFooterContainer0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f18_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LiveEventViewerMovieAndBackground:close()
		element.LiveEventViewerFooterContainer0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VoDViewer.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

