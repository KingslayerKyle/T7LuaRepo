-- 87c09c89ad9020ea9f5af806758ee6c7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Pregame.Pregame_VoteItem" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_Tabs" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_VoteCount" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title_Small" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TalkersWidget" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" ), "voteFilter" ), 1 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.PregameItemVoteTabs:setForceMouseEventDispatch( true )
	f2_arg0:registerEventHandler( "grid_item_changed", function ( element, event )
		if event.grid == f2_arg0.PregameItemVoteTabs.Tabs.grid then
			SetPregameVoteFilter( f2_arg0, element, f2_arg1, event.grid.savedActiveIndex )
		end
	end )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	local f4_local0 = function ( f5_arg0 )
		local f5_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f4_arg1 ), "Pregame" ), "voteFilter" )
		local f5_local1 = CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f4_arg1 ), "Pregame" ), "voteFilter" ) )].filters
		local f5_local2 = CoD.CACUtility.GetItemInfoFromElementModel( f4_arg1, f5_arg0 )
		return f5_local1[f5_local2.loadoutSlot] ~= nil
	end
	
	f4_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f4_arg1 ), "Pregame" ), "voteFilter" ), function ( model )
		if CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( model )].filters.all then
			f4_arg0.List.filter = nil
		else
			f4_arg0.List.filter = f4_local0
		end
		f4_arg0.List:updateDataSource( true )
		f4_arg0.List:processEvent( {
			name = "gain_focus",
			controller = f4_arg1
		} )
	end )
	if CoD.isPC then
		f0_local1( f4_arg0, f4_arg1 )
	end
end

LUI.createMenu.Pregame_ItemVote = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Pregame_ItemVote" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame_ItemVote.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( f7_local1, controller )
	FEButtonPanel1:setLeftRight( true, false, -28.83, 1304.97 )
	FEButtonPanel1:setTopBottom( true, false, -11, 745 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, true, 0, 0 )
	MapImage:setTopBottom( true, true, 0, 0 )
	MapImage:setAlpha( 0.25 )
	MapImage:setupUIStreamedImage( 0 )
	MapImage:subscribeToGlobalModel( controller, "MapInfo", "mapImage", function ( model )
		local mapImage = Engine.GetModelValue( model )
		if mapImage then
			MapImage:setImage( RegisterImage( mapImage ) )
		end
	end )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Darken000 = LUI.UIImage.new()
	Darken000:setLeftRight( true, true, 190.5, -190.5 )
	Darken000:setTopBottom( true, true, 174, -99 )
	Darken000:setRGB( 0, 0, 0 )
	Darken000:setAlpha( 0.75 )
	self:addElement( Darken000 )
	self.Darken000 = Darken000
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( f7_local1, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, 0, 720 )
	VignetteBack:setAlpha( 0.3 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local Darken00 = LUI.UIImage.new()
	Darken00:setLeftRight( true, true, 0, 0 )
	Darken00:setTopBottom( true, true, 13, 38 )
	Darken00:setRGB( 0, 0, 0 )
	Darken00:setAlpha( 0 )
	self:addElement( Darken00 )
	self.Darken00 = Darken00
	
	local List = LUI.UIList.new( f7_local1, controller, 5, 0, nil, false, false, 0, 0, false, false )
	List:makeFocusable()
	List:setLeftRight( true, false, 190.5, 1089.5 )
	List:setTopBottom( true, false, 174, 621 )
	List:setWidgetType( CoD.Pregame_VoteItem )
	List:setHorizontalCount( 8 )
	List:setVerticalCount( 4 )
	List:setSpacing( 5 )
	List:setDataSource( "PregameRestrictedItems" )
	List:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local f9_local0 = List
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	List:linkToElementModel( List, nil, true, function ( model )
		local f10_local0 = List
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	List:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	List:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	f7_local1:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if not ItemIsProtected( f13_arg1, f13_arg0, f13_arg2 ) and not ItemIsBanned( f13_arg1, f13_arg0, f13_arg2 ) and not ItemIsInRestrictionState( f13_arg1, f13_arg0, f13_arg2, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED ) and not ItemIsInRestrictionState( f13_arg1, f13_arg0, f13_arg2, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED ) then
			ShowPregameVoteOptions( self, f13_arg0, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if not ItemIsProtected( f14_arg1, f14_arg0, f14_arg2 ) and not ItemIsBanned( f14_arg1, f14_arg0, f14_arg2 ) and not ItemIsInRestrictionState( f14_arg1, f14_arg0, f14_arg2, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED ) and not ItemIsInRestrictionState( f14_arg1, f14_arg0, f14_arg2, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
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
		f7_local1:updateElementState( List, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:addElement( List )
	self.List = List
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f7_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, -2 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		SizeToSafeArea( element, controller )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f7_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "PregameVote",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f7_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local PregameTitle = CoD.Pregame_Title.new( f7_local1, controller )
	PregameTitle:setLeftRight( true, false, 390, 890 )
	PregameTitle:setTopBottom( true, false, 83, 120 )
	PregameTitle.KillcamText0:setText( Engine.Localize( "MENU_SELECT_ITEM_TO_PROTECT_OR_BAN" ) )
	PregameTitle.GamemodeIcon:setAlpha( 0 )
	PregameTitle:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local gameTypeIcon = Engine.GetModelValue( model )
		if gameTypeIcon then
			PregameTitle.GamemodeIcon:setImage( RegisterImage( gameTypeIcon ) )
		end
	end )
	self:addElement( PregameTitle )
	self.PregameTitle = PregameTitle
	
	local verticalCounter0 = CoD.verticalCounter.new( f7_local1, controller )
	verticalCounter0:setLeftRight( false, false, -100, 100 )
	verticalCounter0:setTopBottom( true, false, 625, 650 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f22_local0 = nil
		SetAsListVerticalCounter( self, element, "List" )
		if not f22_local0 then
			f22_local0 = element:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local PregameItemVoteTabs = CoD.Pregame_ItemVote_Tabs.new( f7_local1, controller )
	PregameItemVoteTabs:setLeftRight( true, false, -7, 1273 )
	PregameItemVoteTabs:setTopBottom( true, false, 120, 171 )
	self:addElement( PregameItemVoteTabs )
	self.PregameItemVoteTabs = PregameItemVoteTabs
	
	local PregameItemVoteVoteCount = CoD.Pregame_ItemVote_VoteCount.new( f7_local1, controller )
	PregameItemVoteVoteCount:setLeftRight( true, false, 0, 190.5 )
	PregameItemVoteVoteCount:setTopBottom( true, false, 315.6, 416.8 )
	self:addElement( PregameItemVoteVoteCount )
	self.PregameItemVoteVoteCount = PregameItemVoteVoteCount
	
	local PregameTitleSmall = CoD.Pregame_Title_Small.new( f7_local1, controller )
	PregameTitleSmall:setLeftRight( true, true, 1, -1 )
	PregameTitleSmall:setTopBottom( true, false, 33, 81 )
	self:addElement( PregameTitleSmall )
	self.PregameTitleSmall = PregameTitleSmall
	
	local FETalkersWidget = CoD.FE_TalkersWidget.new( f7_local1, controller )
	FETalkersWidget:setLeftRight( true, false, 1026, 1216 )
	FETalkersWidget:setTopBottom( true, false, 170.7, 561.7 )
	self:addElement( FETalkersWidget )
	self.FETalkersWidget = FETalkersWidget
	
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		ConfirmPregameVotePass( self, f23_arg0, f23_arg2 )
		return true
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "Menu_Pass" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		AdjustPregameVoteFilter( self, f25_arg0, f25_arg2, "1" )
		return true
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		AdjustPregameVoteFilter( self, f27_arg0, f27_arg2, "-1" )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	List.id = "List"
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.List:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel1:close()
		element.VignetteBack:close()
		element.List:close()
		element.feFooterContainerNOTLobby:close()
		element.PregameTimerOverlay:close()
		element.PregameTitle:close()
		element.verticalCounter0:close()
		element.PregameItemVoteTabs:close()
		element.PregameItemVoteVoteCount:close()
		element.PregameTitleSmall:close()
		element.FETalkersWidget:close()
		element.MapImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame_ItemVote.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

