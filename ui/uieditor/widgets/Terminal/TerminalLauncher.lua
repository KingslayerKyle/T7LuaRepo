-- 8a278e7980e26739fcdd912e44d51017
-- This hash is used for caching, delete to decompile the file again

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

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	CoD.PCUtil.SetupFakeMouse( f2_arg0, f2_arg2, f2_arg1 )
	f2_arg2:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_LB, "+actionslot 1", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		SendMenuResponse( f2_arg0, "PersonalDataVaultMenu", "musicTrackBack", f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_LB, "MENU_MUSICPLAYER_BACK" )
		return true
	end, false )
	f2_arg2:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_RB, "+actionslot 2", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		SendMenuResponse( f2_arg0, "PersonalDataVaultMenu", "musicTrackNext", f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
end

local PostLoadFunc = function ( self, controller, menu )
	self.FilesApplet.cheatstate = 0
	self.DoNavigationForGamePadButton = function ( f8_arg0, f8_arg1 )
		
	end
	
	self.DigitalClock:setText( Engine.SystemTime() )
	self:registerEventHandler( "DigitalClockTick", function ( element )
		self.DigitalClock:setText( Engine.SystemTime() )
	end )
	self.ClockTimer = LUI.UITimer.new( 1000, {
		name = "DigitalClockTick"
	}, false )
	self:addElement( self.ClockTimer )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if self.FilesApplet:isInFocus() and self.FilesApplet.cheatstate == 0 then
			self.FilesApplet.cheatstate = 1
		else
			self.FilesApplet.cheatstate = 0
		end
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		PDV_DataVaultClosed( self, f12_arg2 )
		PlaySoundSetSound( self, "menu_go_back" )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if self.FilesApplet:isInFocus() and self.FilesApplet.cheatstate == 1 then
			self.FilesApplet.cheatstate = 2
		else
			self.FilesApplet.cheatstate = 0
		end
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		self.FilesApplet.cheatstate = 0
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if self.FilesApplet:isInFocus() and self.FilesApplet.cheatstate == 2 then
			self.FilesApplet.cheatstate = 0
			if not CoD.MenuNavigation then
				CoD.MenuNavigation = {}
			end
			if not CoD.MenuNavigation[f18_arg2] then
				CoD.MenuNavigation[f18_arg2] = {}
			end
			table.insert( CoD.MenuNavigation[f18_arg2], {
				"NumericKeypad"
			} )
			local f18_local0 = self
			while f18_local0 and not f18_local0.openMenu do
				f18_local0 = f18_local0:getParent()
			end
			local f18_local1 = f18_local0:openPopup( "NumericKeypad", f18_arg2 )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		return false
	end, false )

	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		self.ClockTimer:close()
	end )
	if CoD.isPC then
		f0_local1( self, controller, menu )
	end
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
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
		return f22_local0
	end )
	MusicPlayer:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	menu:AddButtonCallbackFunction( MusicPlayer, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		SendMenuResponse( self, "PersonalDataVaultMenu", "musicTrackPlay", f24_arg2 )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUSICPLAYER_PLAY" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( MusicPlayer, controller, Enum.LUIButton.LUI_KEY_LB, "+actionslot 1", function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		SendMenuResponse( self, "PersonalDataVaultMenu", "musicTrackBack", f26_arg2 )
		return true
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_LB, "MENU_MUSICPLAYER_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( MusicPlayer, controller, Enum.LUIButton.LUI_KEY_RB, "+actionslot 2", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		SendMenuResponse( self, "PersonalDataVaultMenu", "musicTrackNext", f28_arg2 )
		return true
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
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
		local f30_local0 = nil
		if element.gainFocus then
			f30_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f30_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f30_local0
	end )
	OmnipediaApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f31_local0 = nil
		if element.loseFocus then
			f31_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f31_local0 = element.super:loseFocus( event )
		end
		return f31_local0
	end )
	menu:AddButtonCallbackFunction( OmnipediaApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		NavigateToMenu( self, "Omnipedia", true, f32_arg2 )
		return true
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( OmnipediaApplet )
	self.OmnipediaApplet = OmnipediaApplet
	
	local WeaponsApplet = CoD.WeaponsApplet.new( menu, controller )
	WeaponsApplet:setLeftRight( false, true, -342, -11 )
	WeaponsApplet:setTopBottom( false, true, -230, -54 )
	WeaponsApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	WeaponsApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	WeaponsApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	menu:AddButtonCallbackFunction( WeaponsApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		NavigateToMenu( self, "Weapons", true, f36_arg2 )
		return true
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( WeaponsApplet )
	self.WeaponsApplet = WeaponsApplet
	
	local PersonalLogApplet = CoD.GalleryApplet.new( menu, controller )
	PersonalLogApplet:setLeftRight( true, false, 240, 543 )
	PersonalLogApplet:setTopBottom( true, false, 370, 546 )
	PersonalLogApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_GALLERY_CAPS" ) )
	PersonalLogApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f38_local0 = nil
		if element.gainFocus then
			f38_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f38_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f38_local0
	end )
	PersonalLogApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f39_local0 = nil
		if element.loseFocus then
			f39_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f39_local0 = element.super:loseFocus( event )
		end
		return f39_local0
	end )
	menu:AddButtonCallbackFunction( PersonalLogApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
		NavigateToMenu( self, "GalleryViewer", true, f40_arg2 )
		return true
	end, function ( f41_arg0, f41_arg1, f41_arg2 )
		CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( PersonalLogApplet )
	self.PersonalLogApplet = PersonalLogApplet
	
	local VideoPlayer = CoD.VideoPlayerApplet.new( menu, controller )
	VideoPlayer:setLeftRight( true, false, 15, 224 )
	VideoPlayer:setTopBottom( true, false, 482, 545 )
	VideoPlayer.FocusWidget.Name:setText( Engine.Localize( "MENU_VIDEOPLAYER_CAPS" ) )
	VideoPlayer:registerEventHandler( "gain_focus", function ( element, event )
		local f42_local0 = nil
		if element.gainFocus then
			f42_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f42_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f42_local0
	end )
	VideoPlayer:registerEventHandler( "lose_focus", function ( element, event )
		local f43_local0 = nil
		if element.loseFocus then
			f43_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f43_local0 = element.super:loseFocus( event )
		end
		return f43_local0
	end )
	menu:AddButtonCallbackFunction( VideoPlayer, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		NavigateToMenu( self, "VideoPlayer", true, f44_arg2 )
		return true
	end, function ( f45_arg0, f45_arg1, f45_arg2 )
		CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local f46_local0 = EmblemApplet
		local f46_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f46_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemApplet:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f47_local0 = EmblemApplet
		local f47_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f47_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f48_local0 = nil
		if element.gainFocus then
			f48_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f48_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f48_local0
	end )
	EmblemApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f49_local0 = nil
		if element.loseFocus then
			f49_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f49_local0 = element.super:loseFocus( event )
		end
		return f49_local0
	end )
	menu:AddButtonCallbackFunction( EmblemApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
		if Emblems_IsEnabled( f50_arg0, f50_arg2 ) and IsLive() and not IsDataVaultEmblemButtonDisabled( f50_arg2 ) then
			OpenEmblemSelect( self, f50_arg0, f50_arg2, Enum.StorageFileType.STORAGE_EMBLEMS, f50_arg1 )
			return true
		elseif Emblems_IsEnabled( f50_arg0, f50_arg2 ) and not IsLive() and not IsDataVaultEmblemButtonDisabled( f50_arg2 ) then
			OpenEmblemSelect( self, f50_arg0, f50_arg2, Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS, f50_arg1 )
			return true
		else
			
		end
	end, function ( f51_arg0, f51_arg1, f51_arg2 )
		CoD.Menu.SetButtonLabel( f51_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		if Emblems_IsEnabled( f51_arg0, f51_arg2 ) and IsLive() and not IsDataVaultEmblemButtonDisabled( f51_arg2 ) then
			return false
		elseif Emblems_IsEnabled( f51_arg0, f51_arg2 ) and not IsLive() and not IsDataVaultEmblemButtonDisabled( f51_arg2 ) then
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
		local f55_local0 = nil
		if element.gainFocus then
			f55_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f55_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f55_local0
	end )
	FilesApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f56_local0 = nil
		if element.loseFocus then
			f56_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f56_local0 = element.super:loseFocus( event )
		end
		return f56_local0
	end )
	menu:AddButtonCallbackFunction( FilesApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		if IsLobbyHost() then
			NavigateToMenu( self, "MyFiles", true, f57_arg2 )
			return true
		else
			
		end
	end, function ( f58_arg0, f58_arg1, f58_arg2 )
		CoD.Menu.SetButtonLabel( f58_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local f59_local0 = nil
		if element.gainFocus then
			f59_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f59_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f59_local0
	end )
	ClanTagApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f60_local0 = nil
		if element.loseFocus then
			f60_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f60_local0 = element.super:loseFocus( event )
		end
		return f60_local0
	end )
	menu:AddButtonCallbackFunction( ClanTagApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
		EditClanTag( self, f61_arg0, f61_arg2 )
		return true
	end, function ( f62_arg0, f62_arg1, f62_arg2 )
		CoD.Menu.SetButtonLabel( f62_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ClanTagApplet )
	self.ClanTagApplet = ClanTagApplet
	
	local CallingCardApplet = CoD.CallingCardImageButton.new( menu, controller )
	CallingCardApplet:setLeftRight( true, false, 12.08, 224 )
	CallingCardApplet:setTopBottom( true, false, 272, 336 )
	CallingCardApplet.FocusWidget.Name:setText( Engine.Localize( "MENU_CALLING_CARDS_CAPS" ) )
	CallingCardApplet:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CallingCardsIdentity.DataDownloaded" ), function ( model )
		local f63_local0 = CallingCardApplet
		local f63_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CallingCardsIdentity.DataDownloaded"
		}
		CoD.Menu.UpdateButtonShownState( f63_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardApplet:registerEventHandler( "gain_focus", function ( element, event )
		local f64_local0 = nil
		if element.gainFocus then
			f64_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f64_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f64_local0
	end )
	CallingCardApplet:registerEventHandler( "lose_focus", function ( element, event )
		local f65_local0 = nil
		if element.loseFocus then
			f65_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f65_local0 = element.super:loseFocus( event )
		end
		return f65_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardApplet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
		if CallingCards_IsEnabled( f66_arg0, f66_arg2 ) then
			OpenCallingCards( self, f66_arg0, f66_arg2, "", f66_arg1 )
			return true
		else
			
		end
	end, function ( f67_arg0, f67_arg1, f67_arg2 )
		CoD.Menu.SetButtonLabel( f67_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		if CallingCards_IsEnabled( f67_arg0, f67_arg2 ) then
			return false
		else
			return false
		end
	end, false )
	self:addElement( CallingCardApplet )
	self.CallingCardApplet = CallingCardApplet
	
	local mouseCursor = LUI.UIImage.new()
	mouseCursor:setLeftRight( true, false, 0, 16 )
	mouseCursor:setTopBottom( true, false, 0, 16 )
	mouseCursor:setImage( RegisterImage( "uie_t7_menu_cp_datavault_cursor_16x16" ) )
	self:addElement( mouseCursor )
	self.mouseCursor = mouseCursor
	
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				mouseCursor:completeAnimation()
				self.mouseCursor:setAlpha( 0 )
				self.clipFinished( mouseCursor, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				mouseCursor:completeAnimation()
				self.mouseCursor:setAlpha( 1 )
				self.clipFinished( mouseCursor, {} )
			end
		}
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.OmnipediaApplet:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

