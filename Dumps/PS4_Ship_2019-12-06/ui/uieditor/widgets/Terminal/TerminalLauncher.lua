require( "ui.uieditor.widgets.Terminal.Health" )
require( "ui.uieditor.widgets.Terminal.MusicPlayerApplet" )
require( "ui.uieditor.widgets.Terminal.WeatherApplet" )
require( "ui.uieditor.widgets.Terminal.CodexApplet" )
require( "ui.uieditor.menus.InGame.PersonalDataVault.Omnipedia" )
require( "ui.uieditor.widgets.Terminal.WeaponsApplet" )
require( "ui.uieditor.menus.InGame.PersonalDataVault.Weapons" )
require( "ui.uieditor.widgets.Terminal.GalleryApplet" )
require( "ui.uieditor.menus.InGame.PersonalDataVault.GalleryViewer" )
require( "ui.uieditor.widgets.Terminal.VideoPlayerApplet" )
require( "ui.uieditor.menus.InGame.PersonalDataVault.VideoPlayer" )
require( "ui.uieditor.widgets.Terminal.EmblemImageButton" )
require( "ui.uieditor.widgets.Terminal.SecretLogo" )
require( "ui.uieditor.menus.InGame.PersonalDataVault.MyFiles" )
require( "ui.uieditor.widgets.Terminal.ClanTagImageButton" )
require( "ui.uieditor.widgets.Terminal.CallingCardImageButton" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "CallingCardsIdentity.DataDownloaded" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "CallingCardsIdentity.GetPublicProfileComplete" )
end

local PostLoadFunc = function ( self, controller, menu )
	self.FilesApplet.cheatstate = 0
	self.DoNavigationForGamePadButton = function ( f3_arg0, f3_arg1 )
		
	end
	
	self.DigitalClock:setText( Engine.SystemTime() )
	self:registerEventHandler( "DigitalClockTick", function ( element )
		self.DigitalClock:setText( Engine.SystemTime() )
	end )
	self.ClockTimer = LUI.UITimer.new( 1000, {
		name = "DigitalClockTick"
	}, false )
	self:addElement( self.ClockTimer )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if self.FilesApplet:isInFocus() and self.FilesApplet.cheatstate == 0 then
			self.FilesApplet.cheatstate = 1
		else
			self.FilesApplet.cheatstate = 0
		end
		return true
	end, function ( element, menu, controller )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_DataVaultClosed( self, controller )
		PlaySoundSetSound( self, "menu_go_back" )
		return true
	end, function ( element, menu, controller )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if self.FilesApplet:isInFocus() and self.FilesApplet.cheatstate == 1 then
			self.FilesApplet.cheatstate = 2
		else
			self.FilesApplet.cheatstate = 0
		end
		return true
	end, function ( element, menu, controller )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		self.FilesApplet.cheatstate = 0
		return true
	end, function ( element, menu, controller )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		if self.FilesApplet:isInFocus() and self.FilesApplet.cheatstate == 2 then
			self.FilesApplet.cheatstate = 0
			if not CoD.MenuNavigation then
				CoD.MenuNavigation = {}
			end
			if not CoD.MenuNavigation[controller] then
				CoD.MenuNavigation[controller] = {}
			end
			table.insert( CoD.MenuNavigation[controller], {
				"NumericKeypad"
			} )
			local f13_local0 = self
			while f13_local0 and not f13_local0.openMenu do
				f13_local0 = f13_local0:getParent()
			end
			local f13_local1 = f13_local0:openPopup( "NumericKeypad", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		self.ClockTimer:close()
	end )
end

CoD.TerminalLauncher = InheritFrom( LUI.UIElement )
CoD.TerminalLauncher.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TerminalLauncher )
	self.id = "TerminalLauncher"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 900 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, 0, 0 )
	blackleftBG:setTopBottom( false, true, -600, 0 )
	blackleftBG:setRGB( 0, 0, 0 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local HealthApplet = CoD.Health.new( menu, controller )
	HealthApplet:setLeftRight( false, true, -234, -12 )
	HealthApplet:setTopBottom( true, false, 164, 336 )
	HealthApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_HEALTH_CAPS" ) )
	HealthApplet.EKGStable:setShaderVector( 0, 4.76, 7.22, 4, 0.6 )
	HealthApplet.EKGStable:setShaderVector( 1, 1.01, 2, -0.32, 0 )
	HealthApplet.EKGStable0:setShaderVector( 0, 1.33, 7.57, 1.58, 0.6 )
	HealthApplet.EKGStable0:setShaderVector( 1, 1.01, 2, -0.32, 0 )
	HealthApplet.EKGStable00:setShaderVector( 0, 1.4, 8.03, 1.86, 0.48 )
	HealthApplet.EKGStable00:setShaderVector( 1, 0.29, 1.74, -0.32, 0 )
	self:addElement( HealthApplet )
	self.HealthApplet = HealthApplet
	
	local MusicPlayer = CoD.MusicPlayerApplet.new( menu, controller )
	MusicPlayer:setLeftRight( true, false, 15, 224 )
	MusicPlayer:setTopBottom( true, false, 370, 442 )
	MusicPlayer.FocusWidget.Name:setText( Engine.Localize( "MENU_MUSICPLAYER_CAPS" ) )
	MusicPlayer:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
		return f17_local0
	end )
	MusicPlayer:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	menu:AddButtonCallbackFunction( MusicPlayer, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SendMenuResponse( self, "PersonalDataVaultMenu", "musicTrackPlay", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUSICPLAYER_PLAY" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( MusicPlayer, controller, Enum.LUIButton.LUI_KEY_LB, "+actionslot 1", function ( element, menu, controller, model )
		SendMenuResponse( self, "PersonalDataVaultMenu", "musicTrackBack", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "MENU_MUSICPLAYER_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( MusicPlayer, controller, Enum.LUIButton.LUI_KEY_RB, "+actionslot 2", function ( element, menu, controller, model )
		SendMenuResponse( self, "PersonalDataVaultMenu", "musicTrackNext", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	self:addElement( MusicPlayer )
	self.MusicPlayer = MusicPlayer
	
	local WeatherApplet = CoD.WeatherApplet.new( menu, controller )
	WeatherApplet:setLeftRight( false, true, -234, -12 )
	WeatherApplet:setTopBottom( true, false, 33, 136 )
	WeatherApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_WEATHER_CAPS" ) )
	self:addElement( WeatherApplet )
	self.WeatherApplet = WeatherApplet
	
	local OmnipediaApplet = CoD.CodexApplet.new( menu, controller )
	OmnipediaApplet:setLeftRight( false, false, -210, 198 )
	OmnipediaApplet:setTopBottom( true, false, 33, 336 )
	OmnipediaApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_CODEX_CAPS" ) )
	OmnipediaApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f25_local0 = nil
		if element.gainFocus then
			f25_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f25_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f25_local0
	end )
	OmnipediaApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f26_local0 = nil
		if element.loseFocus then
			f26_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f26_local0 = element.super:loseFocus( event )
		end
		return f26_local0
	end )
	menu:AddButtonCallbackFunction( OmnipediaApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "Omnipedia", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( OmnipediaApplet )
	self.OmnipediaApplet = OmnipediaApplet
	
	local WeaponsApplet = CoD.WeaponsApplet.new( menu, controller )
	WeaponsApplet:setLeftRight( false, true, -342, -11 )
	WeaponsApplet:setTopBottom( false, true, -230, -54 )
	WeaponsApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	WeaponsApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f29_local0 = nil
		if element.gainFocus then
			f29_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f29_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f29_local0
	end )
	WeaponsApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f30_local0 = nil
		if element.loseFocus then
			f30_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f30_local0 = element.super:loseFocus( event )
		end
		return f30_local0
	end )
	menu:AddButtonCallbackFunction( WeaponsApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "Weapons", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( WeaponsApplet )
	self.WeaponsApplet = WeaponsApplet
	
	local PersonalLogApplet = CoD.GalleryApplet.new( menu, controller )
	PersonalLogApplet:setLeftRight( true, false, 240, 543 )
	PersonalLogApplet:setTopBottom( true, false, 370, 546 )
	PersonalLogApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_GALLERY_CAPS" ) )
	PersonalLogApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f33_local0 = nil
		if element.gainFocus then
			f33_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f33_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f33_local0
	end )
	PersonalLogApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f34_local0 = nil
		if element.loseFocus then
			f34_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f34_local0 = element.super:loseFocus( event )
		end
		return f34_local0
	end )
	menu:AddButtonCallbackFunction( PersonalLogApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "GalleryViewer", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( PersonalLogApplet )
	self.PersonalLogApplet = PersonalLogApplet
	
	local VideoPlayer = CoD.VideoPlayerApplet.new( menu, controller )
	VideoPlayer:setLeftRight( true, false, 15, 224 )
	VideoPlayer:setTopBottom( true, false, 482, 545 )
	VideoPlayer.FocusWidget.Name:setText( Engine.Localize( "MENU_VIDEOPLAYER_CAPS" ) )
	VideoPlayer:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f37_local0
	end )
	VideoPlayer:registerEventHandler( "lose_focus", function ( element, event )
		local f38_local0 = nil
		if element.loseFocus then
			f38_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f38_local0 = element.super:loseFocus( event )
		end
		return f38_local0
	end )
	menu:AddButtonCallbackFunction( VideoPlayer, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "VideoPlayer", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( VideoPlayer )
	self.VideoPlayer = VideoPlayer
	
	local DataVault = LUI.UITightText.new()
	DataVault:setLeftRight( true, false, 84.92, 165.92 )
	DataVault:setTopBottom( true, false, 62.75, 86.75 )
	DataVault:setText( Engine.Localize( "MENU_DATA_VAULT_CAPS" ) )
	DataVault:setTTF( "fonts/escom.ttf" )
	self:addElement( DataVault )
	self.DataVault = DataVault
	
	local Coalescence = LUI.UITightText.new()
	Coalescence:setLeftRight( true, false, 84.92, 207.92 )
	Coalescence:setTopBottom( true, false, 51, 61 )
	Coalescence:setAlpha( 0.75 )
	Coalescence:setText( Engine.Localize( "MENU_COALESCENCE_CAPS" ) )
	Coalescence:setTTF( "fonts/escom.ttf" )
	self:addElement( Coalescence )
	self.Coalescence = Coalescence
	
	local DigitalClock = LUI.UIText.new()
	DigitalClock:setLeftRight( true, false, 84.92, 183.32 )
	DigitalClock:setTopBottom( true, false, 105.76, 125.76 )
	DigitalClock:setRGB( 0.95, 0.37, 0.13 )
	DigitalClock:setText( Engine.Localize( "08:10:33:24" ) )
	DigitalClock:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DigitalClock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DigitalClock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DigitalClock )
	self.DigitalClock = DigitalClock
	
	local Toprightlines = LUI.UIImage.new()
	Toprightlines:setLeftRight( true, false, 12.08, 230.2 )
	Toprightlines:setTopBottom( true, false, 28, 131 )
	Toprightlines:setImage( RegisterImage( "uie_t7_menu_cp_datavault_toprightlines" ) )
	self:addElement( Toprightlines )
	self.Toprightlines = Toprightlines
	
	local EmblemApplet = CoD.EmblemImageButton.new( menu, controller )
	EmblemApplet:setLeftRight( true, false, 14, 116 )
	EmblemApplet:setTopBottom( true, false, 175, 238 )
	EmblemApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	EmblemApplet:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f41_local0 = EmblemApplet
		local f41_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f41_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemApplet:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f42_local0 = EmblemApplet
		local f42_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f42_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f43_local0 = nil
		if element.gainFocus then
			f43_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f43_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f43_local0
	end )
	EmblemApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f44_local0 = nil
		if element.loseFocus then
			f44_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f44_local0 = element.super:loseFocus( event )
		end
		return f44_local0
	end )
	menu:AddButtonCallbackFunction( EmblemApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if Emblems_IsEnabled( element, controller ) and IsLive() and not IsDataVaultEmblemButtonDisabled( controller ) then
			OpenEmblemSelect( self, element, controller, Enum.StorageFileType.STORAGE_EMBLEMS, menu )
			return true
		elseif Emblems_IsEnabled( element, controller ) and not IsLive() and not IsDataVaultEmblemButtonDisabled( controller ) then
			OpenEmblemSelect( self, element, controller, Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		if Emblems_IsEnabled( element, controller ) and IsLive() and not IsDataVaultEmblemButtonDisabled( controller ) then
			return false
		elseif Emblems_IsEnabled( element, controller ) and not IsLive() and not IsDataVaultEmblemButtonDisabled( controller ) then
			return false
		else
			return false
		end
	end, false )
	EmblemApplet:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDataVaultEmblemButtonDisabled( controller )
			end
		}
	} )
	self:addElement( EmblemApplet )
	self.EmblemApplet = EmblemApplet
	
	local FilesApplet = CoD.SecretLogo.new( menu, controller )
	FilesApplet:setLeftRight( true, false, 22, 68 )
	FilesApplet:setTopBottom( true, false, 45, 90.8 )
	FilesApplet:registerEventHandler( "on_session_start", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FilesApplet:registerEventHandler( "on_session_end", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FilesApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f50_local0 = nil
		if element.gainFocus then
			f50_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f50_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f50_local0
	end )
	FilesApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f51_local0 = nil
		if element.loseFocus then
			f51_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f51_local0 = element.super:loseFocus( event )
		end
		return f51_local0
	end )
	menu:AddButtonCallbackFunction( FilesApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsLobbyHost() then
			NavigateToMenu( self, "MyFiles", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsLobbyHost() then
			return true
		else
			return false
		end
	end, false )
	self:addElement( FilesApplet )
	self.FilesApplet = FilesApplet
	
	local ClanTagApplet = CoD.ClanTagImageButton.new( menu, controller )
	ClanTagApplet:setLeftRight( true, false, 121.14, 224 )
	ClanTagApplet:setTopBottom( true, false, 175, 238 )
	ClanTagApplet.FocusWidget.Name:setText( Engine.Localize( "MPUI_CLAN_TAG_CAPS" ) )
	ClanTagApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f54_local0 = nil
		if element.gainFocus then
			f54_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f54_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f54_local0
	end )
	ClanTagApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f55_local0 = nil
		if element.loseFocus then
			f55_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f55_local0 = element.super:loseFocus( event )
		end
		return f55_local0
	end )
	menu:AddButtonCallbackFunction( ClanTagApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		EditClanTag( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ClanTagApplet )
	self.ClanTagApplet = ClanTagApplet
	
	local CallingCardApplet = CoD.CallingCardImageButton.new( menu, controller )
	CallingCardApplet:setLeftRight( true, false, 12.08, 224 )
	CallingCardApplet:setTopBottom( true, false, 272, 336 )
	CallingCardApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	CallingCardApplet:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CallingCardsIdentity.DataDownloaded" ), function ( model )
		local f58_local0 = CallingCardApplet
		local f58_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CallingCardsIdentity.DataDownloaded"
		}
		CoD.Menu.UpdateButtonShownState( f58_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f59_local0 = nil
		if element.gainFocus then
			f59_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f59_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f59_local0
	end )
	CallingCardApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f60_local0 = nil
		if element.loseFocus then
			f60_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f60_local0 = element.super:loseFocus( event )
		end
		return f60_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if CallingCards_IsEnabled( element, controller ) then
			OpenCallingCards( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		if CallingCards_IsEnabled( element, controller ) then
			return false
		else
			return false
		end
	end, false )
	self:addElement( CallingCardApplet )
	self.CallingCardApplet = CallingCardApplet
	
	MusicPlayer.navigation = {
		up = CallingCardApplet,
		right = PersonalLogApplet,
		down = VideoPlayer
	}
	OmnipediaApplet.navigation = {
		left = {
			ClanTagApplet,
			CallingCardApplet
		},
		down = {
			PersonalLogApplet,
			WeaponsApplet
		}
	}
	WeaponsApplet.navigation = {
		left = PersonalLogApplet,
		up = OmnipediaApplet
	}
	PersonalLogApplet.navigation = {
		left = {
			MusicPlayer,
			VideoPlayer
		},
		up = OmnipediaApplet,
		right = WeaponsApplet
	}
	VideoPlayer.navigation = {
		up = MusicPlayer,
		right = PersonalLogApplet
	}
	EmblemApplet.navigation = {
		up = FilesApplet,
		right = ClanTagApplet,
		down = CallingCardApplet
	}
	FilesApplet.navigation = {
		right = OmnipediaApplet,
		down = EmblemApplet
	}
	ClanTagApplet.navigation = {
		left = EmblemApplet,
		right = OmnipediaApplet,
		down = CallingCardApplet
	}
	CallingCardApplet.navigation = {
		up = {
			EmblemApplet,
			ClanTagApplet
		},
		right = OmnipediaApplet,
		down = MusicPlayer
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	MusicPlayer.id = "MusicPlayer"
	OmnipediaApplet.id = "OmnipediaApplet"
	WeaponsApplet.id = "WeaponsApplet"
	PersonalLogApplet.id = "PersonalLogApplet"
	VideoPlayer.id = "VideoPlayer"
	EmblemApplet.id = "EmblemApplet"
	FilesApplet.id = "FilesApplet"
	ClanTagApplet.id = "ClanTagApplet"
	CallingCardApplet.id = "CallingCardApplet"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.OmnipediaApplet:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HealthApplet:close()
		element.MusicPlayer:close()
		element.WeatherApplet:close()
		element.OmnipediaApplet:close()
		element.WeaponsApplet:close()
		element.PersonalLogApplet:close()
		element.VideoPlayer:close()
		element.EmblemApplet:close()
		element.FilesApplet:close()
		element.ClanTagApplet:close()
		element.CallingCardApplet:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

