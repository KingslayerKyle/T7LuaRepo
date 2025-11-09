require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Voice_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Voice" )
require( "ui.uieditor.menus.hud.Credit_Fullscreen" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Network" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Graphics" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Sound_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Sound" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Controls_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Controls" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_GraphicContent_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_GraphicContent" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_MusicTracks" )

local PostLoadFunc = function ( self, controller, menu )
	if not CoD.isZombie then
		self.cheatstate = 0
		menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "B", function ( element, menu, controller, model )
			if self.cheatstate == 0 then
				self.cheatstate = 1
				return true
			else
				self.cheatstate = 0
				return false
			end
		end, function ( element, menu, controller )
			return false
		end, false )
		menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "O", function ( element, menu, controller, model )
			if self.cheatstate == 1 then
				self.cheatstate = 2
				return true
			else
				self.cheatstate = 0
				return false
			end
		end, function ( element, menu, controller )
			return false
		end, false )
		menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, "3", function ( element, menu, controller, model )
			if self.cheatstate == 2 then
				self.cheatstate = 0
				if not CoD.MenuNavigation then
					CoD.MenuNavigation = {}
				end
				if not CoD.MenuNavigation[controller] then
					CoD.MenuNavigation[controller] = {}
				end
				table.insert( CoD.MenuNavigation[controller], {
					"NumericKeypad"
				} )
				local f6_local0 = self
				while f6_local0 and not f6_local0.openMenu do
					f6_local0 = f6_local0:getParent()
				end
				local f6_local1 = f6_local0:openPopup( "NumericKeypad", controller )
				return true
			else
				
			end
		end, function ( element, menu, controller )
			return false
		end, false )
	end
end

CoD.StartMenu_Options = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options )
	self.id = "StartMenu_Options"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Muting = CoD.StartMenu_Button_LG.new( menu, controller )
	Muting:setLeftRight( true, false, 10, 373 )
	Muting:setTopBottom( false, true, -172, -15 )
	Muting.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_muting" ) )
	Muting.Title:setText( Engine.Localize( "" ) )
	Muting.StartMenuIdentitySubTitle0.SubTitle:setText( LocalizeToUpperString( "PLATFORM_MUTING_OPTION_TITLE" ) )
	Muting.ImageText:setText( Engine.Localize( "" ) )
	Muting:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	Muting:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	menu:AddButtonCallbackFunction( Muting, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() and IsInDefaultState( element ) then
			OpenPopup( self, "StartMenu_Options_Voice_PC", controller, "", "" )
			return true
		elseif IsInDefaultState( element ) then
			OpenPopup( self, "StartMenu_Options_Voice", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPC() and IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Muting:mergeStateConditions( {
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		}
	} )
	self:addElement( Muting )
	self.Muting = Muting
	
	local Credits = CoD.StartMenu_Button_LG.new( menu, controller )
	Credits:setLeftRight( true, true, 749, -25 )
	Credits:setTopBottom( false, true, -172, -15 )
	Credits.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_credits" ) )
	Credits.Title:setText( Engine.Localize( "" ) )
	Credits.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CREDITS_CAPS" ) )
	Credits.ImageText:setText( Engine.Localize( "" ) )
	Credits:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	Credits:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	menu:AddButtonCallbackFunction( Credits, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenPopup( self, "Credit_Fullscreen", controller, "", "" )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Credits:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not InSafehouseOrFrontend()
			end
		}
	} )
	self:addElement( Credits )
	self.Credits = Credits
	
	local Network = CoD.StartMenu_Button_LG.new( menu, controller )
	Network:setLeftRight( true, false, 379, 741 )
	Network:setTopBottom( false, true, -172, -15 )
	Network.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_network" ) )
	Network.Title:setText( Engine.Localize( "" ) )
	Network.StartMenuIdentitySubTitle0.SubTitle:setText( LocalizeToUpperString( "MENU_NETWORK" ) )
	Network.ImageText:setText( Engine.Localize( "" ) )
	Network:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f19_local0
	end )
	Network:registerEventHandler( "lose_focus", function ( element, event )
		local f20_local0 = nil
		if element.loseFocus then
			f20_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f20_local0 = element.super:loseFocus( event )
		end
		return f20_local0
	end )
	menu:AddButtonCallbackFunction( Network, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenPopup( self, "StartMenu_Options_Network", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Network:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ShouldOpenNetworkOptions()
			end
		}
	} )
	self:addElement( Network )
	self.Network = Network
	
	local Graphics = CoD.StartMenu_Button_SM.new( menu, controller )
	Graphics:setLeftRight( true, true, 940, -25 )
	Graphics:setTopBottom( true, false, 12.78, 173.65 )
	Graphics.ImageText:setText( Engine.Localize( "" ) )
	Graphics.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_graphics" ) )
	Graphics.StartMenuIdentitySubTitle0.SubTitle:setText( LocalizeToUpperString( "MENU_GRAPHICS" ) )
	Graphics.ClanTag:setText( Engine.Localize( "" ) )
	Graphics:registerEventHandler( "gain_focus", function ( element, event )
		local f24_local0 = nil
		if element.gainFocus then
			f24_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f24_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f24_local0
	end )
	Graphics:registerEventHandler( "lose_focus", function ( element, event )
		local f25_local0 = nil
		if element.loseFocus then
			f25_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f25_local0 = element.super:loseFocus( event )
		end
		return f25_local0
	end )
	menu:AddButtonCallbackFunction( Graphics, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup_NoDependency( menu, "StartMenu_Options_Graphics_PC", controller )
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup( self, "StartMenu_Options_Graphics", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Graphics:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ShouldOpenGraphicsAndSoundOptions()
			end
		}
	} )
	self:addElement( Graphics )
	self.Graphics = Graphics
	
	local Audio = CoD.StartMenu_Button_SM.new( menu, controller )
	Audio:setLeftRight( true, true, 749, -216 )
	Audio:setTopBottom( true, false, 180.09, 340.96 )
	Audio.ImageText:setText( Engine.Localize( "" ) )
	Audio.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_audio" ) )
	Audio.StartMenuIdentitySubTitle0.SubTitle:setText( LocalizeToUpperString( "MENU_AUDIO" ) )
	Audio.ClanTag:setText( Engine.Localize( "" ) )
	Audio:registerEventHandler( "gain_focus", function ( element, event )
		local f29_local0 = nil
		if element.gainFocus then
			f29_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f29_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f29_local0
	end )
	Audio:registerEventHandler( "lose_focus", function ( element, event )
		local f30_local0 = nil
		if element.loseFocus then
			f30_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f30_local0 = element.super:loseFocus( event )
		end
		return f30_local0
	end )
	menu:AddButtonCallbackFunction( Audio, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup( self, "StartMenu_Options_Sound_PC", controller, "", "" )
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup( self, "StartMenu_Options_Sound", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	Audio:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ShouldOpenGraphicsAndSoundOptions()
			end
		}
	} )
	self:addElement( Audio )
	self.Audio = Audio
	
	local Controls = CoD.StartMenu_Button_Hero.new( menu, controller )
	Controls:setLeftRight( true, false, 10, 741 )
	Controls:setTopBottom( true, true, 13, -179 )
	Controls.Title:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	Controls.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CONTROLS_DESC" ) )
	Controls:subscribeToGlobalModel( controller, "PlatformControllerImage", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Controls.imageContainer.ImageContainer:setImage( RegisterImage( image ) )
		end
	end )
	Controls:registerEventHandler( "gain_focus", function ( element, event )
		local f35_local0 = nil
		if element.gainFocus then
			f35_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f35_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f35_local0
	end )
	Controls:registerEventHandler( "lose_focus", function ( element, event )
		local f36_local0 = nil
		if element.loseFocus then
			f36_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f36_local0 = element.super:loseFocus( event )
		end
		return f36_local0
	end )
	menu:AddButtonCallbackFunction( Controls, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() then
			OpenPopup( self, "StartMenu_Options_Controls_PC", controller, "", "" )
			return true
		else
			OpenPopup( self, "StartMenu_Options_Controls", controller, "", "" )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Controls )
	self.Controls = Controls
	
	local GraphicContent = CoD.StartMenu_Button_SM.new( menu, controller )
	GraphicContent:setLeftRight( false, true, -401, -216 )
	GraphicContent:setTopBottom( true, false, 12.78, 173.65 )
	GraphicContent.ImageText:setText( Engine.Localize( "" ) )
	GraphicContent.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_graphiccontent" ) )
	GraphicContent.StartMenuIdentitySubTitle0.SubTitle:setText( LocalizeToUpperString( "MENU_CONTENT_FILTER" ) )
	GraphicContent.ClanTag:setText( Engine.Localize( "" ) )
	GraphicContent:registerEventHandler( "gain_focus", function ( element, event )
		local f39_local0 = nil
		if element.gainFocus then
			f39_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f39_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f39_local0
	end )
	GraphicContent:registerEventHandler( "lose_focus", function ( element, event )
		local f40_local0 = nil
		if element.loseFocus then
			f40_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f40_local0 = element.super:loseFocus( event )
		end
		return f40_local0
	end )
	menu:AddButtonCallbackFunction( GraphicContent, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() then
			OpenPopup( self, "StartMenu_Options_GraphicContent_PC", controller, "", "" )
			return true
		else
			OpenPopup( self, "StartMenu_Options_GraphicContent", controller, "", "" )
			return true
		end
	end, function ( element, menu, controller )
		if IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		end
	end, false )
	self:addElement( GraphicContent )
	self.GraphicContent = GraphicContent
	
	local MusicTracks = CoD.StartMenu_Button_SM.new( menu, controller )
	MusicTracks:setLeftRight( false, true, -210, -25 )
	MusicTracks:setTopBottom( true, false, 180.09, 340.96 )
	MusicTracks.ImageText:setText( Engine.Localize( "" ) )
	MusicTracks.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_music" ) )
	MusicTracks.StartMenuIdentitySubTitle0.SubTitle:setText( LocalizeToUpperString( "MENU_MUSIC_TRACKS" ) )
	MusicTracks.ClanTag:setAlpha( 0 )
	MusicTracks.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	MusicTracks:registerEventHandler( "gain_focus", function ( element, event )
		local f43_local0 = nil
		if element.gainFocus then
			f43_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f43_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f43_local0
	end )
	MusicTracks:registerEventHandler( "lose_focus", function ( element, event )
		local f44_local0 = nil
		if element.loseFocus then
			f44_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f44_local0 = element.super:loseFocus( event )
		end
		return f44_local0
	end )
	menu:AddButtonCallbackFunction( MusicTracks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			OpenPopup( self, "StartMenu_Options_MusicTracks", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInDefaultState( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	MusicTracks:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f47_local0
				if not IsPrimaryControllerIndex( controller ) then
					f47_local0 = not IsInGame()
				else
					f47_local0 = false
				end
				return f47_local0
			end
		},
		{
			stateName = "NotAvailableInGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( MusicTracks )
	self.MusicTracks = MusicTracks
	
	Muting.navigation = {
		up = Controls,
		right = Network
	}
	Credits.navigation = {
		left = Network,
		up = {
			Audio,
			MusicTracks
		}
	}
	Network.navigation = {
		left = Muting,
		up = Controls,
		right = Credits
	}
	Graphics.navigation = {
		left = GraphicContent,
		down = MusicTracks
	}
	Audio.navigation = {
		left = Controls,
		up = GraphicContent,
		right = MusicTracks,
		down = Credits
	}
	Controls.navigation = {
		right = {
			GraphicContent,
			Audio
		},
		down = {
			Muting,
			Network
		}
	}
	GraphicContent.navigation = {
		left = Controls,
		right = Graphics,
		down = Audio
	}
	MusicTracks.navigation = {
		left = Audio,
		up = Graphics,
		down = Credits
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Muting.id = "Muting"
	Credits.id = "Credits"
	Network.id = "Network"
	Graphics.id = "Graphics"
	Audio.id = "Audio"
	Controls.id = "Controls"
	GraphicContent.id = "GraphicContent"
	MusicTracks.id = "MusicTracks"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Controls:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Muting:close()
		element.Credits:close()
		element.Network:close()
		element.Graphics:close()
		element.Audio:close()
		element.Controls:close()
		element.GraphicContent:close()
		element.MusicTracks:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

