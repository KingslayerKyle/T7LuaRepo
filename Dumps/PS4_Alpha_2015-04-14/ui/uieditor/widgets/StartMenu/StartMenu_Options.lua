require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_SM" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Voice" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Social" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Sound" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_LG" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Graphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Button_Hero" )
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
	Muting:setLeftRight( true, false, 9, 385 )
	Muting:setTopBottom( false, true, -170, -5 )
	Muting:setRGB( 1, 1, 1 )
	Muting.ImageText:setText( Engine.Localize( "" ) )
	Muting.ImageContainer:setAlpha( 1 )
	Muting.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_muting" ) )
	Muting.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MUTING_CAPS" ) )
	Muting.ClanTag:setAlpha( 0 )
	Muting.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Muting:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if AlwaysFalse() then
			OpenPopup( self, "StartMenu_Options_Voice", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Muting:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Muting )
	self.Muting = Muting
	
	local Social = CoD.StartMenu_Button_SM.new( menu, controller )
	Social:setLeftRight( true, false, 394, 762 )
	Social:setTopBottom( false, true, -170, -5 )
	Social:setRGB( 1, 1, 1 )
	Social.ImageText:setText( Engine.Localize( "" ) )
	Social.ImageContainer:setAlpha( 1 )
	Social.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_2social" ) )
	Social.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	Social.ClanTag:setAlpha( 0 )
	Social.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Social:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if AlwaysFalse() then
			OpenPopup( self, "StartMenu_Options_Social", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Social:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Social )
	self.Social = Social
	
	local Audio = CoD.StartMenu_Button_SM.new( menu, controller )
	Audio:setLeftRight( true, true, 771, -9 )
	Audio:setTopBottom( false, true, -170, -5 )
	Audio:setRGB( 1, 1, 1 )
	Audio.ImageText:setText( Engine.Localize( "" ) )
	Audio.ImageContainer:setAlpha( 1 )
	Audio.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_audio" ) )
	Audio.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_AUDIO_CAPS" ) )
	Audio.ClanTag:setAlpha( 0 )
	Audio.ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	Audio:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenPopup( self, "StartMenu_Options_Sound", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Audio )
	self.Audio = Audio
	
	local Graphics = CoD.StartMenu_Button_LG.new( menu, controller )
	Graphics:setLeftRight( true, true, 771, -9 )
	Graphics:setTopBottom( true, true, 1, -181 )
	Graphics:setRGB( 1, 1, 1 )
	Graphics.bg:setRGB( 1, 1, 1 )
	Graphics.bg:setAlpha( 0 )
	Graphics.ImageContainer:setRGB( 1, 1, 1 )
	Graphics.ImageContainer:setAlpha( 1 )
	Graphics.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_graphic" ) )
	Graphics.Title:setText( Engine.Localize( "MENU_GRAPHICS" ) )
	Graphics.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GRAPHICS_DESC" ) )
	Graphics.ImageText:setText( Engine.Localize( "" ) )
	Graphics:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if not IsOrbis() then
			OpenPopup( self, "StartMenu_Options_Graphics", controller )
		elseif IsOrbis() and not IsBooleanDvarSet( "ui_execdemo" ) then
			OpenPopup( self, "StartMenu_Options_Graphics", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Graphics:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsOrbis() and IsBooleanDvarSet( "ui_execdemo" )
			end
		}
	} )
	self:addElement( Graphics )
	self.Graphics = Graphics
	
	local Controls = CoD.StartMenu_Button_Hero.new( menu, controller )
	Controls:setLeftRight( true, false, 9, 762 )
	Controls:setTopBottom( true, true, 1, -181 )
	Controls:setRGB( 1, 1, 1 )
	Controls.Title:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	Controls.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CONTROLS_DESC" ) )
	Controls:subscribeToGlobalModel( controller, "PlatformControllerImage", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Controls.image:setImage( RegisterImage( modelValue ) )
		end
	end )
	Controls:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenPopup( self, "StartMenu_Options_Controls", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Controls )
	self.Controls = Controls
	
	Muting.navigation = {
		up = Controls,
		right = Social
	}
	Social.navigation = {
		left = Muting,
		up = Controls,
		right = Audio
	}
	Audio.navigation = {
		left = Social,
		up = Graphics
	}
	Graphics.navigation = {
		left = Controls,
		down = Audio
	}
	Controls.navigation = {
		right = Graphics,
		down = {
			Muting,
			Social
		}
	}
	Muting.id = "Muting"
	Social.id = "Social"
	Audio.id = "Audio"
	Graphics.id = "Graphics"
	Controls.id = "Controls"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Controls:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Muting:close()
		self.Social:close()
		self.Audio:close()
		self.Graphics:close()
		self.Controls:close()
		CoD.StartMenu_Options.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

