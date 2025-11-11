require( "ui.uieditor.widgets.Footer.fe_FooterContainerMain" )
require( "ui.uieditor.widgets.Main.AtviCopy" )
require( "ui.uieditor.widgets.Main.StartLabel" )

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	self.unusedControllerAllowed = true
	local platformUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" )
	Engine.SetModelValue( platformUpdateModel, true )
	local beginPlayModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" )
	Engine.SetModelValue( beginPlayModel, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID )
	if Engine.LobbyRemoveAllLocalSplitscreenClient then
		Engine.LobbyRemoveAllLocalSplitscreenClient()
	end
end

local PostLoadFunc = function ( self, controller )
	CoD.LobbyUtility.RegisterEventHandlers( self )
	if Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) == nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive", true ), false )
	end
	Engine.DisableAllClients()
	CoD.LobbyUtility.EndPlay()
	local onButtonPressAction = function ( element, menu, controller, model )
		local data = {
			controller = controller
		}
		if CoDShared.IsDirectorEnabled() then
			data.navToMenu = "director"
		else
			data.navToMenu = "mode_select"
		end
		Engine.LobbyEvent( "OnGoForward", data )
	end
	
	local onButtonPressActionIfDpad = function ( element, menu, controller, model )
		if IsDpadButton( model ) then
			onButtonPressAction( element, menu, controller, model )
		end
	end
	
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local lobbyNav = Engine.GetModelValue( model )
		local f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
		if lobbyNav ~= f5_local0.id then
			if CoDShared.IsDirectorEnabled() then
				NavigateToMenu( self, "Director", true, controller )
			else
				NavigateToMenu( self, "Lobby", true, controller )
			end
		end
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		end
		local pubStorageFilesChanged = Engine.GetModelValue( model )
		if pubStorageFilesChanged == true then
			CoD.OverlayUtility.CreateOverlay( controller, self, "PublisherFilesChangedPopup" )
		end
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), function ( model )
		onButtonPressAction( nil, nil, controller, nil )
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "mainFirstTimeFlowComplete" ), function ( model )
		local firstTimeFlowCompleted = Engine.GetModelValue( model )
		CloseAllOccludingMenus( self, controller )
		onButtonPressAction( nil, nil, controller, nil )
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ), function ( model )
		local FFOTDShutdownModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.FFOTDShutdown" )
		local FFOTDShutdown = Engine.GetModelValue( FFOTDShutdownModel )
		if FFOTDShutdown == nil or FFOTDShutdown == false then
			CloseAllOccludingMenus( self, controller )
		end
	end, false )
	Engine.SendClientScriptNotify( controller, "menu_change" .. CoD.GetLocalClientAdjustedNum( controller ), {
		menu = "Main",
		status = "closeToMenu"
	} )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
		RefreshLobbyRoom( self, controller )
	end )
	local showButtonCondition = function ()
		return false
	end
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "ENTER", onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, onButtonPressAction, showButtonCondition, false )
	self.handleMouseButton = true
	local launchInvitesHotJoin = function ()
		self.launchInvitesHotJoinTimer = nil
		Engine.LivePlatformSessionEnableInviteHotJoin()
	end
	
	local processLaunchEventDelay = 0
	if true == LuaDefine.isPS4 and true == Dvar.platformSessionLaunchInviteJoinProcessDelay:exists() then
		processLaunchEventDelay = Dvar.platformSessionLaunchInviteJoinProcessDelay:get()
	end
	if not self.launchInvitesHotJoinTimer and not Engine.LivePlatformSessionCanProcessLaunchData() then
		self.launchInvitesHotJoinTimer = LUI.UITimer.newElementTimer( processLaunchEventDelay, true, launchInvitesHotJoin )
		self:addElement( self.launchInvitesHotJoinTimer )
	end
end

LUI.createMenu.Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartImage = LUI.UIImage.new()
	StartImage:setLeftRight( 0, 0, 0, 1920 )
	StartImage:setTopBottom( 0, 0, 0, 1080 )
	StartImage:setImage( RegisterImage( "uie_loadscreen_start" ) )
	self:addElement( StartImage )
	self.StartImage = StartImage
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( 0, 1, 0, 0 )
	Fade:setTopBottom( 0, 1, 0, 0 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local StartLabel = CoD.StartLabel.new( self, controller )
	StartLabel:setLeftRight( 0, 0, 0, 1920 )
	StartLabel:setTopBottom( 0, 0, 0, 1080 )
	StartLabel:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
		return retVal
	end )
	StartLabel:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( StartLabel, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, nil, function ( element, menu, controller, model )
		SendButtonPressToMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "", nil )
		return false
	end, false )
	self:addElement( StartLabel )
	self.StartLabel = StartLabel
	
	local ActivisionInc = LUI.UIImage.new()
	ActivisionInc:setLeftRight( 0, 0, 1556, 1832 )
	ActivisionInc:setTopBottom( 0, 0, 996, 1038 )
	ActivisionInc:setRGB( 0.68, 0.68, 0.68 )
	ActivisionInc:setAlpha( 0.9 )
	ActivisionInc:setImage( RegisterImage( "uie_t7_activisionpublishinginc" ) )
	self:addElement( ActivisionInc )
	self.ActivisionInc = ActivisionInc
	
	local feFooterContainer = CoD.fe_FooterContainerMain.new( self, controller )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -120, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local AtviCopyDurango = CoD.AtviCopy.new( self, controller )
	AtviCopyDurango:setLeftRight( 0, 1, 0, 0 )
	AtviCopyDurango:setTopBottom( 0, 1, 0, 0 )
	AtviCopyDurango:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( AtviCopyDurango )
	self.AtviCopyDurango = AtviCopyDurango
	
	self.resetProperties = function ()
		Fade:completeAnimation()
		StartLabel:completeAnimation()
		ActivisionInc:completeAnimation()
		feFooterContainer:completeAnimation()
		AtviCopyDurango:completeAnimation()
		Fade:setAlpha( 0 )
		StartLabel:setAlpha( 1 )
		ActivisionInc:setAlpha( 0.9 )
		feFooterContainer:setAlpha( 1 )
		AtviCopyDurango:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local FadeFrame2 = function ( Fade, event )
					local FadeFrame3 = function ( Fade, event )
						if not event.interrupted then
							Fade:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						end
						Fade:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Fade, event )
						else
							Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeFrame3( Fade, event )
						return 
					else
						Fade:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Fade:registerEventHandler( "transition_complete_keyframe", FadeFrame3 )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
				local StartLabelFrame2 = function ( StartLabel, event )
					local StartLabelFrame3 = function ( StartLabel, event )
						if not event.interrupted then
							StartLabel:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						StartLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( StartLabel, event )
						else
							StartLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						StartLabelFrame3( StartLabel, event )
						return 
					else
						StartLabel:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						StartLabel:setAlpha( 0 )
						StartLabel:registerEventHandler( "transition_complete_keyframe", StartLabelFrame3 )
					end
				end
				
				StartLabel:completeAnimation()
				self.StartLabel:setAlpha( 1 )
				StartLabelFrame2( StartLabel, {} )
				local ActivisionIncFrame2 = function ( ActivisionInc, event )
					local ActivisionIncFrame3 = function ( ActivisionInc, event )
						if not event.interrupted then
							ActivisionInc:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						ActivisionInc:setAlpha( 0.9 )
						if event.interrupted then
							self.clipFinished( ActivisionInc, event )
						else
							ActivisionInc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ActivisionIncFrame3( ActivisionInc, event )
						return 
					else
						ActivisionInc:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						ActivisionInc:setAlpha( 0.9 )
						ActivisionInc:registerEventHandler( "transition_complete_keyframe", ActivisionIncFrame3 )
					end
				end
				
				ActivisionInc:completeAnimation()
				self.ActivisionInc:setAlpha( 0 )
				ActivisionIncFrame2( ActivisionInc, {} )
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setAlpha( 0 )
				self.clipFinished( feFooterContainer, {} )
				AtviCopyDurango:completeAnimation()
				self.AtviCopyDurango:setAlpha( 0 )
				self.clipFinished( AtviCopyDurango, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local FadeFrame2 = function ( Fade, event )
					local FadeFrame3 = function ( Fade, event )
						if not event.interrupted then
							Fade:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						end
						Fade:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Fade, event )
						else
							Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeFrame3( Fade, event )
						return 
					else
						Fade:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Fade:registerEventHandler( "transition_complete_keyframe", FadeFrame3 )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
				StartLabel:completeAnimation()
				self.StartLabel:setAlpha( 0 )
				self.clipFinished( StartLabel, {} )
				ActivisionInc:completeAnimation()
				self.ActivisionInc:setAlpha( 0 )
				self.clipFinished( ActivisionInc, {} )
				local AtviCopyDurangoFrame2 = function ( AtviCopyDurango, event )
					if not event.interrupted then
						AtviCopyDurango:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					AtviCopyDurango:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AtviCopyDurango, event )
					else
						AtviCopyDurango:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AtviCopyDurango:completeAnimation()
				self.AtviCopyDurango:setAlpha( 1 )
				AtviCopyDurangoFrame2( AtviCopyDurango, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Durango",
			condition = function ( menu, element, event )
				return IsDurango()
			end
		}
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		CoD.LobbyUtility.SetInitLobbyMenu( self, controller )
		MenuHidesFreeCursor( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, function ( element, menu, controller, model )
		if IsDurango() then
			ShowAccountPicker( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsDurango() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "", nil )
			return false
		else
			return false
		end
	end, false )
	StartLabel.id = "StartLabel"
	feFooterContainer:setModel( self.buttonModel, controller )
	AtviCopyDurango.id = "AtviCopyDurango"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.StartLabel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartLabel:close()
		self.feFooterContainer:close()
		self.AtviCopyDurango:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

