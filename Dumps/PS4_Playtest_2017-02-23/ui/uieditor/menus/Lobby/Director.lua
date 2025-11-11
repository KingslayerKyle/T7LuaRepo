require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Director.DirectorCard" )
require( "ui.uieditor.widgets.Director.DirectorFilterItem" )
require( "ui.uieditor.widgets.Director.DirectorLobbyMember" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer" )
require( "ui.uieditor.widgets.Lobby.Flyouts.lobbyFlyout_Generic" )
require( "ui.uieditor.widgets.Lobby.LobbyPlayButton" )

LUI.createMenu.Director = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Director" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	CoD.DirectorUtility.PreLoad( controller, self )
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Director.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local CardList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	CardList:makeFocusable()
	CardList:setLeftRight( 0, 0, 823, 1749 )
	CardList:setTopBottom( 0, 0, 375, 705 )
	CardList:setWidgetType( CoD.DirectorCard )
	CardList:setHorizontalCount( 4 )
	CardList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CardList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( CardList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONFIRM", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
		return true
	end, false )
	self:addElement( CardList )
	self.CardList = CardList
	
	local Filters = LUI.GridLayout.new( self, controller, false, 0, 0, 20, 0, nil, nil, false, false, 0, 0, false, false )
	Filters:setLeftRight( 0, 0, 823, 1223 )
	Filters:setTopBottom( 0, 0, 294, 358 )
	Filters:setWidgetType( CoD.DirectorFilterItem )
	Filters:setHorizontalCount( 5 )
	Filters:setSpacing( 20 )
	Filters:setDataSource( "DirectorFilters" )
	Filters:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		UpdateDataSource( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Filters:registerEventHandler( "mouse_left_click", function ( element, event )
		local retVal = nil
		SelectItemIfPossible( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Filters )
	self.Filters = Filters
	
	local PartyList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PartyList:makeFocusable()
	PartyList:setLeftRight( 0, 0, 243, 571 )
	PartyList:setTopBottom( 0, 0, 882, 946 )
	PartyList:setWidgetType( CoD.DirectorLobbyMember )
	PartyList:setHorizontalCount( 5 )
	PartyList:setDataSource( "DirectorPartyList" )
	self:addElement( PartyList )
	self.PartyList = PartyList
	
	local feFooterContainer = CoD.fe_FooterContainer.new( self, controller )
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
	
	local flyoutList = LUI.UIList.new( self, controller, -42, 0, nil, false, false, 0, 0, false, false )
	flyoutList:makeFocusable()
	flyoutList:setLeftRight( 0, 0, 112, 1354 )
	flyoutList:setTopBottom( 0, 0, 705, 875 )
	flyoutList:setAlpha( 0.09 )
	flyoutList:setZoom( 50 )
	flyoutList:setWidgetType( CoD.lobbyFlyout_Generic )
	flyoutList:setHorizontalCount( 10 )
	flyoutList:setSpacing( -42 )
	flyoutList:setDataSource( "LobbyFlyoutButtons" )
	self:addElement( flyoutList )
	self.flyoutList = flyoutList
	
	local LobbyPlayButton = CoD.LobbyPlayButton.new( self, controller )
	LobbyPlayButton:mergeStateConditions( {
		{
			stateName = "MatchStarting",
			condition = function ( menu, element, event )
				local f9_local0 = IsGlobalModelValueGreaterThan( controller, "lobbyRoot.lobbyTimeRemaining", 0 )
				if f9_local0 then
					f9_local0 = IsFreeCursorActive( controller )
					if f9_local0 then
						f9_local0 = IsIntDvarNonZero( "lobby_director" )
					end
				end
				return f9_local0
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				local f10_local0 = LobbyHasMatchStartButton()
				if f10_local0 then
					f10_local0 = IsPartyLeader( controller )
					if f10_local0 then
						f10_local0 = IsFreeCursorActive( controller )
						if f10_local0 then
							f10_local0 = IsIntDvarNonZero( "lobby_director" )
						end
					end
				end
				return f10_local0
			end
		}
	} )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" ), function ( model )
		self:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyTimeRemaining"
		} )
	end )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.isHost" ), function ( model )
		self:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.privateClient.isHost"
		} )
	end )
	LobbyPlayButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" ), function ( model )
		self:updateElementState( LobbyPlayButton, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.gameClient.isHost"
		} )
	end )
	LobbyPlayButton:setLeftRight( 0, 0, 187, 407 )
	LobbyPlayButton:setTopBottom( 0, 0, 399, 479 )
	self:addElement( LobbyPlayButton )
	self.LobbyPlayButton = LobbyPlayButton
	
	CardList:linkToElementModel( Filters, "dataSource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardList:setDataSource( modelValue )
		end
	end )
	CardList.navigation = {
		left = LobbyPlayButton,
		down = flyoutList
	}
	PartyList.navigation = {
		up = flyoutList
	}
	flyoutList.navigation = {
		up = CardList,
		down = PartyList
	}
	LobbyPlayButton.navigation = {
		right = CardList,
		down = flyoutList
	}
	self.resetProperties = function ()
		CardList:completeAnimation()
		Filters:completeAnimation()
		CardList:setAlpha( 1 )
		Filters:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		HideCardsAndFilter = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CardList:completeAnimation()
				self.CardList:setAlpha( 0 )
				self.clipFinished( CardList, {} )
				Filters:completeAnimation()
				self.Filters:setAlpha( 0 )
				self.clipFinished( Filters, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideCardsAndFilter",
			condition = function ( menu, element, event )
				return not CoD.DirectorUtility.ShowDirectorCardsAndFilters( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		OpenOverlay( self, "StartMenu_Main", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			OpenOverlay( self, "Social_Main", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_SOCIAL", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		LobbyGoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "GlobalModel", "lobbyRoot.room", function ( model )
		local element = self
		RefreshLobbyRoom( self, controller )
	end )
	CardList.id = "CardList"
	PartyList.id = "PartyList"
	feFooterContainer:setModel( self.buttonModel, controller )
	flyoutList.id = "flyoutList"
	LobbyPlayButton.id = "LobbyPlayButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CardList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CardList:close()
		self.Filters:close()
		self.PartyList:close()
		self.feFooterContainer:close()
		self.flyoutList:close()
		self.LobbyPlayButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Director.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	local element = self
	CoD.DirectorUtility.PostLoad( controller, self )
	SendMenuResponse( self, "Main", "close", controller )
	return self
end

