-- 5c86def9bbf2ed1e23b8faed17677f71
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Pregame.Pregame_VoteItem" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TalkersWidget" )

local f0_local0 = function ( f1_arg0 )
	return Engine.GetModelValue( Engine.GetModel( f1_arg0, "equipped" ) )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ) )
	if f2_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		f2_arg0.WarningText:setText( Engine.Localize( "MENU_EQUIPPED_BANNED_CAC_ITEMS" ) )
	elseif f2_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		f2_arg0.WarningText:setText( Engine.Localize( "MENU_EQUIPPED_BANNED_SCORESTREAKS" ) )
	end
	f2_arg0.BannedItemsList.filter = f0_local0
	f2_arg0.BannedItemsList:updateDataSource( not f2_arg0.BannedItemsList.hasListFocus )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ) )
	if f3_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		f3_arg0.WarningText:setText( Engine.Localize( "MENU_ALL_BANNED_CAC_ITEMS" ) )
	elseif f3_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		f3_arg0.WarningText:setText( Engine.Localize( "MENU_ALL_BANNED_SCORESTREAKS" ) )
	end
	f3_arg0.BannedItemsList.filter = nil
	f3_arg0.BannedItemsList:updateDataSource( not f3_arg0.BannedItemsList.hasListFocus )
end

local PreLoadFunc = function ( self, controller )
	local f4_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" ), "equippedFilter" )
	local f4_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ) )
	if f4_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		if CoD.CACUtility.AnyClassContainsRestrictedItems( controller ) then
			Engine.SetModelValue( f4_local0, true )
		else
			Engine.SetModelValue( f4_local0, false )
		end
	elseif f4_local1 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		if CoD.CACUtility.AnyEquippedScorestreaksBanned( controller ) then
			Engine.SetModelValue( f4_local0, true )
		else
			Engine.SetModelValue( f4_local0, false )
		end
	end
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	local f5_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ) )
	if f5_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		f5_arg0.BannedItemsList:setDataSource( "PregameBannedItems" )
	elseif f5_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		f5_arg0.BannedItemsList:setDataSource( "PregameBannedStreaks" )
	end
	f5_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f5_arg1 ), "Pregame" ), "equippedFilter" ), function ( model )
		if Engine.GetModelValue( model ) then
			f0_local1( f5_arg0, f5_arg1 )
		else
			f0_local2( f5_arg0, f5_arg1 )
		end
	end )
	f5_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" ), "Update" ), function ( model )
		local f7_local0 = Engine.GetModel( Engine.GetModelForController( f5_arg1 ), "Pregame.equippedFilter" )
		if f5_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
			if CoD.CACUtility.AnyClassContainsRestrictedItems( f5_arg1 ) then
				Engine.SetModelValue( f7_local0, true )
			else
				Engine.SetModelValue( f7_local0, false )
			end
		elseif f5_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
			if CoD.CACUtility.AnyEquippedScorestreaksBanned( f5_arg1 ) then
				Engine.SetModelValue( f7_local0, true )
			else
				Engine.SetModelValue( f7_local0, false )
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
	Title:setLeftRight( true, false, 302, 1001.89 )
	Title:setTopBottom( true, false, 15, 49 )
	Title:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 303.89, 1001.89 )
	Description:setTopBottom( true, false, 48.5, 68.5 )
	Description:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_DESC" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local BannedItemsList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	BannedItemsList:makeFocusable()
	BannedItemsList:setLeftRight( true, false, 303.89, 1001.89 )
	BannedItemsList:setTopBottom( true, false, 149, 257 )
	BannedItemsList:setWidgetType( CoD.Pregame_VoteItem )
	BannedItemsList:setHorizontalCount( 6 )
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
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 303.89, 853.89 )
	ButtonList:setTopBottom( true, false, 274, 340 )
	ButtonList:setWidgetType( CoD.CACGenericButton )
	ButtonList:setVerticalCount( 2 )
	ButtonList:setDataSource( "PregameBannedContentButtons" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		ProcessListAction( self, f12_arg0, f12_arg2 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	WarningText:setLeftRight( true, false, 303.89, 1067.89 )
	WarningText:setTopBottom( true, false, 99.5, 119.5 )
	WarningText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	WarningText:setText( Engine.Localize( "" ) )
	WarningText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WarningText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WarningText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WarningText )
	self.WarningText = WarningText
	
	local FETalkersWidget = CoD.FE_TalkersWidget.new( menu, controller )
	FETalkersWidget:setLeftRight( true, false, 1017, 1207 )
	FETalkersWidget:setTopBottom( true, false, 0, 391 )
	self:addElement( FETalkersWidget )
	self.FETalkersWidget = FETalkersWidget
	
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
		local f32_local0 = self
		local f32_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		}
		CoD.Menu.UpdateButtonShownState( f32_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:linkToElementModel( self, "classNum", true, function ( model )
		local f33_local0 = self
		local f33_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "classNum"
		}
		CoD.Menu.UpdateButtonShownState( f33_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local f34_local0 = self
		local f34_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( f34_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame.equippedFilter" ), function ( model )
		local f35_local0 = self
		local f35_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Pregame.equippedFilter"
		}
		CoD.Menu.UpdateButtonShownState( f35_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "S", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( f36_arg1, f36_arg0, f36_arg2 ) and IsModelValueTrue( f36_arg2, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( f36_arg2 )
			UpdateAllMenuButtonPrompts( f36_arg1, f36_arg2 )
			return true
		elseif ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( f36_arg1, f36_arg0, f36_arg2 ) and not IsModelValueTrue( f36_arg2, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( f36_arg2 )
			UpdateAllMenuButtonPrompts( f36_arg1, f36_arg2 )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( f36_arg1, f36_arg0, f36_arg2 ) and IsModelValueTrue( f36_arg2, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( f36_arg2 )
			UpdateAllMenuButtonPrompts( f36_arg1, f36_arg2 )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( f36_arg1, f36_arg0, f36_arg2 ) and not IsModelValueTrue( f36_arg2, "Pregame.equippedFilter" ) then
			ToggleRestrictedContentEquippedFilter( f36_arg2 )
			UpdateAllMenuButtonPrompts( f36_arg1, f36_arg2 )
			return true
		else
			
		end
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		if ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( f37_arg1, f37_arg0, f37_arg2 ) and IsModelValueTrue( f37_arg2, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_ALL_BANNED_CAC_ITEMS" )
			return true
		elseif ItemRestrictionCACEditActive() and AnyClassContainsRestrictedItems( f37_arg1, f37_arg0, f37_arg2 ) and not IsModelValueTrue( f37_arg2, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_EQUIPPED_BANNED_CAC_ITEMS" )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( f37_arg1, f37_arg0, f37_arg2 ) and IsModelValueTrue( f37_arg2, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_ALL_BANNED_SCORESTREAKS" )
			return true
		elseif ItemRestrictionScorestreakEditActive() and AnyEquippedScorestreaksBanned( f37_arg1, f37_arg0, f37_arg2 ) and not IsModelValueTrue( f37_arg2, "Pregame.equippedFilter" ) then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW_EQUIPPED_BANNED_SCORESTREAKS" )
			return true
		else
			return false
		end
	end, false )
	BannedItemsList.id = "BannedItemsList"
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BannedItemsList:close()
		element.ButtonList:close()
		element.PregameTimerOverlay:close()
		element.FETalkersWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
