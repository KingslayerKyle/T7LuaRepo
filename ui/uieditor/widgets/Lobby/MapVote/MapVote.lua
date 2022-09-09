-- d53cb8d086e301667975e4c83b4a1436
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteItem" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.Freerun.FR_BestTime" )
require( "ui.uieditor.widgets.Freerun.FR_Difficulty" )
require( "ui.uieditor.widgets.Arena.ArenaMapVoteRuleItem" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteNoDemoSelected" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteResult" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteOfficial" )
require( "ui.uieditor.widgets.ZMInventory.ZMMapSelection.ZMLobbyEEWidgetSmall" )

local f0_local0 = function ( f1_arg0 )
	f1_arg0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = element.MapVoteItemNext
		if event.button and event.button == "up" then
			f2_local0 = element.MapVoteItemRandom
		end
		if element.m_focusable and f2_local0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	f3_arg0.MapVoteItemNext.navigation = nil
	f3_arg0.MapVoteItemNext.navigation = {}
	f3_arg0.MapVoteItemNext.navigation.up = f3_arg1.LeftContainer
	f3_arg0.MapVoteItemNext.navigation.down = f3_arg0.MapVoteItemPrevious
	f3_arg0.MapVoteItemPrevious.navigation = nil
	f3_arg0.MapVoteItemPrevious.navigation = {}
	f3_arg0.MapVoteItemPrevious.navigation.up = f3_arg0.MapVoteItemNext
	f3_arg0.MapVoteItemPrevious.navigation.down = f3_arg0.MapVoteItemRandom
	f3_arg0.MapVoteItemRandom.navigation = nil
	f3_arg0.MapVoteItemRandom.navigation = {}
	f3_arg0.MapVoteItemRandom.navigation.up = f3_arg0.MapVoteItemPrevious
	f3_arg0.MapVoteItemRandom.navigation.down = f3_arg1.LeftContainer
end

local f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ), function ()
		local f5_local0 = LobbyData.GetLobbyNav()
		if f5_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f5_local0 ~= LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id and f5_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id and f5_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
			return 
		end
		local f5_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ) )
		if f5_local1 == LuaEnums.MAP_VOTE_STATE.HIDDEN then
			f4_arg0:processEvent( {
				name = "lose_focus",
				controller = f4_arg1
			} )
			f4_arg0:makeNotFocusable()
			f4_arg0:setMouseDisabled( true )
		elseif f5_local1 == LuaEnums.MAP_VOTE_STATE.VOTING then
			f4_arg0:makeFocusable()
			f4_arg0:setMouseDisabled( false )
		elseif f5_local1 == LuaEnums.MAP_VOTE_STATE.LOCKEDIN then
			f4_arg0:makeNotFocusable()
			f4_arg0:setMouseDisabled( true )
			local f5_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
			local f5_local3 = Engine.GetModelValue( Engine.CreateModel( f5_local2, "mapVoteCountNext", true ) ) or 0
			local f5_local4 = Engine.GetModelValue( Engine.CreateModel( f5_local2, "mapVoteCountPrevious", true ) ) or 0
			local f5_local5 = Engine.GetModelValue( Engine.CreateModel( f5_local2, "mapVoteCountRandom", true ) ) or 0
			local f5_local6 = f5_local3
			local f5_local7 = Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT
			if f5_local6 < f5_local4 then
				f5_local6 = f5_local4
				f5_local7 = Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS
			end
			if f5_local6 < f5_local5 then
				f5_local7 = Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM
			end
			if not LuaUtils.IsArenaMode() then
				if f5_local7 == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
					f4_arg0:setState( "MapVoteChosenNext" )
				elseif f5_local7 == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
					f4_arg0:setState( "MapVoteChosenPrevious" )
				elseif f5_local7 == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
					f4_arg0:setState( "MapVoteChosenRandom" )
				end
			end
			f4_arg0:setState( "SelectedMap" )
			f4_arg0:makeNotFocusable()
			f4_arg0:setMouseDisabled( true )
			if f4_arg0:getParent() then
				local f5_local8 = f4_arg0:getParent()
				f5_local8 = f5_local8.LeftContainer
				if f5_local8 then
					f4_arg0:processEvent( {
						name = "lose_focus",
						controller = f4_arg1
					} )
					if not f5_local8:getParent() or not IsMenuInState( f5_local8:getParent(), "Right" ) then
						f5_local8:processEvent( {
							name = "gain_focus",
							controller = f4_arg1
						} )
					end
				end
			end
		end
	end )
end

local f0_local3 = function ( f6_arg0, f6_arg1, f6_arg2 )
	f6_arg0:makeNotFocusable()
	f6_arg0:setMouseDisabled( true )
end

local f0_local4 = function ( f7_arg0 )
	local f7_local0 = Dvar.ui_mapname:get()
	if f7_arg0.mapName and f7_local0 == f7_arg0.mapName then
		return 
	else
		f7_arg0.mapName = f7_local0
		local f7_local1 = CoD.GetMapValue( f7_local0, "loadingImage", "black" )
		local self = LUI.UIStreamedImage.new()
		self.id = "mapImage"
		self:setLeftRight( false, false, -640, 640 )
		self:setTopBottom( false, false, -360, 360 )
		self:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		self:setImage( RegisterImage( f7_local1 ) )
		self:setAlpha( 0 )
		f7_arg0:addElement( self )
	end
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = LobbyData.GetLobbyNav()
	if f8_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f8_local0 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f8_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id or f8_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id or f8_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f8_local0 == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id then
		f0_local2( f8_arg0, f8_arg1, f8_arg2 )
	elseif f8_local0 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f8_local0 == LobbyData.UITargets.UI_CPLOBBYLANGAME.id or f8_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f8_local0 == LobbyData.UITargets.UI_CP2LOBBYLANGAME.id or f8_local0 == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or f8_local0 == LobbyData.UITargets.UI_MPLOBBYONLINETHEATER.id or f8_local0 == LobbyData.UITargets.UI_MPLOBBYLANGAME.id or f8_local0 == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f8_local0 == LobbyData.UITargets.UI_FRLOBBYLANGAME.id or f8_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id or f8_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINETHEATER.id or f8_local0 == LobbyData.UITargets.UI_ZMLOBBYLANGAME.id or f8_local0 == LobbyData.UITargets.UI_DOALOBBYLANGAME.id or f8_local0 == LobbyData.UITargets.UI_DOALOBBYONLINE.id then
		f0_local3( f8_arg0, f8_arg1, f8_arg2 )
	else
		f8_arg0:setState( "DefaultState" )
		f8_arg0:makeNotFocusable()
		f8_arg0:setMouseDisabled( true )
	end
end

local f0_local6 = function ( f9_arg0, f9_arg1 )
	local f9_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" ) )
	f9_arg0.FRDifficulty.SubTitle:setText( Engine.Localize( GetDifficultyForSelectedFreerunMap( f9_arg1, f9_local0 ) ) )
	f9_arg0.FRBestTime.BestTimeValueText:setText( Engine.Localize( GetBestTimeForSelectedFreerunMap( f9_arg1, f9_local0 ) ) )
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" ), Dvar.ui_mapname:get() )
	local f10_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
	Engine.CreateModel( f10_local0, "mapVoteCountNext" )
	Engine.CreateModel( f10_local0, "mapVoteCountPrevious" )
	Engine.CreateModel( f10_local0, "mapVoteCountRandom" )
	Engine.CreateModel( f10_local0, "mapVoteGameModeNext" )
	Engine.CreateModel( f10_local0, "mapVoteGameModePrevious" )
	Engine.CreateModel( f10_local0, "mapVoteMapNext" )
	Engine.CreateModel( f10_local0, "mapVoteMapPrevious" )
	Engine.CreateModel( f10_local0, "mapVoteMapPreviousGametype" )
	Engine.CreateModel( f10_local0, "timerActive" )
	Engine.CreateModel( f10_local0, "mapVoteCustomGameName" )
end

local PostLoadFunc = function ( self, controller, menu )
	self:makeNotFocusable()
	self:setMouseDisabled( true )
	f0_local1( self, menu )
	f0_local0( self )
	f0_local5( self, controller, menu )
	if self.lobbyNavSubscription then
		self:removeSubscription( self.lobbyNavSubscription )
	end
	self.lobbyNavSubscription = self:subscribeToModel( LobbyData.GetLobbyNavModel(), function ()
		f0_local5( self, controller, menu )
		f0_local6( self, controller )
	end, false )
	self:registerEventHandler( "preload_map_image", f0_local4 )
	if self.customGameSubscription then
		self:removeSubscription( self.customGameSubscription )
	end
	local f11_local0 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	self.customGameSubscription = self:subscribeToModel( Engine.GetModel( f11_local0, "mapVoteCustomGameName" ), function ()
		Engine.ForceNotifyModelSubscriptions( Engine.GetModel( f11_local0, "mapVoteGameModeNext" ) )
	end, false )
end

CoD.MapVote = InheritFrom( LUI.UIElement )
CoD.MapVote.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MapVote )
	self.id = "MapVote"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 355 )
	self:setTopBottom( true, false, 0, 180 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MapVoteItemVoteDecided = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemVoteDecided:setLeftRight( true, true, 0, 0 )
	MapVoteItemVoteDecided:setTopBottom( false, false, -90, 88 )
	MapVoteItemVoteDecided:setAlpha( 0 )
	MapVoteItemVoteDecided.VoteType:setAlpha( 0 )
	MapVoteItemVoteDecided.VoteType:setText( Engine.Localize( "" ) )
	MapVoteItemVoteDecided.voteCount:setAlpha( 0 )
	MapVoteItemVoteDecided.voteCount:setText( Engine.Localize( "" ) )
	MapVoteItemVoteDecided:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local mapVoteMapNext = Engine.GetModelValue( model )
		if mapVoteMapNext then
			MapVoteItemVoteDecided.MapImage:setImage( RegisterImage( MapNameToMapImage( mapVoteMapNext ) ) )
		end
	end )
	MapVoteItemVoteDecided:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local mapVoteMapNext = Engine.GetModelValue( model )
		if mapVoteMapNext then
			MapVoteItemVoteDecided.MapNameNew.btnDisplayTextStroke:setText( MapNameToLocalizedMapName( mapVoteMapNext ) )
		end
	end )
	MapVoteItemVoteDecided:subscribeToGlobalModel( controller, "MapVote", "mapVoteGameModeNext", function ( model )
		local mapVoteGameModeNext = Engine.GetModelValue( model )
		if mapVoteGameModeNext then
			MapVoteItemVoteDecided.GameModeNew.SubTitle:setText( Engine.Localize( PrependCustomGameName( mapVoteGameModeNext ) ) )
		end
	end )
	self:addElement( MapVoteItemVoteDecided )
	self.MapVoteItemVoteDecided = MapVoteItemVoteDecided
	
	local MapVoteItemRandom = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
	MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
	MapVoteItemRandom:setScale( 0.85 )
	MapVoteItemRandom.MapImage:setImage( RegisterImage( "uie_lui_random_map_vote" ) )
	MapVoteItemRandom.VoteType:setAlpha( 1 )
	MapVoteItemRandom.VoteType:setText( Engine.Localize( "MPUI_RANDOM_CAPS" ) )
	MapVoteItemRandom.MapNameNew.btnDisplayTextStroke:setText( LocalizeToUpperString( "MENU_CLASSIFIED" ) )
	MapVoteItemRandom.GameModeNew.SubTitle:setText( Engine.Localize( "MENU_MODE_CLASSIFIED_CAPS" ) )
	MapVoteItemRandom:subscribeToGlobalModel( controller, "MapVote", "mapVoteCountRandom", function ( model )
		local mapVoteCountRandom = Engine.GetModelValue( model )
		if mapVoteCountRandom then
			MapVoteItemRandom.voteCount:setText( Engine.Localize( mapVoteCountRandom ) )
		end
	end )
	MapVoteItemRandom:registerEventHandler( "lobby_map_vote_random_chosen", function ( element, event )
		local f19_local0 = nil
		PlayClip( self, "MapVoteChosenRandom", controller )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	MapVoteItemRandom:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f20_local0
	end )
	MapVoteItemRandom:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	menu:AddButtonCallbackFunction( MapVoteItemRandom, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		LobbyMapVoteSelectRandom( self, f22_arg2 )
		PlaySoundSetSound( self, "menu_open" )
		return true
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MapVoteItemRandom )
	self.MapVoteItemRandom = MapVoteItemRandom
	
	local MapVoteItemPrevious = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
	MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
	MapVoteItemPrevious:setScale( 0.85 )
	MapVoteItemPrevious.VoteType:setAlpha( 1 )
	MapVoteItemPrevious.VoteType:setText( Engine.Localize( "MPUI_PREV_CAPS" ) )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapPrevious", function ( model )
		local mapVoteMapPrevious = Engine.GetModelValue( model )
		if mapVoteMapPrevious then
			MapVoteItemPrevious.MapImage:setImage( RegisterImage( MapNameToMapImage( mapVoteMapPrevious ) ) )
		end
	end )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteCountPrevious", function ( model )
		local mapVoteCountPrevious = Engine.GetModelValue( model )
		if mapVoteCountPrevious then
			MapVoteItemPrevious.voteCount:setText( Engine.Localize( mapVoteCountPrevious ) )
		end
	end )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapPrevious", function ( model )
		local mapVoteMapPrevious = Engine.GetModelValue( model )
		if mapVoteMapPrevious then
			MapVoteItemPrevious.MapNameNew.btnDisplayTextStroke:setText( MapNameToLocalizedMapName( mapVoteMapPrevious ) )
		end
	end )
	MapVoteItemPrevious:subscribeToGlobalModel( controller, "MapVote", "mapVoteGameModePrevious", function ( model )
		local mapVoteGameModePrevious = Engine.GetModelValue( model )
		if mapVoteGameModePrevious then
			MapVoteItemPrevious.GameModeNew.SubTitle:setText( Engine.Localize( mapVoteGameModePrevious ) )
		end
	end )
	MapVoteItemPrevious:registerEventHandler( "lobby_map_vote_previous_chosen", function ( element, event )
		local f28_local0 = nil
		PlayClip( self, "MapVoteChosenPrevious", controller )
		if not f28_local0 then
			f28_local0 = element:dispatchEventToChildren( event )
		end
		return f28_local0
	end )
	MapVoteItemPrevious:registerEventHandler( "gain_focus", function ( element, event )
		local f29_local0 = nil
		if element.gainFocus then
			f29_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f29_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f29_local0
	end )
	MapVoteItemPrevious:registerEventHandler( "lose_focus", function ( element, event )
		local f30_local0 = nil
		if element.loseFocus then
			f30_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f30_local0 = element.super:loseFocus( event )
		end
		return f30_local0
	end )
	menu:AddButtonCallbackFunction( MapVoteItemPrevious, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		LobbyMapVoteSelectPrevious( self, f31_arg2 )
		PlaySoundSetSound( self, "menu_open" )
		return true
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	MapVoteItemPrevious:mergeStateConditions( {
		{
			stateName = "Unselectable",
			condition = function ( menu, element, event )
				return not MapVotePreviousSelectable()
			end
		}
	} )
	MapVoteItemPrevious:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ), function ( model )
		menu:updateElementState( MapVoteItemPrevious, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.mapVote"
		} )
	end )
	MapVoteItemPrevious:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( MapVoteItemPrevious, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( MapVoteItemPrevious )
	self.MapVoteItemPrevious = MapVoteItemPrevious
	
	local MapVoteItemNext = CoD.MapVoteItem.new( menu, controller )
	MapVoteItemNext:setLeftRight( true, true, -27, -27 )
	MapVoteItemNext:setTopBottom( false, false, -72, -14 )
	MapVoteItemNext:setScale( 0.85 )
	MapVoteItemNext.VoteType:setAlpha( 1 )
	MapVoteItemNext.VoteType:setText( Engine.Localize( "MPUI_NEXT_CAPS" ) )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local mapVoteMapNext = Engine.GetModelValue( model )
		if mapVoteMapNext then
			MapVoteItemNext.MapImage:setImage( RegisterImage( MapNameToMapImage( mapVoteMapNext ) ) )
		end
	end )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteCountNext", function ( model )
		local mapVoteCountNext = Engine.GetModelValue( model )
		if mapVoteCountNext then
			MapVoteItemNext.voteCount:setText( Engine.Localize( mapVoteCountNext ) )
		end
	end )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
		local mapVoteMapNext = Engine.GetModelValue( model )
		if mapVoteMapNext then
			MapVoteItemNext.MapNameNew.btnDisplayTextStroke:setText( MapNameToLocalizedMapName( mapVoteMapNext ) )
		end
	end )
	MapVoteItemNext:subscribeToGlobalModel( controller, "MapVote", "mapVoteGameModeNext", function ( model )
		local mapVoteGameModeNext = Engine.GetModelValue( model )
		if mapVoteGameModeNext then
			MapVoteItemNext.GameModeNew.SubTitle:setText( Engine.Localize( mapVoteGameModeNext ) )
		end
	end )
	MapVoteItemNext:registerEventHandler( "lobby_map_vote_next_chosen", function ( element, event )
		local f40_local0 = nil
		PlayClip( self, "MapVoteChosenNext", controller )
		if not f40_local0 then
			f40_local0 = element:dispatchEventToChildren( event )
		end
		return f40_local0
	end )
	MapVoteItemNext:registerEventHandler( "gain_focus", function ( element, event )
		local f41_local0 = nil
		if element.gainFocus then
			f41_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f41_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f41_local0
	end )
	MapVoteItemNext:registerEventHandler( "lose_focus", function ( element, event )
		local f42_local0 = nil
		if element.loseFocus then
			f42_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f42_local0 = element.super:loseFocus( event )
		end
		return f42_local0
	end )
	menu:AddButtonCallbackFunction( MapVoteItemNext, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		LobbyMapVoteSelectNext( self, f43_arg2 )
		PlaySoundSetSound( self, "menu_open" )
		return true
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MapVoteItemNext )
	self.MapVoteItemNext = MapVoteItemNext
	
	local FEListSubHeaderGlow0 = CoD.MapVoteHeader.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
	FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local MapVoting = LUI.UITightText.new()
	MapVoting:setLeftRight( true, false, 12, 40.5 )
	MapVoting:setTopBottom( true, false, -6, 14 )
	MapVoting:setRGB( 0, 0, 0 )
	MapVoting:setText( Engine.Localize( "MENU_VOTING_VOTE_STRING" ) )
	MapVoting:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MapVoting:setLetterSpacing( 0.5 )
	self:addElement( MapVoting )
	self.MapVoting = MapVoting
	
	local LobbyStatus = LUI.UITightText.new()
	LobbyStatus:setLeftRight( false, true, -94.5, -66 )
	LobbyStatus:setTopBottom( true, false, -6, 14 )
	LobbyStatus:setRGB( 0, 0, 0 )
	LobbyStatus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LobbyStatus:setLetterSpacing( 0.5 )
	LobbyStatus:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatus", function ( model )
		local lobbyStatus = Engine.GetModelValue( model )
		if lobbyStatus then
			LobbyStatus:setText( lobbyStatus )
		end
	end )
	self:addElement( LobbyStatus )
	self.LobbyStatus = LobbyStatus
	
	local FETitleLineUpper = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineUpper:setLeftRight( true, true, 0, -53 )
	FETitleLineUpper:setTopBottom( false, false, -76, -72 )
	FETitleLineUpper:setAlpha( 0 )
	self:addElement( FETitleLineUpper )
	self.FETitleLineUpper = FETitleLineUpper
	
	local FETitleLineUpper0 = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
	FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
	FETitleLineUpper0:setAlpha( 0 )
	self:addElement( FETitleLineUpper0 )
	self.FETitleLineUpper0 = FETitleLineUpper0
	
	local FETitleLineBottom0 = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
	FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
	FETitleLineBottom0:setAlpha( 0 )
	self:addElement( FETitleLineBottom0 )
	self.FETitleLineBottom0 = FETitleLineBottom0
	
	local FRBestTime = CoD.FR_BestTime.new( menu, controller )
	FRBestTime:setLeftRight( true, false, 166, 303 )
	FRBestTime:setTopBottom( true, false, 116, 178 )
	FRBestTime:subscribeToGlobalModel( controller, "LobbyRoot", "selectedMapId", function ( model )
		local selectedMapId = Engine.GetModelValue( model )
		if selectedMapId then
			FRBestTime.BestTimeValueText:setText( Engine.Localize( GetBestTimeForSelectedFreerunMap( controller, selectedMapId ) ) )
		end
	end )
	self:addElement( FRBestTime )
	self.FRBestTime = FRBestTime
	
	local FRDifficulty = CoD.FR_Difficulty.new( menu, controller )
	FRDifficulty:setLeftRight( true, false, 10, 164 )
	FRDifficulty:setTopBottom( true, false, 150, 172 )
	FRDifficulty:subscribeToGlobalModel( controller, "LobbyRoot", "selectedMapId", function ( model )
		local selectedMapId = Engine.GetModelValue( model )
		if selectedMapId then
			FRDifficulty.SubTitle:setText( Engine.Localize( GetDifficultyForSelectedFreerunMap( controller, selectedMapId ) ) )
		end
	end )
	self:addElement( FRDifficulty )
	self.FRDifficulty = FRDifficulty
	
	local ArenaRules = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, true )
	ArenaRules:makeFocusable()
	ArenaRules:setLeftRight( true, false, 0, 303 )
	ArenaRules:setTopBottom( true, false, -63, -12 )
	ArenaRules:setWidgetType( CoD.ArenaMapVoteRuleItem )
	ArenaRules:setVerticalCount( 2 )
	ArenaRules:setSpacing( 5 )
	ArenaRules:setDataSource( "ArenaActiveRules" )
	self:addElement( ArenaRules )
	self.ArenaRules = ArenaRules
	
	local MapVoteNoDemoSelected = CoD.MapVoteNoDemoSelected.new( menu, controller )
	MapVoteNoDemoSelected:setLeftRight( true, false, 0, 303 )
	MapVoteNoDemoSelected:setTopBottom( true, false, 18, 169 )
	self:addElement( MapVoteNoDemoSelected )
	self.MapVoteNoDemoSelected = MapVoteNoDemoSelected
	
	local MapVoteResult = CoD.MapVoteResult.new( menu, controller )
	MapVoteResult:setLeftRight( true, false, 0, 303 )
	MapVoteResult:setTopBottom( true, false, 18, 169.93 )
	self:addElement( MapVoteResult )
	self.MapVoteResult = MapVoteResult
	
	local FileshareSpinner = CoD.FileshareSpinner.new( menu, controller )
	FileshareSpinner:setLeftRight( true, false, 119.5, 183.5 )
	FileshareSpinner:setTopBottom( true, false, 44, 108 )
	FileshareSpinner:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local DownloadPercent = LUI.UIText.new()
	DownloadPercent:setLeftRight( true, false, 26.25, 274.75 )
	DownloadPercent:setTopBottom( true, false, 99.5, 124.5 )
	DownloadPercent:setTTF( "fonts/default.ttf" )
	DownloadPercent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DownloadPercent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	DownloadPercent:subscribeToGlobalModel( controller, "LobbyRoot", "theaterDownloadPercent", function ( model )
		local theaterDownloadPercent = Engine.GetModelValue( model )
		if theaterDownloadPercent then
			DownloadPercent:setText( FileshareGetDownloadProgress( theaterDownloadPercent ) )
		end
	end )
	self:addElement( DownloadPercent )
	self.DownloadPercent = DownloadPercent
	
	local MapVoteOfficial = CoD.MapVoteOfficial.new( menu, controller )
	MapVoteOfficial:setLeftRight( true, false, 192, 301.35 )
	MapVoteOfficial:setTopBottom( true, false, 29.27, 58.73 )
	self:addElement( MapVoteOfficial )
	self.MapVoteOfficial = MapVoteOfficial
	
	local ZMLobbyEEList = LUI.GridLayout.new( menu, controller, false, 0, 0, -7, 0, nil, nil, false, false, 0, 0, false, true )
	ZMLobbyEEList:setLeftRight( false, true, -235.65, -53.65 )
	ZMLobbyEEList:setTopBottom( false, false, 36, 78 )
	ZMLobbyEEList:setWidgetType( CoD.ZMLobbyEEWidgetSmall )
	ZMLobbyEEList:setHorizontalCount( 5 )
	ZMLobbyEEList:setSpacing( -7 )
	ZMLobbyEEList:setDataSource( "ZMLobbyEEMapVote" )
	self:addElement( ZMLobbyEEList )
	self.ZMLobbyEEList = ZMLobbyEEList
	
	MapVoteItemVoteDecided.navigation = {
		left = {
			MapVoteItemNext,
			MapVoteItemPrevious,
			MapVoteItemRandom
		},
		up = MapVoteItemNext,
		down = MapVoteItemPrevious
	}
	MapVoteItemRandom.navigation = {
		up = MapVoteItemVoteDecided,
		right = MapVoteItemVoteDecided
	}
	MapVoteItemPrevious.navigation = {
		up = MapVoteItemVoteDecided,
		right = MapVoteItemVoteDecided,
		down = MapVoteItemRandom
	}
	MapVoteItemNext.navigation = {
		up = ArenaRules,
		right = MapVoteItemVoteDecided,
		down = MapVoteItemVoteDecided
	}
	ArenaRules.navigation = {
		down = MapVoteItemVoteDecided
	}
	self.clipsPerState = {
		CPHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )

				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 0 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		MPHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )

				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 0 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		ZMHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )

				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 0 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )

				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -90, -32 )
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, 0 )
				self.FETitleLineUpper:setTopBottom( false, false, -98, -94 )
				self.FETitleLineUpper:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 0 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )

				ZMLobbyEEList:completeAnimation()
				self.ZMLobbyEEList:setAlpha( 0 )
				self.clipFinished( ZMLobbyEEList, {} )
			end,
			MapVote = function ()
				self:setupElementClipCounter( 15 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
						end
						MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
						MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
						MapVoteItemRandom:setAlpha( 1 )
						MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
						MapVoteItemRandom.VoteType:setAlpha( 1 )
						MapVoteItemRandom.voteCount:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoteItemRandom, event )
						else
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						if not event.interrupted then
							MapVoteItemPrevious:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 210, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 210, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 210, false, false, CoD.TweenType.Linear )
						end
						MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
						MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
						MapVoteItemPrevious:setAlpha( 1 )
						MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
						MapVoteItemPrevious.VoteType:setAlpha( 1 )
						MapVoteItemPrevious.voteCount:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoteItemPrevious, event )
						else
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()

				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemPrevious.VoteType:completeAnimation()

				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setLeftRight( true, true, -27, -27 )
					MapVoteItemNext:setTopBottom( false, false, -72, -14 )
					MapVoteItemNext:setAlpha( 1 )
					MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemNext.VoteType:setAlpha( 1 )
					MapVoteItemNext.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()

				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemNext.VoteType:completeAnimation()

				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext:setAlpha( 0 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					local FEListSubHeaderGlow0Frame3 = function ( FEListSubHeaderGlow0, event )
						if not event.interrupted then
							FEListSubHeaderGlow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeaderGlow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeaderGlow0, event )
						else
							FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeaderGlow0Frame3( FEListSubHeaderGlow0, event )
						return 
					else
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						FEListSubHeaderGlow0:setAlpha( 1 )
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", FEListSubHeaderGlow0Frame3 )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					local MapVotingFrame3 = function ( MapVoting, event )
						if not event.interrupted then
							MapVoting:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						MapVoting:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoting, event )
						else
							MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVotingFrame3( MapVoting, event )
						return 
					else
						MapVoting:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MapVoting:registerEventHandler( "transition_complete_keyframe", MapVotingFrame3 )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				MapVotingFrame2( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					local LobbyStatusFrame3 = function ( LobbyStatus, event )
						if not event.interrupted then
							LobbyStatus:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						LobbyStatus:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyStatus, event )
						else
							LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyStatusFrame3( LobbyStatus, event )
						return 
					else
						LobbyStatus:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", LobbyStatusFrame3 )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 0 )
				LobbyStatusFrame2( LobbyStatus, {} )
				local FETitleLineUpperFrame2 = function ( FETitleLineUpper, event )
					if not event.interrupted then
						FETitleLineUpper:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineUpper:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper:setTopBottom( false, false, -76, -72 )
					FETitleLineUpper:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper, event )
					else
						FETitleLineUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 0 )
				FETitleLineUpperFrame2( FETitleLineUpper, {} )
				local FETitleLineUpper0Frame2 = function ( FETitleLineUpper0, event )
					if not event.interrupted then
						FETitleLineUpper0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
					FETitleLineUpper0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper0, event )
					else
						FETitleLineUpper0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
				self.FETitleLineUpper0:setAlpha( 0 )
				FETitleLineUpper0Frame2( FETitleLineUpper0, {} )
				local FETitleLineBottom0Frame2 = function ( FETitleLineBottom0, event )
					if not event.interrupted then
						FETitleLineBottom0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
					FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
					FETitleLineBottom0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FETitleLineBottom0, event )
					else
						FETitleLineBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 0 )
				FETitleLineBottom0Frame2( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				ArenaRulesFrame2( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					local MapVoteOfficialFrame3 = function ( MapVoteOfficial, event )
						if not event.interrupted then
							MapVoteOfficial:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						MapVoteOfficial:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapVoteOfficial, event )
						else
							MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteOfficialFrame3( MapVoteOfficial, event )
						return 
					else
						MapVoteOfficial:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", MapVoteOfficialFrame3 )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 15 )

				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
					MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
					MapVoteItemVoteDecided:setAlpha( 1 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					if not event.interrupted then
						MapVoteItemPrevious:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
					MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
					MapVoteItemPrevious:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemPrevious, event )
					else
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -30, 28 )
				self.MapVoteItemPrevious:setAlpha( 0 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setLeftRight( true, true, -27, -27 )
					MapVoteItemNext:setTopBottom( false, false, -90, -32 )
					MapVoteItemNext:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -90, -32 )
				self.MapVoteItemNext:setAlpha( 0 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					local FEListSubHeaderGlow0Frame3 = function ( FEListSubHeaderGlow0, event )
						if not event.interrupted then
							FEListSubHeaderGlow0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
						FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
						FEListSubHeaderGlow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeaderGlow0, event )
						else
							FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeaderGlow0Frame3( FEListSubHeaderGlow0, event )
						return 
					else
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FEListSubHeaderGlow0:setAlpha( 0.99 )
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", FEListSubHeaderGlow0Frame3 )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 0 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				MapVotingFrame2( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setLeftRight( false, true, -94.5, -66 )
					LobbyStatus:setTopBottom( true, false, -6, 14 )
					LobbyStatus:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 0 )
				LobbyStatusFrame2( LobbyStatus, {} )
				local FETitleLineUpperFrame2 = function ( FETitleLineUpper, event )
					if not event.interrupted then
						FETitleLineUpper:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineUpper:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper:setTopBottom( false, false, -76, -72 )
					FETitleLineUpper:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper, event )
					else
						FETitleLineUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 0 )
				FETitleLineUpperFrame2( FETitleLineUpper, {} )
				local FETitleLineUpper0Frame2 = function ( FETitleLineUpper0, event )
					if not event.interrupted then
						FETitleLineUpper0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
					FETitleLineUpper0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper0, event )
					else
						FETitleLineUpper0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
				self.FETitleLineUpper0:setAlpha( 0 )
				FETitleLineUpper0Frame2( FETitleLineUpper0, {} )
				local FETitleLineBottom0Frame2 = function ( FETitleLineBottom0, event )
					if not event.interrupted then
						FETitleLineBottom0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
					FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
					FETitleLineBottom0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FETitleLineBottom0, event )
					else
						FETitleLineBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 0 )
				FETitleLineBottom0Frame2( FETitleLineBottom0, {} )
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRBestTime:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 0 )
				ArenaRulesFrame2( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					if not event.interrupted then
						MapVoteOfficial:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					MapVoteOfficial:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteOfficial, event )
					else
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end
		},
		MapVote = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )

				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 1 )
				self.MapVoteItemRandom:setScale( 0.85 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				self.clipFinished( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()

				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemPrevious.VoteType:completeAnimation()

				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				self.MapVoteItemPrevious:setScale( 0.85 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()

				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemNext.VoteType:completeAnimation()

				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setAlpha( 1 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )
			end,
			MapVoteChosenNext = function ()
				self:setupElementClipCounter( 12 )

				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								if not event.interrupted then
									MapVoteItemRandom:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
								MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
								MapVoteItemRandom:setAlpha( 0 )
								MapVoteItemRandom:setScale( 0.85 )
								if event.interrupted then
									self.clipFinished( MapVoteItemRandom, event )
								else
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.8 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 1 )
				self.MapVoteItemRandom:setScale( 0.85 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								local MapVoteItemPreviousFrame6 = function ( MapVoteItemPrevious, event )
									if not event.interrupted then
										MapVoteItemPrevious:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
									MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
									MapVoteItemPrevious:setAlpha( 0 )
									MapVoteItemPrevious:setScale( 0.85 )
									if event.interrupted then
										self.clipFinished( MapVoteItemPrevious, event )
									else
										MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemPreviousFrame6( MapVoteItemPrevious, event )
									return 
								else
									MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									MapVoteItemPrevious:setAlpha( 0.38 )
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0.75 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				self.MapVoteItemPrevious:setScale( 0.85 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						if not event.interrupted then
							MapVoteItemNext:beginAnimation( "keyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemNext:setLeftRight( true, true, -27, -27 )
						MapVoteItemNext:setTopBottom( false, false, -81, 97 )
						MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemNext.VoteType:setAlpha( 0 )
						MapVoteItemNext.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemNext, event )
						else
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()

				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemNext.VoteType:completeAnimation()

				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
			end,
			MapVoteChosenPrevious = function ()
				self:setupElementClipCounter( 12 )

				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								local MapVoteItemRandomFrame6 = function ( MapVoteItemRandom, event )
									local MapVoteItemRandomFrame7 = function ( MapVoteItemRandom, event )
										if not event.interrupted then
											MapVoteItemRandom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										end
										MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
										MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
										MapVoteItemRandom:setAlpha( 0 )
										MapVoteItemRandom:setScale( 0.85 )
										if event.interrupted then
											self.clipFinished( MapVoteItemRandom, event )
										else
											MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										MapVoteItemRandomFrame7( MapVoteItemRandom, event )
										return 
									else
										MapVoteItemRandom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										MapVoteItemRandom:setAlpha( 0.3 )
										MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame7 )
									end
								end
								
								if event.interrupted then
									MapVoteItemRandomFrame6( MapVoteItemRandom, event )
									return 
								else
									MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									MapVoteItemRandom:setAlpha( 0.17 )
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.6 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 1 )
				self.MapVoteItemRandom:setScale( 0.85 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						if not event.interrupted then
							MapVoteItemPrevious:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
						MapVoteItemPrevious:setTopBottom( false, false, -90, 88 )
						MapVoteItemPrevious:setScale( 0.85 )
						MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemPrevious.VoteType:setAlpha( 0 )
						MapVoteItemPrevious.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemPrevious, event )
						else
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()

				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemPrevious.VoteType:completeAnimation()

				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setScale( 0.85 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setLeftRight( true, true, -27, -27 )
									MapVoteItemNext:setTopBottom( false, false, -72, -14 )
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.5 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.88 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
			end,
			MapVoteChosenRandom = function ()
				self:setupElementClipCounter( 12 )

				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
						MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
						MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemRandom.VoteType:setAlpha( 0 )
						MapVoteItemRandom.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemRandom, event )
						else
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								if not event.interrupted then
									MapVoteItemPrevious:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
								MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
								MapVoteItemPrevious:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MapVoteItemPrevious, event )
								else
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0.5 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:setAlpha( 0.9 )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setLeftRight( true, true, -27, -27 )
									MapVoteItemNext:setTopBottom( false, false, -72, -14 )
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.25 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.63 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 15 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
					MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemRandom.VoteType:setAlpha( 1 )
					MapVoteItemRandom.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 1 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					if not event.interrupted then
						MapVoteItemPrevious:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
						MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Bounce )
						MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Bounce )
						MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
					MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
					MapVoteItemPrevious:setAlpha( 0 )
					MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemPrevious.VoteType:setAlpha( 1 )
					MapVoteItemPrevious.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemPrevious, event )
					else
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()

				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemPrevious.VoteType:completeAnimation()

				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					if not event.interrupted then
						MapVoteItemNext:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
						MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemNext:setLeftRight( true, true, -27, -27 )
					MapVoteItemNext:setTopBottom( false, false, -72, -14 )
					MapVoteItemNext:setAlpha( 0 )
					MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
					MapVoteItemNext.VoteType:setAlpha( 1 )
					MapVoteItemNext.voteCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MapVoteItemNext, event )
					else
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemNext:completeAnimation()

				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemNext.VoteType:completeAnimation()

				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext:setAlpha( 1 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					local FEListSubHeaderGlow0Frame3 = function ( FEListSubHeaderGlow0, event )
						if not event.interrupted then
							FEListSubHeaderGlow0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						FEListSubHeaderGlow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEListSubHeaderGlow0, event )
						else
							FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeaderGlow0Frame3( FEListSubHeaderGlow0, event )
						return 
					else
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Bounce )
						FEListSubHeaderGlow0:setAlpha( 0 )
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", FEListSubHeaderGlow0Frame3 )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				LobbyStatusFrame2( LobbyStatus, {} )
				local FETitleLineUpperFrame2 = function ( FETitleLineUpper, event )
					if not event.interrupted then
						FETitleLineUpper:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineUpper:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper:setTopBottom( false, false, -76, -72 )
					FETitleLineUpper:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper, event )
					else
						FETitleLineUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 1 )
				FETitleLineUpperFrame2( FETitleLineUpper, {} )
				local FETitleLineUpper0Frame2 = function ( FETitleLineUpper0, event )
					if not event.interrupted then
						FETitleLineUpper0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
					FETitleLineUpper0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper0, event )
					else
						FETitleLineUpper0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper0:setTopBottom( false, false, -99, -95 )
				self.FETitleLineUpper0:setAlpha( 1 )
				FETitleLineUpper0Frame2( FETitleLineUpper0, {} )
				local FETitleLineBottom0Frame2 = function ( FETitleLineBottom0, event )
					if not event.interrupted then
						FETitleLineBottom0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
					FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
					FETitleLineBottom0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineBottom0, event )
					else
						FETitleLineBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 1 )
				FETitleLineBottom0Frame2( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					if not event.interrupted then
						MapVoteOfficial:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					MapVoteOfficial:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteOfficial, event )
					else
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 1 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end
		},
		SelectedMap = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 1 )
				self.clipFinished( MapVoteOfficial, {} )

				ZMLobbyEEList:completeAnimation()
				self.ZMLobbyEEList:setAlpha( 1 )
				self.clipFinished( ZMLobbyEEList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 14 )

				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
					MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					if not event.interrupted then
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
					FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
					FEListSubHeaderGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow0, event )
					else
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setLeftRight( false, true, -94.5, -66 )
					LobbyStatus:setTopBottom( true, false, -6, 14 )
					LobbyStatus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				LobbyStatusFrame2( LobbyStatus, {} )
				local FETitleLineUpperFrame2 = function ( FETitleLineUpper, event )
					if not event.interrupted then
						FETitleLineUpper:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineUpper:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper:setTopBottom( false, false, -76, -72 )
					FETitleLineUpper:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper, event )
					else
						FETitleLineUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 1 )
				FETitleLineUpperFrame2( FETitleLineUpper, {} )
				local FETitleLineBottom0Frame2 = function ( FETitleLineBottom0, event )
					if not event.interrupted then
						FETitleLineBottom0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
					FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
					FETitleLineBottom0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineBottom0, event )
					else
						FETitleLineBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 1 )
				FETitleLineBottom0Frame2( FETitleLineBottom0, {} )
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )
				local MapVoteOfficialFrame2 = function ( MapVoteOfficial, event )
					if not event.interrupted then
						MapVoteOfficial:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MapVoteOfficial:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteOfficial, event )
					else
						MapVoteOfficial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 1 )
				MapVoteOfficialFrame2( MapVoteOfficial, {} )
			end
		},
		MapVoteChosenNext = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 15 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -90, 88 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								if not event.interrupted then
									MapVoteItemRandom:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
								MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
								MapVoteItemRandom:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MapVoteItemRandom, event )
								else
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.8 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								local MapVoteItemPreviousFrame6 = function ( MapVoteItemPrevious, event )
									if not event.interrupted then
										MapVoteItemPrevious:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
									MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
									MapVoteItemPrevious:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemPrevious, event )
									else
										MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemPreviousFrame6( MapVoteItemPrevious, event )
									return 
								else
									MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									MapVoteItemPrevious:setAlpha( 0.38 )
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0.75 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						if not event.interrupted then
							MapVoteItemNext:beginAnimation( "keyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.VoteType:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
							MapVoteItemNext.voteCount:beginAnimation( "subkeyframe", 620, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemNext:setLeftRight( true, true, -27, -27 )
						MapVoteItemNext:setTopBottom( false, false, -81, 97 )
						MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemNext.VoteType:setAlpha( 0 )
						MapVoteItemNext.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemNext, event )
						else
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()

				MapVoteItemNext.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemNext.VoteType:completeAnimation()

				MapVoteItemNext.voteCount:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemNext.VoteType:setAlpha( 1 )
				self.MapVoteItemNext.voteCount:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		MapVoteChosenPrevious = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 14 )

				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						local MapVoteItemRandomFrame4 = function ( MapVoteItemRandom, event )
							local MapVoteItemRandomFrame5 = function ( MapVoteItemRandom, event )
								local MapVoteItemRandomFrame6 = function ( MapVoteItemRandom, event )
									local MapVoteItemRandomFrame7 = function ( MapVoteItemRandom, event )
										if not event.interrupted then
											MapVoteItemRandom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										end
										MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
										MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
										MapVoteItemRandom:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( MapVoteItemRandom, event )
										else
											MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										MapVoteItemRandomFrame7( MapVoteItemRandom, event )
										return 
									else
										MapVoteItemRandom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										MapVoteItemRandom:setAlpha( 0.3 )
										MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame7 )
									end
								end
								
								if event.interrupted then
									MapVoteItemRandomFrame6( MapVoteItemRandom, event )
									return 
								else
									MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									MapVoteItemRandom:setAlpha( 0.17 )
									MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemRandomFrame5( MapVoteItemRandom, event )
								return 
							else
								MapVoteItemRandom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemRandom:setAlpha( 0.6 )
								MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemRandomFrame4( MapVoteItemRandom, event )
							return 
						else
							MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemRandom:setAlpha( 0 )
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:setAlpha( 0.9 )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						if not event.interrupted then
							MapVoteItemPrevious:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemPrevious.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
						MapVoteItemPrevious:setTopBottom( false, false, -90, 88 )
						MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemPrevious.VoteType:setAlpha( 0 )
						MapVoteItemPrevious.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemPrevious, event )
						else
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()

				MapVoteItemPrevious.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemPrevious.VoteType:completeAnimation()

				MapVoteItemPrevious.voteCount:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemPrevious.VoteType:setAlpha( 1 )
				self.MapVoteItemPrevious.voteCount:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setLeftRight( true, true, -27, -27 )
									MapVoteItemNext:setTopBottom( false, false, -72, -14 )
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.5 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.88 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		MapVoteChosenRandom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			SelectedMap = function ()
				self:setupElementClipCounter( 11 )

				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					local MapVoteItemRandomFrame3 = function ( MapVoteItemRandom, event )
						if not event.interrupted then
							MapVoteItemRandom:beginAnimation( "keyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
							MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 649, true, true, CoD.TweenType.Linear )
						end
						MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
						MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
						MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
						MapVoteItemRandom.VoteType:setAlpha( 0 )
						MapVoteItemRandom.voteCount:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MapVoteItemRandom, event )
						else
							MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapVoteItemRandomFrame3( MapVoteItemRandom, event )
						return 
					else
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", MapVoteItemRandomFrame3 )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemRandom:setTopBottom( false, false, 30, 88 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0.5 )
				self.MapVoteItemRandom.VoteType:setAlpha( 1 )
				self.MapVoteItemRandom.voteCount:setAlpha( 1 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )
				local MapVoteItemPreviousFrame2 = function ( MapVoteItemPrevious, event )
					local MapVoteItemPreviousFrame3 = function ( MapVoteItemPrevious, event )
						local MapVoteItemPreviousFrame4 = function ( MapVoteItemPrevious, event )
							local MapVoteItemPreviousFrame5 = function ( MapVoteItemPrevious, event )
								if not event.interrupted then
									MapVoteItemPrevious:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
								MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
								MapVoteItemPrevious:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MapVoteItemPrevious, event )
								else
									MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MapVoteItemPreviousFrame5( MapVoteItemPrevious, event )
								return 
							else
								MapVoteItemPrevious:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								MapVoteItemPrevious:setAlpha( 0.5 )
								MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemPreviousFrame4( MapVoteItemPrevious, event )
							return 
						else
							MapVoteItemPrevious:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							MapVoteItemPrevious:setAlpha( 0 )
							MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemPreviousFrame3( MapVoteItemPrevious, event )
						return 
					else
						MapVoteItemPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						MapVoteItemPrevious:setAlpha( 0.9 )
						MapVoteItemPrevious:registerEventHandler( "transition_complete_keyframe", MapVoteItemPreviousFrame3 )
					end
				end
				
				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemPrevious:setTopBottom( false, false, -21, 37 )
				self.MapVoteItemPrevious:setAlpha( 1 )
				MapVoteItemPreviousFrame2( MapVoteItemPrevious, {} )
				local MapVoteItemNextFrame2 = function ( MapVoteItemNext, event )
					local MapVoteItemNextFrame3 = function ( MapVoteItemNext, event )
						local MapVoteItemNextFrame4 = function ( MapVoteItemNext, event )
							local MapVoteItemNextFrame5 = function ( MapVoteItemNext, event )
								local MapVoteItemNextFrame6 = function ( MapVoteItemNext, event )
									if not event.interrupted then
										MapVoteItemNext:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									end
									MapVoteItemNext:setLeftRight( true, true, -27, -27 )
									MapVoteItemNext:setTopBottom( false, false, -72, -14 )
									MapVoteItemNext:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( MapVoteItemNext, event )
									else
										MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MapVoteItemNextFrame6( MapVoteItemNext, event )
									return 
								else
									MapVoteItemNext:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapVoteItemNext:setAlpha( 0.25 )
									MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame6 )
								end
							end
							
							if event.interrupted then
								MapVoteItemNextFrame5( MapVoteItemNext, event )
								return 
							else
								MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapVoteItemNext:setAlpha( 0 )
								MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame5 )
							end
						end
						
						if event.interrupted then
							MapVoteItemNextFrame4( MapVoteItemNext, event )
							return 
						else
							MapVoteItemNext:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							MapVoteItemNext:setAlpha( 0.63 )
							MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame4 )
						end
					end
					
					if event.interrupted then
						MapVoteItemNextFrame3( MapVoteItemNext, event )
						return 
					else
						MapVoteItemNext:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MapVoteItemNext:registerEventHandler( "transition_complete_keyframe", MapVoteItemNextFrame3 )
					end
				end
				
				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemNext:setTopBottom( false, false, -72, -14 )
				self.MapVoteItemNext:setAlpha( 1 )
				MapVoteItemNextFrame2( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )
				local MapVotingFrame2 = function ( MapVoting, event )
					if not event.interrupted then
						MapVoting:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					MapVoting:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoting, event )
					else
						MapVoting:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 1 )
				MapVotingFrame2( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		DemoSelectedDownloading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 1 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 1 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 13 )

				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
					MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					if not event.interrupted then
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
					FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
					FEListSubHeaderGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow0, event )
					else
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setLeftRight( false, true, -94.5, -66 )
					LobbyStatus:setTopBottom( true, false, -6, 14 )
					LobbyStatus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				LobbyStatusFrame2( LobbyStatus, {} )
				local FETitleLineUpperFrame2 = function ( FETitleLineUpper, event )
					if not event.interrupted then
						FETitleLineUpper:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineUpper:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper:setTopBottom( false, false, -76, -72 )
					FETitleLineUpper:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper, event )
					else
						FETitleLineUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 1 )
				FETitleLineUpperFrame2( FETitleLineUpper, {} )
				local FETitleLineBottom0Frame2 = function ( FETitleLineBottom0, event )
					if not event.interrupted then
						FETitleLineBottom0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
					FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
					FETitleLineBottom0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineBottom0, event )
					else
						FETitleLineBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 1 )
				FETitleLineBottom0Frame2( FETitleLineBottom0, {} )
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		NoDemoSelected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 1 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 13 )

				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
					MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					if not event.interrupted then
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
					FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
					FEListSubHeaderGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow0, event )
					else
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setLeftRight( false, true, -94.5, -66 )
					LobbyStatus:setTopBottom( true, false, -6, 14 )
					LobbyStatus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				LobbyStatusFrame2( LobbyStatus, {} )
				local FETitleLineUpperFrame2 = function ( FETitleLineUpper, event )
					if not event.interrupted then
						FETitleLineUpper:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineUpper:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper:setTopBottom( false, false, -76, -72 )
					FETitleLineUpper:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper, event )
					else
						FETitleLineUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 1 )
				FETitleLineUpperFrame2( FETitleLineUpper, {} )
				local FETitleLineBottom0Frame2 = function ( FETitleLineBottom0, event )
					if not event.interrupted then
						FETitleLineBottom0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
					FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
					FETitleLineBottom0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineBottom0, event )
					else
						FETitleLineBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 1 )
				FETitleLineBottom0Frame2( FETitleLineBottom0, {} )
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		GameResult = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				MapVoteItemVoteDecided:completeAnimation()
				self.MapVoteItemVoteDecided:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )

				MapVoteItemRandom:completeAnimation()
				self.MapVoteItemRandom:setAlpha( 0 )
				self.clipFinished( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 0 )
				self.clipFinished( FRBestTime, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 0 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setLeftRight( true, false, 0, 303 )
				self.ArenaRules:setTopBottom( true, false, -63, -12 )
				self.ArenaRules:setAlpha( 0 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setLeftRight( true, false, 0, 303 )
				self.MapVoteResult:setTopBottom( true, false, 18, 177 )
				self.MapVoteResult:setAlpha( 1 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		},
		DemoSelectedFinished = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )

				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )

				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				self.clipFinished( LobbyStatus, {} )

				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setAlpha( 1 )
				self.clipFinished( FETitleLineUpper, {} )

				FETitleLineUpper0:completeAnimation()
				self.FETitleLineUpper0:setAlpha( 0 )
				self.clipFinished( FETitleLineUpper0, {} )

				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setAlpha( 1 )
				self.clipFinished( FETitleLineBottom0, {} )

				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				self.clipFinished( FRDifficulty, {} )

				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				self.clipFinished( ArenaRules, {} )

				MapVoteNoDemoSelected:completeAnimation()
				self.MapVoteNoDemoSelected:setAlpha( 0 )
				self.clipFinished( MapVoteNoDemoSelected, {} )

				MapVoteResult:completeAnimation()
				self.MapVoteResult:setAlpha( 0 )
				self.clipFinished( MapVoteResult, {} )

				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )

				DownloadPercent:completeAnimation()
				self.DownloadPercent:setAlpha( 0 )
				self.clipFinished( DownloadPercent, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 13 )

				local MapVoteItemVoteDecidedFrame2 = function ( MapVoteItemVoteDecided, event )
					if not event.interrupted then
						MapVoteItemVoteDecided:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Bounce )
						MapVoteItemVoteDecided.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Bounce )
					end
					MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
					MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
					MapVoteItemVoteDecided:setAlpha( 0 )
					MapVoteItemVoteDecided:setScale( 0.85 )
					MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemVoteDecided, event )
					else
						MapVoteItemVoteDecided:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemVoteDecided:completeAnimation()

				MapVoteItemVoteDecided.LobbyMemberBackingMask0:completeAnimation()
				self.MapVoteItemVoteDecided:setLeftRight( true, true, -27, -27 )
				self.MapVoteItemVoteDecided:setTopBottom( false, false, -81, 97 )
				self.MapVoteItemVoteDecided:setAlpha( 1 )
				self.MapVoteItemVoteDecided:setScale( 0.85 )
				self.MapVoteItemVoteDecided.LobbyMemberBackingMask0:setAlpha( 0 )
				MapVoteItemVoteDecidedFrame2( MapVoteItemVoteDecided, {} )
				local MapVoteItemRandomFrame2 = function ( MapVoteItemRandom, event )
					if not event.interrupted then
						MapVoteItemRandom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.LobbyMemberBackingMask0:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.VoteType:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						MapVoteItemRandom.voteCount:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
					MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
					MapVoteItemRandom:setAlpha( 0 )
					MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
					MapVoteItemRandom.VoteType:setAlpha( 0 )
					MapVoteItemRandom.voteCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapVoteItemRandom, event )
					else
						MapVoteItemRandom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVoteItemRandom:completeAnimation()

				MapVoteItemRandom.LobbyMemberBackingMask0:completeAnimation()

				MapVoteItemRandom.VoteType:completeAnimation()

				MapVoteItemRandom.voteCount:completeAnimation()
				self.MapVoteItemRandom:setLeftRight( true, true, 0, 0 )
				self.MapVoteItemRandom:setTopBottom( false, false, -90, 88 )
				self.MapVoteItemRandom:setAlpha( 0 )
				self.MapVoteItemRandom.LobbyMemberBackingMask0:setAlpha( 0 )
				self.MapVoteItemRandom.VoteType:setAlpha( 0 )
				self.MapVoteItemRandom.voteCount:setAlpha( 0 )
				MapVoteItemRandomFrame2( MapVoteItemRandom, {} )

				MapVoteItemPrevious:completeAnimation()
				self.MapVoteItemPrevious:setAlpha( 0 )
				self.clipFinished( MapVoteItemPrevious, {} )

				MapVoteItemNext:completeAnimation()
				self.MapVoteItemNext:setAlpha( 0 )
				self.clipFinished( MapVoteItemNext, {} )
				local FEListSubHeaderGlow0Frame2 = function ( FEListSubHeaderGlow0, event )
					if not event.interrupted then
						FEListSubHeaderGlow0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
					FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
					FEListSubHeaderGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow0, event )
					else
						FEListSubHeaderGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow0:completeAnimation()
				self.FEListSubHeaderGlow0:setLeftRight( true, true, 0, -52 )
				self.FEListSubHeaderGlow0:setTopBottom( true, false, -7, 16 )
				self.FEListSubHeaderGlow0:setAlpha( 1 )
				FEListSubHeaderGlow0Frame2( FEListSubHeaderGlow0, {} )

				MapVoting:completeAnimation()
				self.MapVoting:setAlpha( 0 )
				self.clipFinished( MapVoting, {} )
				local LobbyStatusFrame2 = function ( LobbyStatus, event )
					if not event.interrupted then
						LobbyStatus:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					LobbyStatus:setLeftRight( false, true, -94.5, -66 )
					LobbyStatus:setTopBottom( true, false, -6, 14 )
					LobbyStatus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyStatus, event )
					else
						LobbyStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyStatus:completeAnimation()
				self.LobbyStatus:setLeftRight( false, true, -94.5, -66 )
				self.LobbyStatus:setTopBottom( true, false, -6, 14 )
				self.LobbyStatus:setAlpha( 1 )
				LobbyStatusFrame2( LobbyStatus, {} )
				local FETitleLineUpperFrame2 = function ( FETitleLineUpper, event )
					if not event.interrupted then
						FETitleLineUpper:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineUpper:setLeftRight( true, true, 0, -53 )
					FETitleLineUpper:setTopBottom( false, false, -76, -72 )
					FETitleLineUpper:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineUpper, event )
					else
						FETitleLineUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineUpper:completeAnimation()
				self.FETitleLineUpper:setLeftRight( true, true, 0, -53 )
				self.FETitleLineUpper:setTopBottom( false, false, -76, -72 )
				self.FETitleLineUpper:setAlpha( 1 )
				FETitleLineUpperFrame2( FETitleLineUpper, {} )
				local FETitleLineBottom0Frame2 = function ( FETitleLineBottom0, event )
					if not event.interrupted then
						FETitleLineBottom0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
					FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
					FETitleLineBottom0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FETitleLineBottom0, event )
					else
						FETitleLineBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FETitleLineBottom0:completeAnimation()
				self.FETitleLineBottom0:setLeftRight( true, true, 0, -53 )
				self.FETitleLineBottom0:setTopBottom( false, false, 87, 91 )
				self.FETitleLineBottom0:setAlpha( 1 )
				FETitleLineBottom0Frame2( FETitleLineBottom0, {} )
				local FRBestTimeFrame2 = function ( FRBestTime, event )
					if not event.interrupted then
						FRBestTime:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					FRBestTime:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRBestTime, event )
					else
						FRBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRBestTime:completeAnimation()
				self.FRBestTime:setAlpha( 1 )
				FRBestTimeFrame2( FRBestTime, {} )
				local FRDifficultyFrame2 = function ( FRDifficulty, event )
					if not event.interrupted then
						FRDifficulty:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					FRDifficulty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDifficulty, event )
					else
						FRDifficulty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDifficulty:completeAnimation()
				self.FRDifficulty:setAlpha( 1 )
				FRDifficultyFrame2( FRDifficulty, {} )
				local ArenaRulesFrame2 = function ( ArenaRules, event )
					if not event.interrupted then
						ArenaRules:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ArenaRules:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaRules, event )
					else
						ArenaRules:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaRules:completeAnimation()
				self.ArenaRules:setAlpha( 1 )
				ArenaRulesFrame2( ArenaRules, {} )

				MapVoteOfficial:completeAnimation()
				self.MapVoteOfficial:setAlpha( 0 )
				self.clipFinished( MapVoteOfficial, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CPHidden",
			condition = function ( menu, element, event )
				return IsCPMapVoteHidden( controller )
			end
		},
		{
			stateName = "MPHidden",
			condition = function ( menu, element, event )
				return IsMPMapVoteHidden( controller )
			end
		},
		{
			stateName = "ZMHidden",
			condition = function ( menu, element, event )
				return IsZMMapVoteHidden( controller )
			end
		},
		{
			stateName = "MapVote",
			condition = function ( menu, element, event )
				return MapVoteInState( "1" ) and not IsInTheaterMode()
			end
		},
		{
			stateName = "SelectedMap",
			condition = function ( menu, element, event )
				return MapVoteInState( "2" ) and not IsInTheaterMode()
			end
		},
		{
			stateName = "MapVoteChosenNext",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "MapVoteChosenPrevious",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "MapVoteChosenRandom",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DemoSelectedDownloading",
			condition = function ( menu, element, event )
				local f242_local0 = IsInTheaterMode()
				if f242_local0 then
					f242_local0 = IsFilmSelected()
					if f242_local0 then
						f242_local0 = not IsGlobalModelValueGreaterThan( controller, "lobbyRoot.theaterDownloadPercent", 99 )
					end
				end
				return f242_local0
			end
		},
		{
			stateName = "NoDemoSelected",
			condition = function ( menu, element, event )
				return IsInTheaterMode() and not IsFilmSelected()
			end
		},
		{
			stateName = "GameResult",
			condition = function ( menu, element, event )
				return MapVoteInState( "3" ) and not IsInTheaterMode()
			end
		},
		{
			stateName = "DemoSelectedFinished",
			condition = function ( menu, element, event )
				local f245_local0 = IsInTheaterMode()
				if f245_local0 then
					f245_local0 = IsFilmSelected()
					if f245_local0 then
						f245_local0 = IsGlobalModelValueGreaterThan( controller, "lobbyRoot.theaterDownloadPercent", 99 )
					end
				end
				return f245_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.mapVote"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.theaterDataDownloaded"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.theaterDownloadPercent"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsInDefaultState( element ) then
			DisableMouseButton( self, controller )
		else
			EnableMouseButton( self, controller )
		end
	end )
	MapVoteItemVoteDecided.id = "MapVoteItemVoteDecided"
	MapVoteItemRandom.id = "MapVoteItemRandom"
	MapVoteItemPrevious.id = "MapVoteItemPrevious"
	MapVoteItemNext.id = "MapVoteItemNext"
	ArenaRules.id = "ArenaRules"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.MapVoteItemVoteDecided:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MapVoteItemVoteDecided:close()
		element.MapVoteItemRandom:close()
		element.MapVoteItemPrevious:close()
		element.MapVoteItemNext:close()
		element.FEListSubHeaderGlow0:close()
		element.FETitleLineUpper:close()
		element.FETitleLineUpper0:close()
		element.FETitleLineBottom0:close()
		element.FRBestTime:close()
		element.FRDifficulty:close()
		element.ArenaRules:close()
		element.MapVoteNoDemoSelected:close()
		element.MapVoteResult:close()
		element.FileshareSpinner:close()
		element.MapVoteOfficial:close()
		element.ZMLobbyEEList:close()
		element.LobbyStatus:close()
		element.DownloadPercent:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
