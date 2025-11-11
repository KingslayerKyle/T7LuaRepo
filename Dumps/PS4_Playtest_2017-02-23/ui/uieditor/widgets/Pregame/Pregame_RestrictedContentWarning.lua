require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TalkersWidget" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Pregame.Pregame_VoteItem" )

local ListFilter = function ( itemModel )
	return Engine.GetModelValue( Engine.GetModel( itemModel, "equipped" ) )
end

local EnableFilter = function ( self, controller )
	local pregameStateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
	local pregameState = Engine.GetModelValue( pregameStateModel )
	if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		self.WarningText:setText( Engine.Localize( "MENU_EQUIPPED_BANNED_CAC_ITEMS" ) )
	elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		self.WarningText:setText( Engine.Localize( "MENU_EQUIPPED_BANNED_SCORESTREAKS" ) )
	end
	self.BannedItemsList.filter = ListFilter
	self.BannedItemsList:updateDataSource( not self.BannedItemsList.hasListFocus )
end

local DisableFilter = function ( self, controller )
	local pregameStateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
	local pregameState = Engine.GetModelValue( pregameStateModel )
	if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		self.WarningText:setText( Engine.Localize( "MENU_ALL_BANNED_CAC_ITEMS" ) )
	elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		self.WarningText:setText( Engine.Localize( "MENU_ALL_BANNED_SCORESTREAKS" ) )
	end
	self.BannedItemsList.filter = nil
	self.BannedItemsList:updateDataSource( not self.BannedItemsList.hasListFocus )
end

local PreLoadFunc = function ( self, controller )
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
	local equippedFilterModel = Engine.CreateModel( pregameModel, "equippedFilter" )
	local pregameStateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
	local pregameState = Engine.GetModelValue( pregameStateModel )
	if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		if CoD.CACUtility.AnyClassContainsRestrictedItems( controller ) then
			Engine.SetModelValue( equippedFilterModel, true )
		else
			Engine.SetModelValue( equippedFilterModel, false )
		end
	elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		if CoD.CACUtility.AnyEquippedScorestreaksBanned( controller ) then
			Engine.SetModelValue( equippedFilterModel, true )
		else
			Engine.SetModelValue( equippedFilterModel, false )
		end
	end
end

local PostLoadFunc = function ( self, controller )
	local pregameStateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
	local pregameState = Engine.GetModelValue( pregameStateModel )
	if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		self.BannedItemsList:setDataSource( "PregameBannedItems" )
	elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		self.BannedItemsList:setDataSource( "PregameBannedStreaks" )
	end
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
	local equippedFilterModel = Engine.CreateModel( pregameModel, "equippedFilter" )
	self:subscribeToModel( equippedFilterModel, function ( model )
		local filterEnabled = Engine.GetModelValue( model )
		if filterEnabled then
			EnableFilter( self, controller )
		else
			DisableFilter( self, controller )
		end
	end )
	local globalPregameModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local updateModel = Engine.CreateModel( globalPregameModel, "Update" )
	self:subscribeToModel( updateModel, function ( model )
		local equippedFilterModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame.equippedFilter" )
		if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
			if CoD.CACUtility.AnyClassContainsRestrictedItems( controller ) then
				Engine.SetModelValue( equippedFilterModel, true )
			else
				Engine.SetModelValue( equippedFilterModel, false )
			end
		elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
			if CoD.CACUtility.AnyEquippedScorestreaksBanned( controller ) then
				Engine.SetModelValue( equippedFilterModel, true )
			else
				Engine.SetModelValue( equippedFilterModel, false )
			end
		end
	end )
end

CoD.Pregame_RestrictedContentWarning = InheritFrom( LUI.UIElement )
CoD.Pregame_RestrictedContentWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Pregame_RestrictedContentWarning )
	self.id = "Pregame_RestrictedContentWarning"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 453, 1503 )
	Title:setTopBottom( 0, 0, 22, 73 )
	Title:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 456, 1503 )
	Description:setTopBottom( 0, 0, 73, 103 )
	Description:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_DESC" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local BannedItemsList = LUI.UIList.new( menu, controller, 15, 0, nil, false, false, 0, 0, false, false )
	BannedItemsList:makeFocusable()
	BannedItemsList:mergeStateConditions( {
		{
			stateName = "ShowHeader",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	BannedItemsList:setLeftRight( 0, 0, 456, 1503 )
	BannedItemsList:setTopBottom( 0, 0, 223, 385 )
	BannedItemsList:setWidgetType( CoD.Pregame_VoteItem )
	BannedItemsList:setHorizontalCount( 6 )
	BannedItemsList:setSpacing( 15 )
	self:addElement( BannedItemsList )
	self.BannedItemsList = BannedItemsList
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 307, 1429 )
	ButtonList:setTopBottom( 0, 0, 411, 509 )
	ButtonList:setWidgetType( CoD.CACGenericButton )
	ButtonList:setVerticalCount( 2 )
	ButtonList:setDataSource( "PregameBannedContentButtons" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( menu, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "BannedContent",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		menu:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local WarningText = LUI.UIText.new()
	WarningText:setLeftRight( 0, 0, 456, 1602 )
	WarningText:setTopBottom( 0, 0, 149, 179 )
	WarningText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	WarningText:setText( Engine.Localize( "" ) )
	WarningText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WarningText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WarningText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WarningText )
	self.WarningText = WarningText
	
	local FETalkersWidget = CoD.FE_TalkersWidget.new( menu, controller )
	FETalkersWidget:setLeftRight( 0, 0, 1525.5, 1810.5 )
	FETalkersWidget:setTopBottom( 0, 0, 0, 586 )
	self:addElement( FETalkersWidget )
	self.FETalkersWidget = FETalkersWidget
	
	BannedItemsList.navigation = {
		right = FETalkersWidget,
		down = ButtonList
	}
	ButtonList.navigation = {
		up = BannedItemsList,
		right = FETalkersWidget
	}
	FETalkersWidget.navigation = {
		left = BannedItemsList
	}
	self.resetProperties = function ()
		ButtonList:completeAnimation()
		BannedItemsList:completeAnimation()
		Description:completeAnimation()
		Title:completeAnimation()
		WarningText:completeAnimation()
		ButtonList:setAlpha( 1 )
		BannedItemsList:setAlpha( 1 )
		Description:setAlpha( 1 )
		Description:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_DESC" ) )
		Title:setAlpha( 1 )
		Title:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_CAPS" ) )
		WarningText:setAlpha( 1 )
		WarningText:setText( Engine.Localize( "" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				BannedItemsList:completeAnimation()
				self.BannedItemsList:setAlpha( 0 )
				self.clipFinished( BannedItemsList, {} )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0 )
				self.clipFinished( ButtonList, {} )
			end
		},
		NoBannedCacContent = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_NO_CAC_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_NO_CAC_CONTENT_BANNED_DESC" ) )
				self.clipFinished( Description, {} )
				BannedItemsList:completeAnimation()
				self.BannedItemsList:setAlpha( 0 )
				self.clipFinished( BannedItemsList, {} )
				WarningText:completeAnimation()
				self.WarningText:setAlpha( 0 )
				self.clipFinished( WarningText, {} )
			end
		},
		CacContentBannedEquipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_DESC" ) )
				self.clipFinished( Description, {} )
			end
		},
		NoEquippedBannedCacContent = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_NO_CAC_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_NO_EQUIPPED_BANNED_CAC_CONTENT_DESC" ) )
				self.clipFinished( Description, {} )
			end
		},
		NoBannedScorestreaks = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_NO_SCORESTREAK_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_NO_SCORESTREAK_CONTENT_BANNED_DESC" ) )
				self.clipFinished( Description, {} )
				BannedItemsList:completeAnimation()
				self.BannedItemsList:setAlpha( 0 )
				self.clipFinished( BannedItemsList, {} )
				WarningText:completeAnimation()
				self.WarningText:setAlpha( 0 )
				self.clipFinished( WarningText, {} )
			end
		},
		BannedStreaksEquipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
			end
		},
		NoEquippedBannedStreaks = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_NO_SCORESTREAK_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_NO_BANNED_SCORESTREAKS_EQUIPPED_DESC" ) )
				self.clipFinished( Description, {} )
				WarningText:completeAnimation()
				self.WarningText:setText( Engine.Localize( "MENU_ALL_BANNED_SCORESTREAKS" ) )
				self.clipFinished( WarningText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoBannedCacContent",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive() and not AnyCACContentBanned( menu, element, controller )
			end
		},
		{
			stateName = "CacContentBannedEquipped",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( menu, element, controller )
			end
		},
		{
			stateName = "NoEquippedBannedCacContent",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive()
			end
		},
		{
			stateName = "NoBannedScorestreaks",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive() and not AnyScorestreaksBanned( menu, element, controller )
			end
		},
		{
			stateName = "BannedStreaksEquipped",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( menu, element, controller )
			end
		},
		{
			stateName = "NoEquippedBannedStreaks",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:linkToElementModel( self, "classNum", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "classNum"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:linkToElementModel( self, "classNum", true, function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "classNum"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame.equippedFilter" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Pregame.equippedFilter"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( menu, element, controller ) and IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( controller )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		elseif ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( menu, element, controller ) and not IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( controller )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( menu, element, controller ) and IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( controller )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( menu, element, controller ) and not IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( controller )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( menu, element, controller ) and IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_ALL_BANNED_CAC_ITEMS", nil )
			return true
		elseif ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( menu, element, controller ) and not IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_EQUIPPED_BANNED_CAC_ITEMS", nil )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( menu, element, controller ) and IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_ALL_BANNED_SCORESTREAKS", nil )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( menu, element, controller ) and not IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_EQUIPPED_BANNED_SCORESTREAKS", nil )
			return true
		else
			return false
		end
	end, false )
	BannedItemsList.id = "BannedItemsList"
	ButtonList.id = "ButtonList"
	FETalkersWidget.id = "FETalkersWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BannedItemsList:close()
		self.ButtonList:close()
		self.PregameTimerOverlay:close()
		self.FETalkersWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

