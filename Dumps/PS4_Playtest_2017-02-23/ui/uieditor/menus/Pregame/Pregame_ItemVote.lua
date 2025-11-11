require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TalkersWidget" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_Tabs" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_VoteCount" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title_Small" )
require( "ui.uieditor.widgets.Pregame.Pregame_VoteItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

local PreLoadFunc = function ( self, controller )
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
	local voteFilterModel = Engine.CreateModel( pregameModel, "voteFilter" )
	Engine.SetModelValue( voteFilterModel, 1 )
end

local PostLoadFunc = function ( self, controller )
	local ListFilterFn = function ( itemModel )
		local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
		local voteFilterModel = Engine.CreateModel( pregameModel, "voteFilter" )
		local voteFilter = Engine.GetModelValue( voteFilterModel )
		local filters = CoD.CACUtility.PregameLoadoutFilters[voteFilter].filters
		local itemInfo = CoD.CACUtility.GetItemInfoFromElementModel( controller, itemModel )
		return filters[itemInfo.loadoutSlot] ~= nil
	end
	
	local pregameRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
	local voteFilterModel = Engine.CreateModel( pregameRoot, "voteFilter" )
	self:subscribeToModel( voteFilterModel, function ( model )
		local currentFilter = Engine.GetModelValue( model )
		local filters = CoD.CACUtility.PregameLoadoutFilters[currentFilter].filters
		if filters.all then
			self.List.filter = nil
		else
			self.List.filter = ListFilterFn
		end
		self.List:updateDataSource( true )
		self.List:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end )
end

LUI.createMenu.Pregame_ItemVote = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Pregame_ItemVote" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame_ItemVote.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( self, controller )
	FEButtonPanel1:setLeftRight( 0, 0, -43, 1958 )
	FEButtonPanel1:setTopBottom( 0, 0, -17, 1117 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 1, 0, 0 )
	MapImage:setTopBottom( 0, 1, 0, 0 )
	MapImage:setAlpha( 0.25 )
	MapImage:setupUIStreamedImage( 0 )
	MapImage:subscribeToGlobalModel( controller, "MapInfo", "mapImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Darken000 = LUI.UIImage.new()
	Darken000:setLeftRight( 0, 1, 286, -286 )
	Darken000:setTopBottom( 0, 1, 261, -149 )
	Darken000:setRGB( 0, 0, 0 )
	Darken000:setAlpha( 0.75 )
	self:addElement( Darken000 )
	self.Darken000 = Darken000
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( 0, 0, 0, 1920 )
	VignetteBack:setTopBottom( 0, 0, 0, 1080 )
	VignetteBack:setAlpha( 0.3 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local Darken00 = LUI.UIImage.new()
	Darken00:setLeftRight( 0, 1, 0, 0 )
	Darken00:setTopBottom( 0, 1, 19, 57 )
	Darken00:setRGB( 0, 0, 0 )
	Darken00:setAlpha( 0 )
	self:addElement( Darken00 )
	self.Darken00 = Darken00
	
	local List = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	List:makeFocusable()
	List:mergeStateConditions( {
		{
			stateName = "ShowHeader",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShowFooter",
			condition = function ( menu, element, event )
				return not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE )
			end
		}
	} )
	List:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		self:updateElementState( List, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	List:setLeftRight( 0, 0, 284, 1636 )
	List:setTopBottom( 0, 0, 260, 932 )
	List:setWidgetType( CoD.Pregame_VoteItem )
	List:setHorizontalCount( 8 )
	List:setVerticalCount( 4 )
	List:setSpacing( 8 )
	List:setDataSource( "PregameRestrictedItems" )
	List:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local element = List
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	List:linkToElementModel( List, nil, true, function ( model )
		local element = List
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	List:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	List:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not ItemIsProtected( menu, element, controller ) and not ItemIsBanned( menu, element, controller ) and not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED ) and not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED ) then
			ShowPregameVoteOptions( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not ItemIsProtected( menu, element, controller ) and not ItemIsBanned( menu, element, controller ) and not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED ) and not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( List )
	self.List = List
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( 0, 1, 2, -2 )
	feFooterContainerNOTLobby:setTopBottom( 1, 1, -101, -3 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "PregameVote",
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
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local PregameTitle = CoD.Pregame_Title.new( self, controller )
	PregameTitle:setLeftRight( 0, 0, 585, 1335 )
	PregameTitle:setTopBottom( 0, 0, 125, 180 )
	PregameTitle.KillcamText0:setText( Engine.Localize( "MENU_SELECT_ITEM_TO_PROTECT_OR_BAN" ) )
	PregameTitle.GamemodeIcon:setAlpha( 0 )
	PregameTitle:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PregameTitle.GamemodeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PregameTitle )
	self.PregameTitle = PregameTitle
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( 0.5, 0.5, -150, 150 )
	verticalCounter0:setTopBottom( 0, 0, 937, 975 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "List" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local PregameItemVoteTabs = CoD.Pregame_ItemVote_Tabs.new( self, controller )
	PregameItemVoteTabs:setLeftRight( 0, 0, -10, 1910 )
	PregameItemVoteTabs:setTopBottom( 0, 0, 180, 256 )
	self:addElement( PregameItemVoteTabs )
	self.PregameItemVoteTabs = PregameItemVoteTabs
	
	local PregameItemVoteVoteCount = CoD.Pregame_ItemVote_VoteCount.new( self, controller )
	PregameItemVoteVoteCount:setLeftRight( 0, 0, 0, 286 )
	PregameItemVoteVoteCount:setTopBottom( 0, 0, 473, 625 )
	self:addElement( PregameItemVoteVoteCount )
	self.PregameItemVoteVoteCount = PregameItemVoteVoteCount
	
	local PregameTitleSmall = CoD.Pregame_Title_Small.new( self, controller )
	PregameTitleSmall:setLeftRight( 0, 1, 2, -2 )
	PregameTitleSmall:setTopBottom( 0, 0, 50, 122 )
	self:addElement( PregameTitleSmall )
	self.PregameTitleSmall = PregameTitleSmall
	
	local FETalkersWidget = CoD.FE_TalkersWidget.new( self, controller )
	FETalkersWidget:setLeftRight( 0, 0, 1539.5, 1824.5 )
	FETalkersWidget:setTopBottom( 0, 0, 256, 842 )
	self:addElement( FETalkersWidget )
	self.FETalkersWidget = FETalkersWidget
	
	List.navigation = {
		up = FETalkersWidget,
		right = FETalkersWidget,
		down = verticalCounter0
	}
	verticalCounter0.navigation = {
		up = List
	}
	FETalkersWidget.navigation = {
		left = List,
		down = List
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ConfirmPregameVotePass( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "Menu_Pass", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustPregameVoteFilter( self, element, controller, "1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		AdjustPregameVoteFilter( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	List.id = "List"
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	verticalCounter0.id = "verticalCounter0"
	FETalkersWidget.id = "FETalkersWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.List:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel1:close()
		self.VignetteBack:close()
		self.List:close()
		self.feFooterContainerNOTLobby:close()
		self.PregameTimerOverlay:close()
		self.PregameTitle:close()
		self.verticalCounter0:close()
		self.PregameItemVoteTabs:close()
		self.PregameItemVoteVoteCount:close()
		self.PregameTitleSmall:close()
		self.FETalkersWidget:close()
		self.MapImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame_ItemVote.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

