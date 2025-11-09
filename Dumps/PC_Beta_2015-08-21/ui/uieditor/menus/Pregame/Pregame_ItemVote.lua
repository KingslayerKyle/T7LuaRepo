require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Pregame.Pregame_VoteItem" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Pregame.Pregame_Title" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_Tabs" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_VoteCount" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" ), "voteFilter" ), 1 )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = function ( f3_arg0 )
		local f3_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "Pregame" ), "voteFilter" )
		local f3_local1 = CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "Pregame" ), "voteFilter" ) )].filters
		local f3_local2 = CoD.CACUtility.GetItemInfoFromElementModel( f2_arg1, f3_arg0 )
		return f3_local1[f3_local2.loadoutSlot] ~= nil
	end
	
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "Pregame" ), "voteFilter" ), function ( model )
		if CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( model )].filters.all then
			f2_arg0.List.filter = nil
		else
			f2_arg0.List.filter = f2_local0
		end
		f2_arg0.List:updateDataSource( true )
		f2_arg0.List:processEvent( {
			name = "gain_focus",
			controller = f2_arg1
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame_ItemVote.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( self, controller )
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
	Darken000:setTopBottom( true, true, 161, -112 )
	Darken000:setRGB( 0, 0, 0 )
	Darken000:setAlpha( 0.75 )
	self:addElement( Darken000 )
	self.Darken000 = Darken000
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, 0, 720 )
	VignetteBack:setAlpha( 0.3 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local Darken00 = LUI.UIImage.new()
	Darken00:setLeftRight( true, true, 0, 0 )
	Darken00:setTopBottom( true, true, 0, 25 )
	Darken00:setRGB( 0, 0, 0 )
	Darken00:setAlpha( 0 )
	self:addElement( Darken00 )
	self.Darken00 = Darken00
	
	local List = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	List:makeFocusable()
	List:setLeftRight( true, false, 190.5, 1089.5 )
	List:setTopBottom( true, false, 161, 608 )
	List:setDataSource( "PregameRestrictedItems" )
	List:setWidgetType( CoD.Pregame_VoteItem )
	List:setHorizontalCount( 8 )
	List:setVerticalCount( 4 )
	List:setSpacing( 5 )
	List:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		local f7_local0 = List
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	List:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	List:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( List, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not ItemIsProtected( menu, element, controller ) and not ItemIsBanned( menu, element, controller ) then
			ShowPregameVoteOptions( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not ItemIsProtected( menu, element, controller ) and not ItemIsBanned( menu, element, controller ) then
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
		}
	} )
	self:addElement( List )
	self.List = List
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( true, false, 1, 1280 )
	feFooterContainerNOTLobby:setTopBottom( true, false, 653, 718 )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
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
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local PregameTitle = CoD.Pregame_Title.new( self, controller )
	PregameTitle:setLeftRight( true, false, 390, 890 )
	PregameTitle:setTopBottom( true, false, 50, 103 )
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
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( false, false, -100, 100 )
	verticalCounter0:setTopBottom( true, false, 612, 637 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		SetAsListVerticalCounter( self, element, "List" )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local PregameItemVoteTabs = CoD.Pregame_ItemVote_Tabs.new( self, controller )
	PregameItemVoteTabs:setLeftRight( true, false, -7, 1273 )
	PregameItemVoteTabs:setTopBottom( true, false, 108, 143 )
	self:addElement( PregameItemVoteTabs )
	self.PregameItemVoteTabs = PregameItemVoteTabs
	
	local PregameItemVoteVoteCount = CoD.Pregame_ItemVote_VoteCount.new( self, controller )
	PregameItemVoteVoteCount:setLeftRight( true, false, 0, 190.5 )
	PregameItemVoteVoteCount:setTopBottom( true, false, 315.6, 416.8 )
	self:addElement( PregameItemVoteVoteCount )
	self.PregameItemVoteVoteCount = PregameItemVoteVoteCount
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		ConfirmPregameVotePass( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "Menu_Pass" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustPregameVoteFilter( self, element, controller, "1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		AdjustPregameVoteFilter( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
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
		menu = self
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
		element.MapImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame_ItemVote.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

