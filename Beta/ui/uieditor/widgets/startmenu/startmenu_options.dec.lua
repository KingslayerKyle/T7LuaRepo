require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Voice_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Voice" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Social" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_MusicTracks" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Network" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Graphics_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Graphics" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Sound_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Sound" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Controls_PC" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Controls" )

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
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Muting = CoD.StartMenu_Button_SM.new( menu, controller )
	Muting:setLeftRight( true, false, 9, 254 )
	Muting:setTopBottom( false, true, -170, -5 )
	Muting.ImageText:setText( Engine.Localize( "" ) )
	Muting.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_muting" ) )
	Muting.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_muting" ) )
	Muting.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MUTING_CAPS" ) )
	Muting.ClanTag:setAlpha( 0 )
	Muting.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Muting:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Muting:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Muting, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() and ShouldOpenMutingOptions() then
			OpenPopup( self, "StartMenu_Options_Voice_PC", controller )
			return true
		elseif ShouldOpenMutingOptions() then
			OpenPopup( self, "StartMenu_Options_Voice", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsPC() and ShouldOpenMutingOptions() then
			return true
		elseif ShouldOpenMutingOptions() then
			return true
		else
			return false
		end
	end, false )
	Muting:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ShouldOpenMutingOptions()
			end
		}
	} )
	self:addElement( Muting )
	self.Muting = Muting
	
	local Social = CoD.StartMenu_Button_SM.new( menu, controller )
	Social:setLeftRight( true, false, 263, 508 )
	Social:setTopBottom( false, true, -170, -5 )
	Social.ImageText:setText( Engine.Localize( "" ) )
	Social.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_classified" ) )
	Social.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_classified" ) )
	Social.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	Social.ClanTag:setAlpha( 0 )
	Social.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Social:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Social:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Social, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if ShouldOpenSocialOptions() then
			OpenPopup( self, "StartMenu_Options_Social", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if ShouldOpenSocialOptions() then
			return true
		else
			return false
		end
	end, false )
	Social:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ShouldOpenSocialOptions()
			end
		}
	} )
	self:addElement( Social )
	self.Social = Social
	
	local MusicTracks = CoD.StartMenu_Button_SM.new( menu, controller )
	MusicTracks:setLeftRight( true, true, 771, -9 )
	MusicTracks:setTopBottom( false, true, -170, -5 )
	MusicTracks.ImageText:setText( Engine.Localize( "" ) )
	MusicTracks.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_classified" ) )
	MusicTracks.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_classified" ) )
	MusicTracks.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CLASSIFIED_CAPS" ) )
	MusicTracks.ClanTag:setAlpha( 0 )
	MusicTracks.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	MusicTracks:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MusicTracks:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MusicTracks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disabled" ) then
			OpenPopup( self, "StartMenu_Options_MusicTracks", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Disabled" ) then
			return true
		else
			return false
		end
	end, false )
	MusicTracks:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( MusicTracks )
	self.MusicTracks = MusicTracks
	
	local Network = CoD.StartMenu_Button_SM.new( menu, controller )
	Network:setLeftRight( true, false, 517, 762 )
	Network:setTopBottom( false, true, -170, -5 )
	Network.ImageText:setText( Engine.Localize( "" ) )
	Network.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_network" ) )
	Network.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_network" ) )
	Network.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( LocalizeToUpperString( "MENU_NETWORK" ) ) )
	Network.ClanTag:setAlpha( 0 )
	Network.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Network:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Network:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Network, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if ShouldOpenNetworkOptions() then
			OpenPopup( self, "StartMenu_Options_Network", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if ShouldOpenNetworkOptions() then
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
	
	local Graphics = CoD.StartMenu_Button_LG.new( menu, controller )
	Graphics:setLeftRight( true, true, 771, -9 )
	Graphics:setTopBottom( true, false, 1, 165.5 )
	Graphics.bg:setAlpha( 0 )
	Graphics.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_graphics" ) )
	Graphics.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_graphics" ) )
	Graphics.Title:setText( Engine.Localize( LocalizeToUpperString( "MENU_GRAPHICS" ) ) )
	Graphics.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GRAPHICS_DESC" ) )
	Graphics.ImageText:setText( Engine.Localize( "" ) )
	Graphics:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Graphics:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Graphics, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup( self, "StartMenu_Options_Graphics_PC", controller )
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup( self, "StartMenu_Options_Graphics", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
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
	
	local Audio = CoD.StartMenu_Button_LG.new( menu, controller )
	Audio:setLeftRight( true, true, 771, -9 )
	Audio:setTopBottom( true, false, 174.5, 339 )
	Audio.bg:setAlpha( 0 )
	Audio.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_audio" ) )
	Audio.DisabledImage.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_audio" ) )
	Audio.Title:setText( Engine.Localize( LocalizeToUpperString( "MENU_AUDIO" ) ) )
	Audio.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_AUDIO_SETTINGS_DESC" ) )
	Audio.ImageText:setText( Engine.Localize( "" ) )
	Audio:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Audio:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Audio, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup( self, "StartMenu_Options_Sound_PC", controller )
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
			OpenPopup( self, "StartMenu_Options_Sound", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsPC() and ShouldOpenGraphicsAndSoundOptions() then
			return true
		elseif ShouldOpenGraphicsAndSoundOptions() then
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
	Controls:setLeftRight( true, false, 9, 762 )
	Controls:setTopBottom( true, true, 1, -181 )
	Controls.Title:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	Controls.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CONTROLS_DESC" ) )
	Controls:subscribeToGlobalModel( controller, "PlatformControllerImage", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Controls.imageContainer.ImageContainer:setImage( RegisterImage( modelValue ) )
		end
	end )
	Controls:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Controls:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Controls, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPC() then
			OpenPopup( self, "StartMenu_Options_Controls_PC", controller )
			return true
		else
			OpenPopup( self, "StartMenu_Options_Controls", controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Controls )
	self.Controls = Controls
	
	Muting.navigation = {
		up = Controls,
		right = Social
	}
	Social.navigation = {
		left = Muting,
		up = Controls,
		right = Network
	}
	MusicTracks.navigation = {
		left = Network,
		up = Audio
	}
	Network.navigation = {
		left = Social,
		up = Controls,
		right = MusicTracks
	}
	Graphics.navigation = {
		left = Controls,
		down = Audio
	}
	Audio.navigation = {
		left = Controls,
		up = Graphics,
		down = MusicTracks
	}
	Controls.navigation = {
		right = {
			Graphics,
			Audio
		},
		down = {
			Muting,
			Social,
			Network
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Muting.id = "Muting"
	Social.id = "Social"
	MusicTracks.id = "MusicTracks"
	Network.id = "Network"
	Graphics.id = "Graphics"
	Audio.id = "Audio"
	Controls.id = "Controls"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Controls:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Muting:close()
		self.Social:close()
		self.MusicTracks:close()
		self.Network:close()
		self.Graphics:close()
		self.Audio:close()
		self.Controls:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

