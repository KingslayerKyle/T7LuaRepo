-- 141064e2cc388213552f176132fc8053
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.backgrounds.MP_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.Lobby.LANServerBrowser.LANServerBrowserDetails" )
require( "ui.uieditor.widgets.Lobby.LocalServerRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if CoD.isPC and Dvar.ui_execdemo_gamescom:get() then
		f1_arg0.Title:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
		f1_arg0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
	end
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f1_arg0, f1_arg1 )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:setPriority( -100 )
	f1_arg0:addElement( self )
end

LUI.createMenu.LobbyServerBrowserOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyServerBrowserOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local MPBackground = CoD.MP_Background.new( f2_local1, controller )
	MPBackground:setLeftRight( true, false, 0, 1280 )
	MPBackground:setTopBottom( true, false, 0, 720 )
	self:addElement( MPBackground )
	self.MPBackground = MPBackground
	
	local FETabIdle0 = CoD.FE_TabIdle.new( f2_local1, controller )
	FETabIdle0:setLeftRight( true, true, -3, 1277 )
	FETabIdle0:setTopBottom( true, false, 82.5, 124.5 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local LANServerBrowserDetails = CoD.LANServerBrowserDetails.new( f2_local1, controller )
	LANServerBrowserDetails:setLeftRight( true, false, 770.5, 1216.5 )
	LANServerBrowserDetails:setTopBottom( true, false, 138, 684 )
	LANServerBrowserDetails:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsLANServerBrowserEmpty()
			end
		}
	} )
	LANServerBrowserDetails:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot.count" ), function ( model )
		f2_local1:updateElementState( LANServerBrowserDetails, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverListRoot.count"
		} )
	end )
	self:addElement( LANServerBrowserDetails )
	self.LANServerBrowserDetails = LANServerBrowserDetails
	
	local Servers = LUI.UIList.new( f2_local1, controller, 4, 0, nil, false, false, 0, 0, false, false )
	Servers:makeFocusable()
	Servers:setLeftRight( true, false, 64, 754 )
	Servers:setTopBottom( true, false, 148, 608 )
	Servers:setWidgetType( CoD.LocalServerRow )
	Servers:setVerticalCount( 16 )
	Servers:setSpacing( 4 )
	Servers:setVerticalCounter( CoD.verticalCounter )
	Servers:setDataSource( "LocalServer" )
	Servers:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		LobbyLANServerPlayerListRefresh( self, element, controller )
		return f5_local0
	end )
	Servers:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	Servers:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	f2_local1:AddButtonCallbackFunction( Servers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		JoinSystemLinkServer( self, f8_arg0, f8_arg2 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Servers )
	self.Servers = Servers
	
	local StatusTextBox = LUI.UIText.new()
	StatusTextBox:setLeftRight( true, true, 616.75, -526 )
	StatusTextBox:setTopBottom( true, false, 93.5, 117.5 )
	StatusTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	StatusTextBox:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	StatusTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatusTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StatusTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatusTextBox )
	self.StatusTextBox = StatusTextBox
	
	local GameTypeTextBox = LUI.UIText.new()
	GameTypeTextBox:setLeftRight( true, true, 432, -674 )
	GameTypeTextBox:setTopBottom( true, false, 94.5, 118.5 )
	GameTypeTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	GameTypeTextBox:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	GameTypeTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTypeTextBox )
	self.GameTypeTextBox = GameTypeTextBox
	
	local PlayerCountText = LUI.UIText.new()
	PlayerCountText:setLeftRight( true, true, 336, -848 )
	PlayerCountText:setTopBottom( true, false, 95, 118.5 )
	PlayerCountText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	PlayerCountText:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	PlayerCountText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PlayerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayerCountText )
	self.PlayerCountText = PlayerCountText
	
	local HostNameText = LUI.UIText.new()
	HostNameText:setLeftRight( true, true, 75, -966 )
	HostNameText:setTopBottom( true, false, 94.5, 118.5 )
	HostNameText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	HostNameText:setText( Engine.Localize( "MENU_HOST_CAPS" ) )
	HostNameText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HostNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HostNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HostNameText )
	self.HostNameText = HostNameText
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, -192, 64 )
	Title:setTopBottom( true, false, -183, -129 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 95, 712.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local DetailsTextBox = LUI.UIText.new()
	DetailsTextBox:setLeftRight( true, true, 775, -69 )
	DetailsTextBox:setTopBottom( true, false, 93.5, 117.5 )
	DetailsTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	DetailsTextBox:setText( Engine.Localize( "MENU_DETAILS_CAPS" ) )
	DetailsTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DetailsTextBox )
	self.DetailsTextBox = DetailsTextBox
	
	local MenuFrame = CoD.GenericMenuFrame.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			LANServerBrowserDetails.MapImage:setImage( RegisterImage( MapNameToMapImage( mapName ) ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "gameType", true, function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			LANServerBrowserDetails.GameType:setText( GameTypeToLocalizedGameType( gameType ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			LANServerBrowserDetails.MapName:setText( MapNameToLocalizedMapName( mapName ) )
		end
	end )
	LANServerBrowserDetails.navigation = {
		left = Servers
	}
	Servers.navigation = {
		right = LANServerBrowserDetails
	}
	self:registerEventHandler( "filter_mode_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		SetLobbyServerBrowserFilterForE3( self, element, controller )
		RefreshServerList( self, controller )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		GoBack( self, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		RefreshServerList( self, f17_arg2 )
		PlaySoundSetSound( self, "partyease_slide_right" )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REFRESH" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Y", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if LANServerBrowserCheckFilterTest( f19_arg1, "all" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, f19_arg2 )
			RefreshServerList( self, f19_arg2 )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( f19_arg1, "cp" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, f19_arg2 )
			RefreshServerList( self, f19_arg2 )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( f19_arg1, "mp" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, f19_arg2 )
			RefreshServerList( self, f19_arg2 )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( f19_arg1, "zm" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, f19_arg2 )
			RefreshServerList( self, f19_arg2 )
			PlaySoundSetSound( self, "toggle" )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if LANServerBrowserCheckFilterTest( f20_arg1, "all" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_ALL" )
			return true
		elseif LANServerBrowserCheckFilterTest( f20_arg1, "cp" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_CAMPAIGN" )
			return true
		elseif LANServerBrowserCheckFilterTest( f20_arg1, "mp" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_MULTIPLAYER" )
			return true
		elseif LANServerBrowserCheckFilterTest( f20_arg1, "zm" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_ZOMBIES" )
			return true
		else
			return false
		end
	end, false )
	LANServerBrowserDetails.id = "LANServerBrowserDetails"
	Servers.id = "Servers"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.Servers:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MPBackground:close()
		element.FETabIdle0:close()
		element.LANServerBrowserDetails:close()
		element.Servers:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

