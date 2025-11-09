require( "ui.uieditor.menus.Spinner" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Main.StartLabel" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainerMain" )
require( "ui.uieditor.widgets.Main.AtviCopy" )

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	self.unusedControllerAllowed = true
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" ), true )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID )
	if Engine.LobbyRemoveAllLocalSplitscreenClient then
		Engine.LobbyRemoveAllLocalSplitscreenClient()
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.LobbyBase.RegisterEventHandlers( f2_arg0 )
	if Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) == nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive", true ), false )
	end
	f2_arg0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), function ( model )
		if Engine.GetModelValue( model ) == true then
			f2_arg0.spinner = OpenPopup( f2_arg0, "Spinner", f2_arg1, nil, f2_arg0 )
		else
			f2_arg0:dispatchEventToRoot( {
				name = "spinner_close"
			} )
			f2_arg0.spinner = nil
		end
	end, true )
	Engine.DisableAllClients()
	CoD.LobbyBase.EndPlay()
	local f2_local0 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if Engine.IsCinematicPlaying() then
			return 
		elseif not Engine.LiveIsControllerSignedIn( f4_arg2 ) and not Engine.SignIntoPlatformLiveSystem( f4_arg2 ) then
			return 
		elseif Engine.IsUserGuest( f4_arg2 ) then
			LuaUtils.UI_ShowErrorMessageDialog( f4_arg2, "MENU_GUEST_CONTENT_RESTRICTED" )
			return 
		elseif not LobbyBeginPlay( f2_arg0, f4_arg2 ) then
			return 
		else
			PlaySoundSetSound( f2_arg0, "action" )
		end
	end
	
	local f2_local1 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if IsDpadButton( f5_arg3 ) then
			f2_local0( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		end
	end
	
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		if Engine.GetModelValue( model ) ~= LobbyData.UITargets.UI_MAIN.id then
			if f2_arg0.spinner ~= nil then
				if UnregisterOpenedMenu then
					UnregisterOpenedMenu( f2_arg0.spinner, f2_arg0.spinner.menuName )
				end
				f2_arg0.spinner = nil
			end
			local f6_local0 = CoD.Menu.safeCreateMenu( "Lobby", f2_arg1 )
			local f6_local1 = f2_arg0:getParent()
			f6_local1:addElement( f6_local0 )
			f6_local0:processEvent( {
				name = "menu_opened",
				controller = f2_arg1
			} )
			f2_arg0:close()
		end
	end, false )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		elseif Engine.GetModelValue( model ) == true then
			CoD.OverlayUtility.CreateOverlay( f2_arg1, f2_arg0, "PublisherFilesChangedPopup" )
		end
	end, false )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
			Engine.SetModelValue( model, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID )
			Engine.ActivatePrimaryLocalClient( 0 )
			CoD.LobbyBase.BeginLivePlay( f2_arg0, 0 )
		elseif modelValue == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
			Engine.SetModelValue( model, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID )
			Engine.ActivatePrimaryLocalClient( 0 )
			CoD.LobbyBase.BeginLANPlay( f2_arg0, 0 )
		end
	end, false )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "mainFirstTimeFlowComplete" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		CloseAllOccludingMenus( f2_arg0, f2_arg1 )
		f2_local0( nil, nil, f2_arg1, nil )
	end, false )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ), function ( model )
		local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.FFOTDShutdown" ) )
		if modelValue == nil or modelValue == false then
			CloseAllOccludingMenus( f2_arg0, f2_arg1 )
		end
	end, false )
	Engine.SendClientScriptNotify( f2_arg1, "menu_change" .. CoD.GetLocalClientAdjustedNum( f2_arg1 ), "Main", "closeToMenu" )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
		RefreshLobbyRoom( f2_arg0, f2_arg1 )
	end )
	local f2_local2 = function ()
		return false
	end
	
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_LEFT, nil, f2_local1, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_UP, nil, f2_local1, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_RIGHT, nil, f2_local1, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_DOWN, nil, f2_local1, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_START, "ENTER", f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_LB, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_RB, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_LTRIG, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_RTRIG, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, f2_local0, f2_local2, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, f2_local0, f2_local2, false )
	f2_arg0.handleMouseButton = true
	local f2_local3 = function ()
		f2_arg0.launchInvitesHotJoinTimer = nil
		Engine.LivePlatformSessionEnableInviteHotJoin()
	end
	
	local f2_local4 = 0
	if true == LuaUtils.isPS4 and true == Dvar.platformSessionLaunchInviteJoinProcessDelay:exists() then
		f2_local4 = Dvar.platformSessionLaunchInviteJoinProcessDelay:get()
	end
	if not f2_arg0.launchInvitesHotJoinTimer and not Engine.LivePlatformSessionCanProcessLaunchData() then
		f2_arg0.launchInvitesHotJoinTimer = LUI.UITimer.newElementTimer( f2_local4, true, f2_local3 )
		f2_arg0:addElement( f2_arg0.launchInvitesHotJoinTimer )
	end
end

LUI.createMenu.Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( false, false, -650.5, 648.5 )
	Vignette:setTopBottom( false, false, -313, 407 )
	Vignette:setAlpha( 0.8 )
	Vignette:setZRot( 180 )
	Vignette:setImage( RegisterImage( "uie_frontend_vingette_c" ) )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:setLeftRight( true, false, 0, 1280 )
	FadeForStreamer:setTopBottom( true, false, 0, 720 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, true, 0, 0 )
	Fade:setTopBottom( true, true, 0, 0 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local StartLabel = CoD.StartLabel.new( self, controller )
	StartLabel:setLeftRight( true, false, 0, 1280 )
	StartLabel:setTopBottom( true, false, 0, 720 )
	StartLabel:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
		return f17_local0
	end )
	StartLabel:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( StartLabel, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, nil, function ( element, menu, controller, model )
		SendButtonPressToMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "" )
		return false
	end, false )
	self:addElement( StartLabel )
	self.StartLabel = StartLabel
	
	local ActivisionInc = LUI.UIImage.new()
	ActivisionInc:setLeftRight( true, false, 1037, 1221 )
	ActivisionInc:setTopBottom( true, false, 664, 692 )
	ActivisionInc:setRGB( 0.68, 0.68, 0.68 )
	ActivisionInc:setAlpha( 0.9 )
	ActivisionInc:setImage( RegisterImage( "uie_t7_activisionpublishinginc" ) )
	self:addElement( ActivisionInc )
	self.ActivisionInc = ActivisionInc
	
	local feFooterContainer = CoD.fe_FooterContainerMain.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -80, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f21_local0 = nil
		SizeToSafeArea( element, controller )
		if not f21_local0 then
			f21_local0 = element:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local AtviCopyDurango = CoD.AtviCopy.new( self, controller )
	AtviCopyDurango:setLeftRight( true, true, 0, 0 )
	AtviCopyDurango:setTopBottom( true, true, 0, 0 )
	AtviCopyDurango:registerEventHandler( "menu_loaded", function ( element, event )
		local f22_local0 = nil
		SizeToSafeArea( element, controller )
		if not f22_local0 then
			f22_local0 = element:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	self:addElement( AtviCopyDurango )
	self.AtviCopyDurango = AtviCopyDurango
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
						ActivisionInc:setLeftRight( true, false, 1037, 1221 )
						ActivisionInc:setTopBottom( true, false, 664, 692 )
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
				self.ActivisionInc:setLeftRight( true, false, 1037, 1221 )
				self.ActivisionInc:setTopBottom( true, false, 664, 692 )
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
				StartLabel:completeAnimation()
				self.StartLabel:setAlpha( 0 )
				self.clipFinished( StartLabel, {} )
				ActivisionInc:completeAnimation()
				self.ActivisionInc:setAlpha( 0 )
				self.clipFinished( ActivisionInc, {} )
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setAlpha( 1 )
				self.clipFinished( feFooterContainer, {} )
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f35_local0 = nil
		SetInitLobbyMenu( self, controller )
		if not f35_local0 then
			f35_local0 = self:dispatchEventToChildren( event )
		end
		return f35_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, function ( element, menu, controller, model )
		if IsDurango() then
			ShowAccountPicker( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "" )
		if IsDurango() then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FadeForStreamer:close()
		element.StartLabel:close()
		element.feFooterContainer:close()
		element.AtviCopyDurango:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

