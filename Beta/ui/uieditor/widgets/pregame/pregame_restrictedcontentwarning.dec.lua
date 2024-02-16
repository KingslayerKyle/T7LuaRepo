require( "ui.uieditor.widgets.Pregame.Pregame_VoteItem" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 350 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 410, 1188 )
	Title:setTopBottom( true, false, 15, 49 )
	Title:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 411.89, 1175.89 )
	Description:setTopBottom( true, false, 48.5, 68.5 )
	Description:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_DESC" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local BannedItemsList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	BannedItemsList:makeFocusable()
	BannedItemsList:setLeftRight( true, false, 411.89, 1227.89 )
	BannedItemsList:setTopBottom( true, false, 149, 257 )
	BannedItemsList:setWidgetType( CoD.Pregame_VoteItem )
	BannedItemsList:setHorizontalCount( 7 )
	BannedItemsList:setSpacing( 10 )
	BannedItemsList:mergeStateConditions( {
		{
			stateName = "ShowHeader",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BannedItemsList )
	self.BannedItemsList = BannedItemsList
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 411.89, 691.89 )
	ButtonList:setTopBottom( true, false, 274, 340 )
	ButtonList:setDataSource( "PregameBannedContentButtons" )
	ButtonList:setWidgetType( CoD.list1ButtonNewStyle )
	ButtonList:setVerticalCount( 2 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( menu, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
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
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local WarningText = LUI.UIText.new()
	WarningText:setLeftRight( true, false, 411.89, 1175.89 )
	WarningText:setTopBottom( true, false, 99.5, 119.5 )
	WarningText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	WarningText:setText( Engine.Localize( "" ) )
	WarningText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WarningText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WarningText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WarningText )
	self.WarningText = WarningText
	
	BannedItemsList.navigation = {
		down = ButtonList
	}
	ButtonList.navigation = {
		up = BannedItemsList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				PregameTimerOverlay:completeAnimation()
				self.PregameTimerOverlay:setAlpha( 1 )
				self.clipFinished( PregameTimerOverlay, {} )
			end
		},
		NoBannedCacContent = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 4 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_DESC" ) )
				self.clipFinished( Description, {} )
				BannedItemsList:completeAnimation()
				self.BannedItemsList:setAlpha( 1 )
				self.clipFinished( BannedItemsList, {} )
				WarningText:completeAnimation()
				self.WarningText:setAlpha( 1 )
				self.clipFinished( WarningText, {} )
			end
		},
		NoEquippedBannedCacContent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_NO_CAC_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_NO_EQUIPPED_BANNED_CAC_CONTENT_DESC" ) )
				self.clipFinished( Description, {} )
				BannedItemsList:completeAnimation()
				self.BannedItemsList:setAlpha( 1 )
				self.clipFinished( BannedItemsList, {} )
				WarningText:completeAnimation()
				self.WarningText:setAlpha( 1 )
				self.clipFinished( WarningText, {} )
			end
		},
		NoBannedScorestreaks = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 4 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_DESC" ) )
				self.clipFinished( Description, {} )
				BannedItemsList:completeAnimation()
				self.BannedItemsList:setAlpha( 1 )
				self.clipFinished( BannedItemsList, {} )
				WarningText:completeAnimation()
				self.WarningText:setAlpha( 1 )
				self.clipFinished( WarningText, {} )
			end
		},
		NoEquippedBannedStreaks = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_NO_SCORESTREAK_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_NO_BANNED_SCORESTREAKS_EQUIPPED_DESC" ) )
				self.clipFinished( Description, {} )
				BannedItemsList:completeAnimation()
				self.BannedItemsList:setAlpha( 1 )
				self.clipFinished( BannedItemsList, {} )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
				WarningText:completeAnimation()
				self.WarningText:setAlpha( 1 )
				self.WarningText:setText( Engine.Localize( "MENU_ALL_BANNED_SCORESTREAKS" ) )
				self.clipFinished( WarningText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoBannedCacContent",
			condition = function ( menu, element, event )
				local f23_local0 = ItemRestrictionCACEditActive()
				if f23_local0 then
					f23_local0 = not AnyCACContentBanned( menu, element, controller )
				end
				return f23_local0
			end
		},
		{
			stateName = "CacContentBannedEquipped",
			condition = function ( menu, element, event )
				local f24_local0 = ItemRestrictionCACEditActive()
				if f24_local0 then
					f24_local0 = AnyClassContainsRestrictedItems( menu, element, controller )
				end
				return f24_local0
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
				local f26_local0 = ItemRestrictionScorestreakEditActive()
				if f26_local0 then
					f26_local0 = not AnyScorestreaksBanned( menu, element, controller )
				end
				return f26_local0
			end
		},
		{
			stateName = "BannedStreaksEquipped",
			condition = function ( menu, element, event )
				local f27_local0 = ItemRestrictionScorestreakEditActive()
				if f27_local0 then
					f27_local0 = AnyEquippedScorestreaksBanned( menu, element, controller )
				end
				return f27_local0
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
	self:linkToElementModel( "classNum", true, function ( model )
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
	self:linkToElementModel( "classNum", true, function ( model )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_ALL_BANNED_CAC_ITEMS" )
			return true
		elseif ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( menu, element, controller ) and not IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_EQUIPPED_BANNED_CAC_ITEMS" )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( menu, element, controller ) and IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_ALL_BANNED_SCORESTREAKS" )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( menu, element, controller ) and not IsModelValueTrue( controller, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_EQUIPPED_BANNED_SCORESTREAKS" )
			return true
		else
			return false
		end
	end, false )
	BannedItemsList.id = "BannedItemsList"
	ButtonList.id = "ButtonList"
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
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

