require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Main.StartLabel" )

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	self.unusedControllerAllowed = true
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.occludedBy
	while f2_local0 ~= nil do
		if f2_local0.occludedBy ~= nil then
			f2_local0 = f2_local0.occludedBy
		end
		local f2_local1 = f2_local0
		while f2_local1 ~= f2_arg0 do
			f2_local1 = GoBackToMenu( f2_local1, f2_arg1, f2_arg0.menuName )
		end
		return 
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	CoD.LobbyBase.RegisterEventHandlers( f3_arg0 )
	Engine.DisableAllClients()
	CoD.LobbyBase.EndPlay()
	local f3_local0 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if Engine.IsCinematicPlaying() then
			return 
		elseif not Engine.LiveIsControllerSignedIn( f4_arg2 ) then
			return 
		elseif Engine.IsUserGuest( f4_arg2 ) then
			LuaUtils.UI_ShowErrorMessageDialog( f4_arg2, "MENU_GUEST_CONTENT_RESTRICTED" )
			return 
		elseif not IsMainFirstTimeSetup( f4_arg2 ) then
			LobbyBeginPlay( f3_arg0, f4_arg2 )
		end
		PlaySoundSetSound( f3_arg0, "action" )
		LoadSaveGameData( f3_arg0, f4_arg2 )
		if IsMainFirstTimeSetup( f4_arg2 ) then
			if ShouldDisplayLanguageSelectionScreen() then
				OpenOverlay( f3_arg0, "FirstTimeLanguageSelectionSetting", f4_arg2 )
			else
				OpenOverlay( f3_arg0, "FirstTimeBrightnessSetting", f4_arg2 )
			end
		end
	end
	
	local f3_local1 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if IsDpadButton( f5_arg3 ) then
			f3_local0( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		end
	end
	
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		if Engine.GetModelValue( model ) ~= LobbyData.UITargets.UI_MAIN.id then
			local f6_local0 = CoD.Menu.safeCreateMenu( "Lobby", f3_arg1 )
			local f6_local1 = f3_arg0:getParent()
			f6_local1:addElement( f6_local0 )
			f6_local0:processEvent( {
				name = "menu_opened",
				controller = f3_arg1
			} )
			f3_arg0:close()
			f6_local0:tryOpenFirstTimeFlow( f3_arg1 )
		end
	end, false )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		elseif Engine.GetModelValue( model ) == true then
			CoD.OverlayUtility.CreateOverlay( f3_arg1, f3_arg0, "PublisherFilesChangedPopup" )
		end
	end, false )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "mainFirstTimeFlowComplete" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		f0_local1( f3_arg0, f3_arg1 )
		f3_local0( nil, nil, f3_arg1, nil )
	end, false )
	Engine.SendClientScriptNotify( f3_arg1, "menu_change", "Main", "closeToMenu" )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
		RefreshLobbyRoom( f3_arg0, f3_arg1 )
	end )
	local f3_local2 = function ()
		return false
	end
	
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LEFT, nil, f3_local1, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_UP, nil, f3_local1, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RIGHT, nil, f3_local1, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_DOWN, nil, f3_local1, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, f3_local0, f3_local2, false )
	if LUI.DEV == nil then
		f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_BACK, nil, f3_local0, f3_local2, false )
	end
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_START, "ENTER", f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LB, nil, f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RB, nil, f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LTRIG, nil, f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RTRIG, nil, f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, f3_local0, f3_local2, false )
	f3_arg0:AddButtonCallbackFunction( f3_arg0, f3_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, f3_local0, f3_local2, false )
	f3_arg0.handleMouseButton = true
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
	self:playSound( "menu_open" )
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
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
		return f14_local0
	end )
	StartLabel:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
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
	ActivisionInc:setImage( RegisterImage( "uie_t7_activisionpublishinginc" ) )
	self:addElement( ActivisionInc )
	self.ActivisionInc = ActivisionInc
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
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
						StartLabel:registerEventHandler( "transition_complete_keyframe", StartLabelFrame3 )
					end
				end
				
				StartLabel:completeAnimation()
				self.StartLabel:setAlpha( 0 )
				StartLabelFrame2( StartLabel, {} )
				local ActivisionIncFrame2 = function ( ActivisionInc, event )
					if not event.interrupted then
						ActivisionInc:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					ActivisionInc:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ActivisionInc, event )
					else
						ActivisionInc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ActivisionInc:completeAnimation()
				self.ActivisionInc:setAlpha( 0 )
				ActivisionIncFrame2( ActivisionInc, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f24_local0 = nil
		SetInitLobbyMenu( self, controller )
		CreateDefaultHeroRendersForMP( self, self, controller )
		if not f24_local0 then
			f24_local0 = self:dispatchEventToChildren( event )
		end
		return f24_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsPC() and IsBooleanDvarSet( "ui_execdemo_beta" ) then
			OpenPCQuit( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		if IsPC() and IsBooleanDvarSet( "ui_execdemo_beta" ) then
			return false
		else
			return false
		end
	end, false )
	StartLabel.id = "StartLabel"
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

