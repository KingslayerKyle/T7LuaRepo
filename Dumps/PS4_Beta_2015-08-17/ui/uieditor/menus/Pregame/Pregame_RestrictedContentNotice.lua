require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local PostLoadFunc = function ( self, controller )
	local pregameStateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
	local pregameState = Engine.GetModelValue( pregameStateModel )
	if pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT then
		self.BannedItemsList:setDataSource( "PregameBannedItems" )
	elseif pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT then
		self.BannedItemsList:setDataSource( "PregameBannedStreaks" )
	end
end

LUI.createMenu.Pregame_RestrictedContentNotice = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Pregame_RestrictedContentNotice" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame_RestrictedContentNotice.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TopBar = LUI.UIImage.new()
	TopBar:setLeftRight( true, false, 0, 1280 )
	TopBar:setTopBottom( true, false, 81, 84 )
	TopBar:setRGB( 0.97, 0.58, 0.15 )
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 409.89, 1185.89 )
	Title:setTopBottom( true, false, 101, 148 )
	Title:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_CAPS" ) )
	Title:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 412.89, 1176.89 )
	Description:setTopBottom( true, false, 148, 181 )
	Description:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_DESC" ) )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local BannedItemsList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, true )
	BannedItemsList:makeFocusable()
	BannedItemsList:setLeftRight( true, false, 400, 1216 )
	BannedItemsList:setTopBottom( true, false, 279.5, 387.5 )
	BannedItemsList:setWidgetType( CoD.GridItemButtonNew )
	BannedItemsList:setHorizontalCount( 7 )
	BannedItemsList:setSpacing( 10 )
	self:addElement( BannedItemsList )
	self.BannedItemsList = BannedItemsList
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 409.89, 689.89 )
	ButtonList:setTopBottom( true, false, 481.5, 547.5 )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
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
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	BannedItemsList.navigation = {
		down = ButtonList
	}
	ButtonList.navigation = {
		up = BannedItemsList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CaCEdit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_CAC_CONTENT_BANNED_DESC" ) )
				self.clipFinished( Description, {} )
			end
		},
		ScorestreakEdit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Title:completeAnimation()
				self.Title:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_CAPS" ) )
				self.clipFinished( Title, {} )
				Description:completeAnimation()
				self.Description:setText( Engine.Localize( "MENU_SCORESTREAK_CONTENT_BANNED_DESC" ) )
				self.clipFinished( Description, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CaCEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive()
			end
		},
		{
			stateName = "ScorestreakEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	BannedItemsList.id = "BannedItemsList"
	ButtonList.id = "ButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BannedItemsList:close()
		self.ButtonList:close()
		self.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame_RestrictedContentNotice.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

