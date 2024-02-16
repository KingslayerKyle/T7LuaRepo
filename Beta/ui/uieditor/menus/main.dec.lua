require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Main.StartLabel" )

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	self.unusedControllerAllowed = true
end

local CloseAllPopups = function ( self, controller )
	local occludedMenu = self.occludedBy
	while occludedMenu ~= nil do
		if occludedMenu.occludedBy ~= nil then
			occludedMenu = occludedMenu.occludedBy
		end
		local previousMenu = occludedMenu
		while previousMenu ~= self do
			previousMenu = GoBackToMenu( previousMenu, controller, self.menuName )
		end
		return 
	end
end

local PostLoadFunc = function ( self, controller )
	CoD.LobbyBase.RegisterEventHandlers( self )
	Engine.DisableAllClients()
	CoD.LobbyBase.EndPlay()
	local onButtonPressAction = function ( element, menu, controller, model )
		if Engine.IsCinematicPlaying() then
			return 
		elseif not IsMainFirstTimeSetup( controller ) then
			LobbyBeginPlay( self, controller )
		end
		PlaySoundSetSound( self, "action" )
		LoadSaveGameData( self, controller )
		if IsMainFirstTimeSetup( controller ) then
			if ShouldDisplayLanguageSelectionScreen() then
				OpenOverlay( self, "FirstTimeLanguageSelectionSetting", controller )
			else
				OpenOverlay( self, "FirstTimeBrightnessSetting", controller )
			end
		end
	end
	
	local onButtonPressActionIfDpad = function ( element, menu, controller, model )
		if IsDpadButton( model ) then
			onButtonPressAction( element, menu, controller, model )
		end
	end
	
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local lobbyNav = Engine.GetModelValue( model )
		if lobbyNav ~= LobbyData.UITargets.UI_MAIN.id then
			local lobbyMenu = CoD.Menu.safeCreateMenu( "Lobby", controller )
			local f6_local0 = self:getParent()
			f6_local0:addElement( lobbyMenu )
			lobbyMenu:processEvent( {
				name = "menu_opened",
				controller = controller
			} )
			self:close()
			lobbyMenu:tryOpenFirstTimeFlow( controller )
		end
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		end
		local pubStorageFilesChanged = Engine.GetModelValue( model )
		if pubStorageFilesChanged == true then
			CoD.OverlayUtility.CreateOverlay( controller, self, "PublisherFilesChangedPopup" )
		end
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "mainFirstTimeFlowComplete" ), function ( model )
		local firstTimeFlowCompleted = Engine.GetModelValue( model )
		CloseAllPopups( self, controller )
		onButtonPressAction( nil, nil, controller, nil )
	end, false )
	Engine.SendClientScriptNotify( controller, "menu_change", "Main", "closeToMenu" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
		RefreshLobbyRoom( self, controller )
	end )
	local showButtonCondition = function ()
		return false
	end
	
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_LEFT, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_UP, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_DOWN, nil, onButtonPressActionIfDpad, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, onButtonPressAction, showButtonCondition, false )
	if LUI.DEV == nil then
		self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_BACK, nil, onButtonPressAction, showButtonCondition, false )
	end
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_START, "ENTER", onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_LB, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_RB, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, onButtonPressAction, showButtonCondition, false )
	self:AddButtonCallbackFunction( controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, onButtonPressAction, showButtonCondition, false )
	self.handleMouseButton = true
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
	local menu = self
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
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( menu, controller )
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
		menu:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = menu,
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
	
	local StartLabel = CoD.StartLabel.new( menu, controller )
	StartLabel:setLeftRight( true, false, 0, 1280 )
	StartLabel:setTopBottom( true, false, 0, 720 )
	StartLabel:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
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
	menu:AddButtonCallbackFunction( StartLabel, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, nil, function ( element, menu, controller, model )
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetInitLobbyMenu( self, controller )
		CreateDefaultHeroRendersForMP( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	StartLabel.id = "StartLabel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.StartLabel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FadeForStreamer:close()
		self.StartLabel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

