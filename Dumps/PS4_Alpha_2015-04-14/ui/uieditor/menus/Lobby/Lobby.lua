require( "ui.uieditor.menus.Lobby.Common.Popups.PartyPrivacyPopup" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.menus.AAR.MPAAR" )
require( "ui.uieditor.widgets.Lobby.Common.LeftContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyList" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideSelectedPlayerInfo" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVote" )
require( "ui.uieditor.widgets.Lobby.Backgrounds.HelpBackground" )

local SetupForPC = function ( self )
	if CoD.useMouse then
		self.ClientList.m_mouseDisabled = true
	end
end

local PreLoadFunc = function ( self, controller )
	require( "ui.uieditor.widgets.Lobby.Common.FE_HelpWidgetLeft" )
	require( "ui.uieditor.widgets.Lobby.Common.FE_HelpWidgetRight" )
	self.addButtonPrompt = function ( self, button, promptString, promptShortcutKey, element )
		if button == "start" and not CoD.isPC then
			local startButtonName = "buttonPrompt_start"
			if self[startButtonName] then
				self:removeButtonPrompt( "start", self )
			end
			self[startButtonName] = CoD.FE_HelpWidgetLeft.new( self, self:getOwner() )
			local startButton = self[startButtonName]
			startButton.label:setText( Engine.Localize( "MENU_MENU" ) )
			ScaleWidgetToLabel( startButton, startButton.label, 0 )
			self:addLeftButtonPrompt( startButton )
			startButton:setPriority( -999999 )
		elseif button == "alt2" and not CoD.isPC then
			local socialButtonName = "buttonPrompt_alt2"
			if self[socialButtonName] then
				self:removeButtonPrompt( "alt2", self )
			end
			self[socialButtonName] = CoD.FE_HelpWidgetRight.new( self, self:getOwner() )
			local socialButton = self[socialButtonName]
			socialButton.label:setText( Engine.Localize( "MENU_SOCIAL" ) )
			ScaleWidgetToLabel( socialButton, socialButton.label, 0 )
			self:addRightButtonPrompt( socialButton )
			socialButton:setPriority( -999999 )
		else
			CoD.Menu.addButtonPrompt( self, button, promptString, promptShortcutKey, element )
		end
	end
	
end

local PostLoadFunc = function ( self, controller )
	self.LeftContainer.navigation = nil
	self.LeftContainer.navigation = {}
	self.LeftContainer.navigation.right = self.ClientList
	self.LeftContainer.navigation.down = self.MapVote
	self.LeftContainer.navigation.up = self.MapVote
	self.ClientList.navigation = nil
	self.ClientList.navigation = {}
	self.ClientList.navigation.left = self.LeftContainer
	self.MapVote.navigation = nil
	self.MapVote.navigation = {}
	self.MapVote.navigation.up = self.LeftContainer
	self.MapVote.navigation.down = self.LeftContainer
	self.MapVote.navigation.right = self.ClientList
	self:clearSavedState()
	CoD.LobbyBase.RegisterEventHandlers( self )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
		if not self.occludedBy then
			Engine.SendMenuResponse( controller, "Main", Engine.GetModelValue( model ) )
		end
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		if not self.occludedBy then
			local room = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" ) )
			Engine.SendMenuResponse( controller, "Main", room )
			local nav = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
			if nav == LobbyData.UITargets.UI_MAIN.id then
				NavigateToMenu( self, "Main", true, controller )
			end
		end
		local lobbyNav = Engine.GetModelValue( model )
		if lobbyNav == LobbyData.UITargets.UI_MODESELECT.id then
			CoD.PlayFrontendMusic( "mus_main_frontend" )
		end
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), function ( model )
		local room = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" ) )
		Engine.SendMenuResponse( controller, "Main", room )
	end )
	self:registerEventHandler( "update_team_selection_buttons", function ( self, event )
		self:removeButtonPrompt( "shoulderr", self )
		self:removeButtonPrompt( "shoulderl", self )
		if Engine.GetGametypeSetting( "autoTeamBalance" ) ~= 1 then
			self.buttonPromptAddFunctions:shoulderr( nil, event )
			self.buttonPromptAddFunctions:shoulderl( nil, event )
		end
	end )
	SetupForPC( self )
	if Dvar.ui_execdemo_cp:get() then
		self.Vignette:setAlpha( 0 )
	end
end

LUI.createMenu.Lobby = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Lobby" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( false, false, -640, 640 )
	Vignette:setTopBottom( false, false, -360, 360 )
	Vignette:setImage( RegisterImage( "uie_frontend_vingette_c" ) )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, true, 0, 0 )
	Fade:setTopBottom( true, true, 0, 0 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	Fade:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Fade:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		PlayClip( self, "FadeIn", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Fade )
	self.Fade = Fade
	
	local LeftContainer = CoD.LeftContainer.new( self, controller )
	LeftContainer:setLeftRight( true, false, 0, 520 )
	LeftContainer:setTopBottom( true, false, 0, 720 )
	LeftContainer:setRGB( 1, 1, 1 )
	LeftContainer.selectionList.selectionList:setDataSource( "LobbyButtons" )
	LeftContainer:mergeStateConditions( {
		{
			stateName = "ListUp",
			condition = function ( menu, element, event )
				return not IsMainModeInvalidAndNotTheaterMode()
			end
		},
		{
			stateName = "ListUpCopy",
			condition = function ( menu, element, event )
				return IsBooleanDvarSet( "ui_execdemo" )
			end
		}
	} )
	LeftContainer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" ), function ( model )
		self:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyMainMode"
		} )
	end )
	LeftContainer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LeftContainer )
	self.LeftContainer = LeftContainer
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
	LineSide:setTopBottom( true, false, 52, 640 )
	LineSide:setRGB( 1, 1, 1 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local ClientList = CoD.LobbyList.new( self, controller )
	ClientList:setLeftRight( true, false, 800.5, 1280 )
	ClientList:setTopBottom( true, false, 36, 684 )
	ClientList:setRGB( 1, 1, 1 )
	ClientList:setYRot( -20 )
	self:addElement( ClientList )
	self.ClientList = ClientList
	
	local slideSound = LUI.UIElement.new()
	slideSound:setLeftRight( true, false, 709, 757 )
	slideSound:setTopBottom( true, false, -48, 0 )
	self:addElement( slideSound )
	self.slideSound = slideSound
	
	local SelectedPlayerInfo = CoD.LobbySlideSelectedPlayerInfo.new( self, controller )
	SelectedPlayerInfo:setLeftRight( true, false, 1404, 1724 )
	SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
	SelectedPlayerInfo:setRGB( 1, 1, 1 )
	SelectedPlayerInfo:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		}
	} )
	self:addElement( SelectedPlayerInfo )
	self.SelectedPlayerInfo = SelectedPlayerInfo
	
	local MapVote = CoD.MapVote.new( self, controller )
	MapVote:setLeftRight( true, false, 69, 424 )
	MapVote:setTopBottom( true, false, 434, 614 )
	MapVote:setRGB( 1, 1, 1 )
	MapVote:setYRot( 25 )
	MapVote.MapVoting:setText( Engine.Localize( "MENU_VOTING_VOTE_STRING" ) )
	MapVote:subscribeToGlobalModel( controller, "Lobby", "lobbyStatus", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVote.LobbyStatus:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MapVote )
	self.MapVote = MapVote
	
	local HelpBackground = CoD.HelpBackground.new( self, controller )
	HelpBackground:setLeftRight( true, false, 0, 1280 )
	HelpBackground:setTopBottom( true, false, 659, 720 )
	HelpBackground:setRGB( 1, 1, 1 )
	self:addElement( HelpBackground )
	self.HelpBackground = HelpBackground
	
	local LineSide1 = LUI.UIImage.new()
	LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
	LineSide1:setTopBottom( true, false, 52, 640 )
	LineSide1:setRGB( 1, 1, 1 )
	LineSide1:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide1 )
	self.LineSide1 = LineSide1
	
	local NoiseOverlay = LUI.UIImage.new()
	NoiseOverlay:setLeftRight( true, true, 0, 0 )
	NoiseOverlay:setTopBottom( true, true, 0, 0 )
	NoiseOverlay:setRGB( 1, 1, 1 )
	NoiseOverlay:setAlpha( 0.3 )
	NoiseOverlay:setImage( RegisterImage( "uie_t7_menu_frontend_textureoverlaya" ) )
	NoiseOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NoiseOverlay )
	self.NoiseOverlay = NoiseOverlay
	
	LeftContainer.navigation = {
		left = MapVote,
		right = ClientList,
		down = MapVote
	}
	ClientList.navigation = {
		left = LeftContainer,
		right = SelectedPlayerInfo
	}
	SelectedPlayerInfo.navigation = {
		left = ClientList
	}
	MapVote.navigation = {
		up = LeftContainer,
		right = LeftContainer
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
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
			end
		},
		Left = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, 0, 520 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 1 )
				self.clipFinished( LeftContainer, {} )
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide, {} )
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 800.5, 1280 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( -20 )
				self.clipFinished( ClientList, {} )
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 1404, 1724 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				self.clipFinished( SelectedPlayerInfo, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, 69, 424 )
				self.MapVote:setTopBottom( true, false, 434, 614 )
				self.clipFinished( MapVote, {} )
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1307.5, 1310.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide1, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Fade:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fade, event )
					else
						Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
			end,
			Right = function ()
				self:setupElementClipCounter( 6 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 129, false, true, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, -520, 0 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					LeftContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, 0, 520 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 1 )
				LeftContainerFrame2( LeftContainer, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( true, false, 42.5, 45.5 )
					LineSide:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				LineSideFrame2( LineSide, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 0, 479.5 )
					ClientList:setTopBottom( true, false, 36, 684 )
					ClientList:setYRot( 20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 800.5, 1280 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( -20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( true, false, 896, 1216 )
					SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 1404, 1724 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, -462, -107 )
					MapVote:setTopBottom( true, false, 437.5, 617.5 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, 69, 424 )
				self.MapVote:setTopBottom( true, false, 434, 614 )
				MapVoteFrame2( MapVote, {} )
				local LineSide1Frame2 = function ( LineSide1, event )
					if not event.interrupted then
						LineSide1:beginAnimation( "keyframe", 219, false, true, CoD.TweenType.Linear )
					end
					LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
					LineSide1:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide1, event )
					else
						LineSide1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1307.5, 1310.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				LineSide1Frame2( LineSide1, {} )
			end
		},
		Right = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, -520, 0 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 0 )
				self.clipFinished( LeftContainer, {} )
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 42.5, 45.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide, {} )
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 0, 479.5 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( 20 )
				self.clipFinished( ClientList, {} )
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 896, 1216 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				self.clipFinished( SelectedPlayerInfo, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, -462, -107 )
				self.MapVote:setTopBottom( true, false, 437.5, 617.5 )
				self.clipFinished( MapVote, {} )
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide1, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
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
			end,
			Left = function ()
				self:setupElementClipCounter( 6 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, 0, 520 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					LeftContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, -520, 0 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 0 )
				LeftContainerFrame2( LeftContainer, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
					LineSide:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 42.5, 45.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				LineSideFrame2( LineSide, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 800.5, 1280 )
					ClientList:setTopBottom( true, false, 36, 684 )
					ClientList:setYRot( -20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 0, 479.5 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( 20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( true, false, 1450, 1770 )
					SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 896, 1216 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, 69, 424 )
					MapVote:setTopBottom( true, false, 434, 614 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, -462, -107 )
				self.MapVote:setTopBottom( true, false, 437.5, 617.5 )
				MapVoteFrame2( MapVote, {} )
				local LineSide1Frame2 = function ( LineSide1, event )
					if not event.interrupted then
						LineSide1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					LineSide1:setLeftRight( true, false, 1307.5, 1310.5 )
					LineSide1:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide1, event )
					else
						LineSide1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				LineSide1Frame2( LineSide1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Left",
			condition = function ( menu, element, event )
				return IsWidgetInFocus( self, "LeftContainer", event )
			end
		},
		{
			stateName = "Right",
			condition = function ( menu, element, event )
				return IsWidgetInFocus( self, "ClientList", event )
			end
		}
	} )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if IsIntDvarNonZero( "social_disabled" ) and not IsLAN() then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_SOCIAL" ), "F", element )
			return true
		elseif not IsIntDvarNonZero( "social_disabled" ) and not IsLAN() then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_SOCIAL_CAPS" ), "S", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if IsBooleanDvarSet( "partyPrivacyEnabled" ) and IsLobbyPrivateHost() and IsWidgetInFocus( self, "LeftContainer", event ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_PARTY_PRIVACY_STATUS" ), "P", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		menu:addButtonPrompt( "start", Engine.Localize( "MENU_MENU" ), "M", element )
		return true
	end
	
	self.buttonPromptAddFunctions.shoulderr = function ( menu, element, event )
		if IsCustomLobby() and IsMultiplayer() then
			menu:addButtonPrompt( "shoulderr", Engine.Localize( " " ), "W", element )
			return true
		elseif IsMultiplayer() and IsLobbyNetworkModeLAN() then
			menu:addButtonPrompt( "shoulderr", Engine.Localize( " " ), "W", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.shoulderl = function ( menu, element, event )
		if IsCustomLobby() and IsMultiplayer() then
			menu:addButtonPrompt( "shoulderl", Engine.Localize( "MPUI_CHANGE_ROLE" ), "Q", element )
			return true
		elseif IsMultiplayer() and IsLobbyNetworkModeLAN() then
			menu:addButtonPrompt( "shoulderl", Engine.Localize( "MPUI_CHANGE_ROLE" ), "Q", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.select = function ( menu, element, event )
		if CanShowAAR( controller ) and IsMultiplayer() and IsGameLobbyActive() then
			menu:addButtonPrompt( "select", Engine.Localize( "MPUI_AFTER_ACTION_REPORT" ), "A", element )
			return true
		else
			
		end
	end
	
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyNetworkMode"
		}
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
		if not element.buttonPromptAddFunctions.shoulderr( self, element, event ) then
			self:removeButtonPrompt( "shoulderr", element )
		end
		if not element.buttonPromptAddFunctions.shoulderl( self, element, event ) then
			self:removeButtonPrompt( "shoulderl", element )
		end
		if not element.buttonPromptAddFunctions.select( self, element, event ) then
			self:removeButtonPrompt( "select", element )
		end
	end )
	self:registerEventHandler( "on_session_start", function ( element, event )
		if not element.buttonPromptAddFunctions.alt1( self, element, event ) then
			self:removeButtonPrompt( "alt1", element )
		end
	end )
	self:registerEventHandler( "on_session_end", function ( element, event )
		if not element.buttonPromptAddFunctions.alt1( self, element, event ) then
			self:removeButtonPrompt( "alt1", element )
		end
	end )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt1( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.start( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.shoulderr( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.shoulderl( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.select( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			LobbyGoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "F") and IsIntDvarNonZero( "social_disabled" ) and not IsLAN() then
			OpenFriends( self, element, controller, "", self )
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "P") and IsBooleanDvarSet( "partyPrivacyEnabled" ) and IsLobbyPrivateHost() and IsWidgetInFocus( self, "LeftContainer", event ) then
			OpenPopup( self, "PartyPrivacyPopup", controller )
		end
		if not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "M") then
			OpenOverlay( self, "StartMenu_Main", controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "S") and not IsIntDvarNonZero( "social_disabled" ) and not IsLAN() then
			OpenPopup( self, "Social_Main", controller )
		end
		if not self.occludedBy and (event.button == "shoulderr" or event.button == "key_shortcut" and event.key == "W") then
			if IsCustomLobby() and IsMultiplayer() then
				LobbyTeamSelectionRB( self, controller )
				PlaySoundSetSound( self, "team_switch" )
			elseif IsMultiplayer() and IsLobbyNetworkModeLAN() then
				LobbyTeamSelectionRB( self, controller )
				PlaySoundSetSound( self, "team_switch" )
			end
		end
		if not self.occludedBy and (event.button == "shoulderl" or event.button == "key_shortcut" and event.key == "Q") then
			if IsCustomLobby() and IsMultiplayer() then
				LobbyTeamSelectionLB( self, controller )
				PlaySoundSetSound( self, "team_switch" )
			elseif IsMultiplayer() and IsLobbyNetworkModeLAN() then
				LobbyTeamSelectionLB( self, controller )
				PlaySoundSetSound( self, "team_switch" )
			end
		end
		if not self.occludedBy and (event.button == "select" or event.button == "key_shortcut" and event.key == "A") and CanShowAAR( controller ) and IsMultiplayer() and IsGameLobbyActive() then
			OpenPopup( self, "MPAAR", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "unused_gamepad_button", function ( element, event )
		local retVal = nil
		local controller = event.controller or controller
		if IsPrimaryButton( event ) then
			LobbyAddLocalClient( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "record_curr_focused_elem_id", function ( element, event )
		local retVal = nil
		if element.RecordCurrFocusedElemID then
			retVal = element:RecordCurrFocusedElemID( event )
		elseif element.super.RecordCurrFocusedElemID then
			retVal = element.super:RecordCurrFocusedElemID( event )
		end
		UpdateState( self, event )
		UpdateButtonPrompt( self, "alt1", controller )
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if ShouldPlayLobbyFadeAnim( self, controller ) then
			PlayClip( self, "FadeIn", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if CanShowAAR( controller ) and IsMultiplayer() and IsGameLobbyActive() then
			OpenAARIfNeeded( self, controller )
		else
			PlayClip( self, "FadeIn", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Left" ) then
			
		elseif IsElementInState( element, "Right" ) then
			PlayClipOnElement( self, {
				elementName = "SelectedPlayerInfo",
				clipName = "Intro"
			}, controller )
		end
	end )
	LeftContainer.id = "LeftContainer"
	ClientList.id = "ClientList"
	SelectedPlayerInfo.id = "SelectedPlayerInfo"
	MapVote.id = "MapVote"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.LeftContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.LeftContainer:close()
		self.ClientList:close()
		self.SelectedPlayerInfo:close()
		self.MapVote:close()
		self.HelpBackground:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

