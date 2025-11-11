require( "ui.uieditor.widgets.Challenges.Challenges_ZM_LobbyWidget" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsSummary" )
require( "ui.uieditor.widgets.Lobby.Common.CPFirstTimeFlowButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SelectionList" )
require( "ui.uieditor.widgets.Lobby.Connectivity.LocalWarning" )
require( "ui.uieditor.widgets.Lobby.Flyouts.lobbyFlyout_Generic" )
require( "ui.uieditor.widgets.Lobby.LobbyDoubleXPWidgetContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyPlayButton" )
require( "ui.uieditor.widgets.Lobby.LobbyPrototypeModeTab" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.Flyout_Btn_Lan" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.Flyout_Start" )

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self.MenuTitleContainer.MenuTitle.TextBox1.Label0, "setText", function ()
		self.MenuTitleContainer:playClip( "Update" )
		self.selectionList:playClip( "Update" )
	end )
end

CoD.LeftContainer = InheritFrom( LUI.UIElement )
CoD.LeftContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeftContainer )
	self.id = "LeftContainer"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( 0, 0, 0, 780 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MenuTitleContainer = CoD.FE_3dTitleContainer.new( menu, controller )
	MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
	MenuTitleContainer:setTopBottom( 0, 0, 102.5, 321.5 )
	MenuTitleContainer:setZoom( 25 )
	MenuTitleContainer.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	self:addElement( MenuTitleContainer )
	self.MenuTitleContainer = MenuTitleContainer
	
	local LocalWarning = CoD.LocalWarning.new( menu, controller )
	LocalWarning:mergeStateConditions( {
		{
			stateName = "PlayingLive",
			condition = function ( menu, element, event )
				return IsLive()
			end
		},
		{
			stateName = "PlayingLocal",
			condition = function ( menu, element, event )
				return IsLAN()
			end
		}
	} )
	LocalWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( LocalWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LocalWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LocalWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LocalWarning:setLeftRight( 0, 0, 185, 935 )
	LocalWarning:setTopBottom( 0, 0, 93, 123 )
	LocalWarning:setAlpha( 0 )
	self:addElement( LocalWarning )
	self.LocalWarning = LocalWarning
	
	local selectionList = CoD.FE_SelectionList.new( menu, controller )
	selectionList:setLeftRight( 0, 0, 56, 971 )
	selectionList:setTopBottom( 0, 0, 480, 999 )
	selectionList:setZoom( 65 )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local PrototypeFlyoutButtons = CoD.Flyout_Start.new( menu, controller )
	PrototypeFlyoutButtons:setLeftRight( 0, 0, 84, 499 )
	PrototypeFlyoutButtons:setTopBottom( 0, 0, 284, 565 )
	PrototypeFlyoutButtons:setZoom( 50 )
	self:addElement( PrototypeFlyoutButtons )
	self.PrototypeFlyoutButtons = PrototypeFlyoutButtons
	
	local FEFeaturedCardsContainer = CoD.FE_FeaturedCardsContainer.new( menu, controller )
	FEFeaturedCardsContainer:setLeftRight( 0, 0, 54, 594 )
	FEFeaturedCardsContainer:setTopBottom( 0, 0, 60, 304 )
	self:addElement( FEFeaturedCardsContainer )
	self.FEFeaturedCardsContainer = FEFeaturedCardsContainer
	
	local CompetitiveSettingsSummary = CoD.Competitive_SettingsSummary.new( menu, controller )
	CompetitiveSettingsSummary:setLeftRight( 0, 0, 52, 580 )
	CompetitiveSettingsSummary:setTopBottom( 0, 0, 654, 988 )
	self:addElement( CompetitiveSettingsSummary )
	self.CompetitiveSettingsSummary = CompetitiveSettingsSummary
	
	local LobbyDoubleXPWidgetContainer = CoD.LobbyDoubleXPWidgetContainer.new( menu, controller )
	LobbyDoubleXPWidgetContainer:setLeftRight( 0, 0, 0, 780 )
	LobbyDoubleXPWidgetContainer:setTopBottom( 0, 0, 0, 1080 )
	LobbyDoubleXPWidgetContainer:setAlpha( 0 )
	self:addElement( LobbyDoubleXPWidgetContainer )
	self.LobbyDoubleXPWidgetContainer = LobbyDoubleXPWidgetContainer
	
	local ChallengesZMLobbyWidget = CoD.Challenges_ZM_LobbyWidget.new( menu, controller )
	ChallengesZMLobbyWidget:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				local f12_local0 = IsLive()
				if f12_local0 then
					f12_local0 = IsZombies()
					if f12_local0 then
						f12_local0 = IsSelfModelValueGreaterThanOrEqualTo( element, controller, "progressPercentage", 1 )
						if f12_local0 then
							f12_local0 = IsGlobalModelValueEqualTo
							local f12_local1 = element
							local f12_local2 = controller
							local f12_local3 = "lobbyRoot.lobbyNav"
							local f12_local4 = LobbyData.GetLobbyMenuByName( "online_zm" )
							f12_local0 = f12_local0( f12_local1, f12_local2, f12_local3, f12_local4.id )
						end
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f13_local0 = IsLive()
				if f13_local0 then
					f13_local0 = IsZombies()
					if f13_local0 then
						f13_local0 = IsGlobalModelValueEqualTo
						local f13_local1 = element
						local f13_local2 = controller
						local f13_local3 = "lobbyRoot.lobbyNav"
						local f13_local4 = LobbyData.GetLobbyMenuByName( "online_zm" )
						f13_local0 = f13_local0( f13_local1, f13_local2, f13_local3, f13_local4.id )
					end
				end
				return f13_local0
			end
		}
	} )
	ChallengesZMLobbyWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( ChallengesZMLobbyWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	ChallengesZMLobbyWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( ChallengesZMLobbyWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	ChallengesZMLobbyWidget:linkToElementModel( ChallengesZMLobbyWidget, "progressPercentage", true, function ( model )
		menu:updateElementState( ChallengesZMLobbyWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progressPercentage"
		} )
	end )
	ChallengesZMLobbyWidget:setLeftRight( 0, 0, 54, 556 )
	ChallengesZMLobbyWidget:setTopBottom( 0, 0, 59.5, 308.5 )
	self:addElement( ChallengesZMLobbyWidget )
	self.ChallengesZMLobbyWidget = ChallengesZMLobbyWidget
	
	local FlyoutBtnLan = CoD.Flyout_Btn_Lan.new( menu, controller )
	FlyoutBtnLan:setLeftRight( 0, 0, 84, 156 )
	FlyoutBtnLan:setTopBottom( 0, 0, 834, 906 )
	FlyoutBtnLan:setAlpha( 0 )
	FlyoutBtnLan:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	FlyoutBtnLan:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( FlyoutBtnLan, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		T8Prototype_StartLAN( self, menu, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( FlyoutBtnLan )
	self.FlyoutBtnLan = FlyoutBtnLan
	
	local flyoutList = LUI.UIList.new( menu, controller, -42, 0, nil, false, false, 0, 0, false, false )
	flyoutList:makeFocusable()
	flyoutList:setLeftRight( 0, 0, 105, 1347 )
	flyoutList:setTopBottom( 0, 0, 795, 965 )
	flyoutList:setAlpha( 0.09 )
	flyoutList:setZoom( 50 )
	flyoutList:setWidgetType( CoD.lobbyFlyout_Generic )
	flyoutList:setHorizontalCount( 10 )
	flyoutList:setSpacing( -42 )
	flyoutList:setDataSource( "LobbyFlyoutButtons" )
	self:addElement( flyoutList )
	self.flyoutList = flyoutList
	
	local LobbyPlayButton = CoD.LobbyPlayButton.new( menu, controller )
	LobbyPlayButton:mergeStateConditions( {
		{
			stateName = "MatchStarting",
			condition = function ( menu, element, event )
				local f21_local0 = IsGlobalModelValueGreaterThan( controller, "lobbyRoot.lobbyTimeRemaining", 0 )
				if f21_local0 then
					f21_local0 = IsFreeCursorActive( controller )
					if f21_local0 then
						f21_local0 = IsIntDvarNonZero( "mp_prototype" )
					end
				end
				return f21_local0
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				local f22_local0 = LobbyHasMatchStartButton()
				if f22_local0 then
					f22_local0 = IsPartyLeader( controller )
					if f22_local0 then
						f22_local0 = IsFreeCursorActive( controller )
						if f22_local0 then
							f22_local0 = IsIntDvarNonZero( "mp_prototype" )
						end
					end
				end
				return f22_local0
			end
		}
	} )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" ), function ( model )
		menu:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyTimeRemaining"
		} )
	end )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.isHost" ), function ( model )
		menu:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.privateClient.isHost"
		} )
	end )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" ), function ( model )
		menu:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.gameClient.isHost"
		} )
	end )
	LobbyPlayButton:setLeftRight( 0, 0, 105, 325 )
	LobbyPlayButton:setTopBottom( 0, 0, 368, 448 )
	LobbyPlayButton:setZoom( 50 )
	self:addElement( LobbyPlayButton )
	self.LobbyPlayButton = LobbyPlayButton
	
	local prototypeLobbyTabs = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	prototypeLobbyTabs:setLeftRight( 0, 0, 136, 678 )
	prototypeLobbyTabs:setTopBottom( 0, 0, 60, 120 )
	prototypeLobbyTabs:setZoom( 10 )
	prototypeLobbyTabs:setWidgetType( CoD.LobbyPrototypeModeTab )
	prototypeLobbyTabs:setHorizontalCount( 2 )
	prototypeLobbyTabs:setDataSource( "PrototypeLobbyTabs" )
	self:addElement( prototypeLobbyTabs )
	self.prototypeLobbyTabs = prototypeLobbyTabs
	
	local CPFirstTimeFlowButton = CoD.CPFirstTimeFlowButton.new( menu, controller )
	CPFirstTimeFlowButton:setLeftRight( 0, 0, 56, 456 )
	CPFirstTimeFlowButton:setTopBottom( 0, 0, 304, 601 )
	CPFirstTimeFlowButton:setAlpha( 0.3 )
	CPFirstTimeFlowButton:setZoom( 50 )
	self:addElement( CPFirstTimeFlowButton )
	self.CPFirstTimeFlowButton = CPFirstTimeFlowButton
	
	local L1 = LUI.UIImage.new()
	L1:setLeftRight( 0, 0, 56, 164 )
	L1:setTopBottom( 0, 0, 65, 113 )
	L1:setZoom( 10 )
	L1:setImage( RegisterImage( "uie_menu_icon_orbis_l1" ) )
	self:addElement( L1 )
	self.L1 = L1
	
	local R1 = LUI.UIImage.new()
	R1:setLeftRight( 0, 0, 668, 776 )
	R1:setTopBottom( 0, 0, 65, 113 )
	R1:setZoom( 10 )
	R1:setImage( RegisterImage( "uie_menu_icon_orbis_r1" ) )
	self:addElement( R1 )
	self.R1 = R1
	
	FEFeaturedCardsContainer:linkToElementModel( FEFeaturedCardsContainer.CardsList, nil, false, function ( model )
		FEFeaturedCardsContainer:setModel( model, controller )
	end )
	selectionList.navigation = {
		left = PrototypeFlyoutButtons,
		up = CPFirstTimeFlowButton,
		right = flyoutList,
		down = flyoutList
	}
	PrototypeFlyoutButtons.navigation = {
		left = CPFirstTimeFlowButton,
		up = LobbyPlayButton,
		right = selectionList,
		down = CPFirstTimeFlowButton
	}
	FlyoutBtnLan.navigation = {
		up = selectionList,
		right = selectionList,
		down = flyoutList
	}
	flyoutList.navigation = {
		left = selectionList,
		up = selectionList
	}
	LobbyPlayButton.navigation = {
		right = CPFirstTimeFlowButton,
		down = PrototypeFlyoutButtons
	}
	CPFirstTimeFlowButton.navigation = {
		left = LobbyPlayButton,
		up = PrototypeFlyoutButtons,
		right = PrototypeFlyoutButtons,
		down = selectionList
	}
	self.resetProperties = function ()
		MenuTitleContainer:completeAnimation()
		PrototypeFlyoutButtons:completeAnimation()
		flyoutList:completeAnimation()
		prototypeLobbyTabs:completeAnimation()
		CPFirstTimeFlowButton:completeAnimation()
		R1:completeAnimation()
		L1:completeAnimation()
		selectionList:completeAnimation()
		FEFeaturedCardsContainer:completeAnimation()
		CompetitiveSettingsSummary:completeAnimation()
		LobbyDoubleXPWidgetContainer:completeAnimation()
		FlyoutBtnLan:completeAnimation()
		LobbyPlayButton:completeAnimation()
		MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
		MenuTitleContainer:setTopBottom( 0, 0, 102.5, 321.5 )
		MenuTitleContainer:setAlpha( 1 )
		MenuTitleContainer:setScale( 1 )
		PrototypeFlyoutButtons:setLeftRight( 0, 0, 84, 499 )
		PrototypeFlyoutButtons:setTopBottom( 0, 0, 284, 565 )
		PrototypeFlyoutButtons:setAlpha( 1 )
		flyoutList:setAlpha( 0.09 )
		prototypeLobbyTabs:setAlpha( 1 )
		CPFirstTimeFlowButton:setAlpha( 0.3 )
		R1:setAlpha( 1 )
		L1:setAlpha( 1 )
		selectionList:setLeftRight( 0, 0, 56, 971 )
		selectionList:setTopBottom( 0, 0, 480, 999 )
		selectionList:setAlpha( 1 )
		FEFeaturedCardsContainer:setLeftRight( 0, 0, 54, 594 )
		FEFeaturedCardsContainer:setTopBottom( 0, 0, 60, 304 )
		FEFeaturedCardsContainer:setAlpha( 1 )
		CompetitiveSettingsSummary:setAlpha( 1 )
		LobbyDoubleXPWidgetContainer:setAlpha( 0 )
		FlyoutBtnLan:setLeftRight( 0, 0, 84, 156 )
		FlyoutBtnLan:setTopBottom( 0, 0, 834, 906 )
		FlyoutBtnLan:setAlpha( 0 )
		LobbyPlayButton:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 284.5, 503.5 )
				self.MenuTitleContainer:setAlpha( 0 )
				self.clipFinished( MenuTitleContainer, {} )
				PrototypeFlyoutButtons:completeAnimation()
				self.PrototypeFlyoutButtons:setAlpha( 0 )
				self.clipFinished( PrototypeFlyoutButtons, {} )
				flyoutList:completeAnimation()
				self.flyoutList:setAlpha( 0 )
				self.clipFinished( flyoutList, {} )
				prototypeLobbyTabs:completeAnimation()
				self.prototypeLobbyTabs:setAlpha( 0 )
				self.clipFinished( prototypeLobbyTabs, {} )
				CPFirstTimeFlowButton:completeAnimation()
				self.CPFirstTimeFlowButton:setAlpha( 0 )
				self.clipFinished( CPFirstTimeFlowButton, {} )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end,
			MoveSelectionListUp = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
						MenuTitleContainer:setTopBottom( 0, 0, 36.5, 255.5 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:setTopBottom( 0, 0, 302.5, 521.5 )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 284.5, 503.5 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )
				local selectionListFrame2 = function ( selectionList, event )
					local selectionListFrame3 = function ( selectionList, event )
						if not event.interrupted then
							selectionList:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Linear )
						end
						selectionList:setLeftRight( 0, 0, 56, 971 )
						selectionList:setTopBottom( 0, 0, 201, 720 )
						if event.interrupted then
							self.clipFinished( selectionList, event )
						else
							selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						selectionListFrame3( selectionList, event )
						return 
					else
						selectionList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						selectionList:setTopBottom( 0, 0, 498, 1017 )
						selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame3 )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 56, 971 )
				self.selectionList:setTopBottom( 0, 0, 480, 999 )
				selectionListFrame2( selectionList, {} )
				local FEFeaturedCardsContainerFrame2 = function ( FEFeaturedCardsContainer, event )
					local FEFeaturedCardsContainerFrame3 = function ( FEFeaturedCardsContainer, event )
						if not event.interrupted then
							FEFeaturedCardsContainer:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Bounce )
						end
						FEFeaturedCardsContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainer, event )
						else
							FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerFrame3( FEFeaturedCardsContainer, event )
						return 
					else
						FEFeaturedCardsContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerFrame3 )
					end
				end
				
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 1 )
				FEFeaturedCardsContainerFrame2( FEFeaturedCardsContainer, {} )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end,
			SelectionListUp = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 36.5, 255.5 )
				self.clipFinished( MenuTitleContainer, {} )
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 56, 971 )
				self.selectionList:setTopBottom( 0, 0, 201, 720 )
				self.clipFinished( selectionList, {} )
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
						MenuTitleContainer:setTopBottom( 0, 0, 284.5, 503.5 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 284.5, 503.5 )
				self.MenuTitleContainer:setAlpha( 0 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( 0, 0, 56, 971 )
					selectionList:setTopBottom( 0, 0, 480, 999 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 56, 971 )
				self.selectionList:setTopBottom( 0, 0, 363, 882 )
				selectionListFrame2( selectionList, {} )
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end,
			ListUp = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
						MenuTitleContainer:setTopBottom( 0, 0, 36.5, 255.5 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 284.5, 503.5 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )
				local selectionListFrame2 = function ( selectionList, event )
					local selectionListFrame3 = function ( selectionList, event )
						if not event.interrupted then
							selectionList:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Linear )
						end
						selectionList:setLeftRight( 0, 0, 56, 971 )
						selectionList:setTopBottom( 0, 0, 201, 720 )
						if event.interrupted then
							self.clipFinished( selectionList, event )
						else
							selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						selectionListFrame3( selectionList, event )
						return 
					else
						selectionList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame3 )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 56, 971 )
				self.selectionList:setTopBottom( 0, 0, 480, 999 )
				selectionListFrame2( selectionList, {} )
				local FEFeaturedCardsContainerFrame2 = function ( FEFeaturedCardsContainer, event )
					local FEFeaturedCardsContainerFrame3 = function ( FEFeaturedCardsContainer, event )
						if not event.interrupted then
							FEFeaturedCardsContainer:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Bounce )
						end
						FEFeaturedCardsContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainer, event )
						else
							FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerFrame3( FEFeaturedCardsContainer, event )
						return 
					else
						FEFeaturedCardsContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerFrame3 )
					end
				end
				
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 1 )
				FEFeaturedCardsContainerFrame2( FEFeaturedCardsContainer, {} )
				local CompetitiveSettingsSummaryFrame2 = function ( CompetitiveSettingsSummary, event )
					local CompetitiveSettingsSummaryFrame3 = function ( CompetitiveSettingsSummary, event )
						if not event.interrupted then
							CompetitiveSettingsSummary:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
						end
						CompetitiveSettingsSummary:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompetitiveSettingsSummary, event )
						else
							CompetitiveSettingsSummary:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompetitiveSettingsSummaryFrame3( CompetitiveSettingsSummary, event )
						return 
					else
						CompetitiveSettingsSummary:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
						CompetitiveSettingsSummary:registerEventHandler( "transition_complete_keyframe", CompetitiveSettingsSummaryFrame3 )
					end
				end
				
				CompetitiveSettingsSummary:completeAnimation()
				self.CompetitiveSettingsSummary:setAlpha( 0 )
				CompetitiveSettingsSummaryFrame2( CompetitiveSettingsSummary, {} )
				local LobbyDoubleXPWidgetContainerFrame2 = function ( LobbyDoubleXPWidgetContainer, event )
					if not event.interrupted then
						LobbyDoubleXPWidgetContainer:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					LobbyDoubleXPWidgetContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyDoubleXPWidgetContainer, event )
					else
						LobbyDoubleXPWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyDoubleXPWidgetContainer:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
				LobbyDoubleXPWidgetContainer:setAlpha( 0 )
				LobbyDoubleXPWidgetContainer:registerEventHandler( "transition_complete_keyframe", LobbyDoubleXPWidgetContainerFrame2 )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end
		},
		PrototypeMain = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -130, 650 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 82.5, 301.5 )
				self.MenuTitleContainer:setScale( 0.9 )
				self.clipFinished( MenuTitleContainer, {} )
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0 )
				self.clipFinished( selectionList, {} )
				PrototypeFlyoutButtons:completeAnimation()
				self.PrototypeFlyoutButtons:setLeftRight( 0, 0, 84, 499 )
				self.PrototypeFlyoutButtons:setTopBottom( 0, 0, 330, 611 )
				self.clipFinished( PrototypeFlyoutButtons, {} )
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
				LobbyDoubleXPWidgetContainer:completeAnimation()
				self.LobbyDoubleXPWidgetContainer:setAlpha( 1 )
				self.clipFinished( LobbyDoubleXPWidgetContainer, {} )
				FlyoutBtnLan:completeAnimation()
				self.FlyoutBtnLan:setLeftRight( 0, 0, 113, 185 )
				self.FlyoutBtnLan:setTopBottom( 0, 0, 859, 931 )
				self.FlyoutBtnLan:setAlpha( 1 )
				self.clipFinished( FlyoutBtnLan, {} )
				flyoutList:completeAnimation()
				self.flyoutList:setAlpha( 0 )
				self.clipFinished( flyoutList, {} )
				prototypeLobbyTabs:completeAnimation()
				self.prototypeLobbyTabs:setAlpha( 0 )
				self.clipFinished( prototypeLobbyTabs, {} )
				CPFirstTimeFlowButton:completeAnimation()
				self.CPFirstTimeFlowButton:setAlpha( 0 )
				self.clipFinished( CPFirstTimeFlowButton, {} )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end
		},
		PrototypeCPFirstTime = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -130, 650 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 82.5, 301.5 )
				self.MenuTitleContainer:setScale( 0.9 )
				self.clipFinished( MenuTitleContainer, {} )
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0 )
				self.clipFinished( selectionList, {} )
				PrototypeFlyoutButtons:completeAnimation()
				self.PrototypeFlyoutButtons:setLeftRight( 0, 0, 84, 499 )
				self.PrototypeFlyoutButtons:setTopBottom( 0, 0, 330, 611 )
				self.PrototypeFlyoutButtons:setAlpha( 0 )
				self.clipFinished( PrototypeFlyoutButtons, {} )
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
				LobbyDoubleXPWidgetContainer:completeAnimation()
				self.LobbyDoubleXPWidgetContainer:setAlpha( 1 )
				self.clipFinished( LobbyDoubleXPWidgetContainer, {} )
				FlyoutBtnLan:completeAnimation()
				self.FlyoutBtnLan:setLeftRight( 0, 0, 113, 185 )
				self.FlyoutBtnLan:setTopBottom( 0, 0, 859, 931 )
				self.clipFinished( FlyoutBtnLan, {} )
				flyoutList:completeAnimation()
				self.flyoutList:setAlpha( 0 )
				self.clipFinished( flyoutList, {} )
				LobbyPlayButton:completeAnimation()
				self.LobbyPlayButton:setAlpha( 0 )
				self.clipFinished( LobbyPlayButton, {} )
				CPFirstTimeFlowButton:completeAnimation()
				self.CPFirstTimeFlowButton:setAlpha( 1 )
				self.clipFinished( CPFirstTimeFlowButton, {} )
			end
		},
		Prototype = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 284.5, 503.5 )
				self.MenuTitleContainer:setAlpha( 0 )
				self.clipFinished( MenuTitleContainer, {} )
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 56, 971 )
				self.selectionList:setTopBottom( 0, 0, 681.5, 1761.5 )
				self.clipFinished( selectionList, {} )
				PrototypeFlyoutButtons:completeAnimation()
				self.PrototypeFlyoutButtons:setAlpha( 0 )
				self.clipFinished( PrototypeFlyoutButtons, {} )
				flyoutList:completeAnimation()
				self.flyoutList:setAlpha( 1 )
				self.clipFinished( flyoutList, {} )
				CPFirstTimeFlowButton:completeAnimation()
				self.CPFirstTimeFlowButton:setAlpha( 0 )
				self.clipFinished( CPFirstTimeFlowButton, {} )
			end
		},
		ListUp = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -130, 650 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 82.5, 301.5 )
				self.MenuTitleContainer:setScale( 0.9 )
				self.clipFinished( MenuTitleContainer, {} )
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 103, 1018 )
				self.selectionList:setTopBottom( 0, 0, 361, 880 )
				self.clipFinished( selectionList, {} )
				PrototypeFlyoutButtons:completeAnimation()
				self.PrototypeFlyoutButtons:setAlpha( 0 )
				self.clipFinished( PrototypeFlyoutButtons, {} )
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
				LobbyDoubleXPWidgetContainer:completeAnimation()
				self.LobbyDoubleXPWidgetContainer:setAlpha( 1 )
				self.clipFinished( LobbyDoubleXPWidgetContainer, {} )
				flyoutList:completeAnimation()
				self.flyoutList:setAlpha( 0 )
				self.clipFinished( flyoutList, {} )
				prototypeLobbyTabs:completeAnimation()
				self.prototypeLobbyTabs:setAlpha( 0 )
				self.clipFinished( prototypeLobbyTabs, {} )
				CPFirstTimeFlowButton:completeAnimation()
				self.CPFirstTimeFlowButton:setAlpha( 0 )
				self.clipFinished( CPFirstTimeFlowButton, {} )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
						MenuTitleContainer:setTopBottom( 0, 0, 283.5, 502.5 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 36.5, 255.5 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 409, true, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( 0, 0, 56, 971 )
					selectionList:setTopBottom( 0, 0, 480, 999 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 56, 971 )
				self.selectionList:setTopBottom( 0, 0, 201, 720 )
				selectionListFrame2( selectionList, {} )
				local FEFeaturedCardsContainerFrame2 = function ( FEFeaturedCardsContainer, event )
					local FEFeaturedCardsContainerFrame3 = function ( FEFeaturedCardsContainer, event )
						if not event.interrupted then
							FEFeaturedCardsContainer:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Bounce )
						end
						FEFeaturedCardsContainer:setLeftRight( 0, 0, 54, 594 )
						FEFeaturedCardsContainer:setTopBottom( 0, 0, 60, 304 )
						FEFeaturedCardsContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainer, event )
						else
							FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerFrame3( FEFeaturedCardsContainer, event )
						return 
					else
						FEFeaturedCardsContainer:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerFrame3 )
					end
				end
				
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setLeftRight( 0, 0, 54, 594 )
				self.FEFeaturedCardsContainer:setTopBottom( 0, 0, 60, 304 )
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				FEFeaturedCardsContainerFrame2( FEFeaturedCardsContainer, {} )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						end
						MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
						MenuTitleContainer:setTopBottom( 0, 0, 36.5, 255.5 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( 0, 0, -112, 668 )
				self.MenuTitleContainer:setTopBottom( 0, 0, 36.5, 255.5 )
				self.MenuTitleContainer:setAlpha( 0 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( 0, 0, 56, 971 )
					selectionList:setTopBottom( 0, 0, 201, 720 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( 0, 0, 56, 971 )
				self.selectionList:setTopBottom( 0, 0, 81, 600 )
				selectionListFrame2( selectionList, {} )
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
				L1:completeAnimation()
				self.L1:setAlpha( 0 )
				self.clipFinished( L1, {} )
				R1:completeAnimation()
				self.R1:setAlpha( 0 )
				self.clipFinished( R1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PrototypeMain",
			condition = function ( menu, element, event )
				return ShouldLobbyListShowPrototypeMainButtons()
			end
		},
		{
			stateName = "PrototypeCPFirstTime",
			condition = function ( menu, element, event )
				local f67_local0 = IsFreeCursorPrototypeBuild( controller )
				if f67_local0 then
					f67_local0 = IsCampaign()
					if f67_local0 then
						f67_local0 = IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN )
					end
				end
				return f67_local0
			end
		},
		{
			stateName = "Prototype",
			condition = function ( menu, element, event )
				return IsFreeCursorPrototypeBuild( controller )
			end
		},
		{
			stateName = "ListUp",
			condition = function ( menu, element, event )
				return ShouldLobbyListBeUp()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "PrototypeMain" ) then
			MakeNotFocusable( self.selectionList, controller )
			MakeFocusable( self.PrototypeFlyoutButtons )
			MakeNotFocusable( self.flyoutList, controller )
			MakeFocusable( self.FlyoutBtnLan )
			MakeNotFocusable( self.CPFirstTimeFlowButton, controller )
		elseif IsSelfInState( self, "PrototypeCPFirstTime" ) then
			MakeNotFocusable( self.selectionList, controller )
			MakeNotFocusable( self.PrototypeFlyoutButtons, controller )
			MakeNotFocusable( self.FlyoutBtnLan, controller )
			MakeNotFocusable( self.flyoutList, controller )
			MakeFocusable( self.CPFirstTimeFlowButton )
		elseif IsSelfInState( self, "Prototype" ) then
			MakeNotFocusable( self.selectionList, controller )
			MakeNotFocusable( self.PrototypeFlyoutButtons, controller )
			MakeNotFocusable( self.FlyoutBtnLan, controller )
			MakeFocusable( self.flyoutList )
			MakeNotFocusable( self.CPFirstTimeFlowButton, controller )
			CoD.CPUtility.UnhideAllCPLobbyItems( controller )
		else
			MakeFocusable( self.selectionList )
			MakeNotFocusable( self.PrototypeFlyoutButtons, controller )
			MakeNotFocusable( self.FlyoutBtnLan, controller )
			MakeNotFocusable( self.flyoutList, controller )
			MakeNotFocusable( self.CPFirstTimeFlowButton, controller )
		end
	end )
	selectionList.id = "selectionList"
	PrototypeFlyoutButtons.id = "PrototypeFlyoutButtons"
	FlyoutBtnLan.id = "FlyoutBtnLan"
	flyoutList.id = "flyoutList"
	LobbyPlayButton.id = "LobbyPlayButton"
	CPFirstTimeFlowButton.id = "CPFirstTimeFlowButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MenuTitleContainer:close()
		self.LocalWarning:close()
		self.selectionList:close()
		self.PrototypeFlyoutButtons:close()
		self.FEFeaturedCardsContainer:close()
		self.CompetitiveSettingsSummary:close()
		self.LobbyDoubleXPWidgetContainer:close()
		self.ChallengesZMLobbyWidget:close()
		self.FlyoutBtnLan:close()
		self.flyoutList:close()
		self.LobbyPlayButton:close()
		self.prototypeLobbyTabs:close()
		self.CPFirstTimeFlowButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

