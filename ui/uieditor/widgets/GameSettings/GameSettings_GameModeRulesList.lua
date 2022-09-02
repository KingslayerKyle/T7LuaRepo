-- 17956e94df273096f1cfcc8b593c13fe
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Button" )

CoD.GameSettings_GameModeRulesList = InheritFrom( LUI.UIElement )
CoD.GameSettings_GameModeRulesList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_GameModeRulesList )
	self.id = "GameSettings_GameModeRulesList"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 615 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = CoD.StartMenu_OptionHighlight.new( menu, controller )
	Title:setLeftRight( true, false, 40, 382 )
	Title:setTopBottom( true, false, 0, 40 )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title.DescTitle:setText( Engine.Localize( "" ) )
	self:addElement( Title )
	self.Title = Title
	
	local Sliders = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Sliders:makeFocusable()
	Sliders:setLeftRight( true, false, 0, 670 )
	Sliders:setTopBottom( true, false, 40, 378 )
	Sliders:setWidgetType( CoD.Slider_Small )
	Sliders:setVerticalCount( 10 )
	Sliders:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f2_local0
	end )
	Sliders:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( Sliders, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		OpenGameSettingsOptionsMenu( self, f4_arg0, f4_arg2, f4_arg1 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( Sliders )
	self.Sliders = Sliders
	
	local Spacer = CoD.VerticalListSpacer.new( menu, controller )
	Spacer:setLeftRight( true, false, 27.5, 527.5 )
	Spacer:setTopBottom( true, false, 378, 404 )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local Buttions = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttions:makeFocusable()
	Buttions:setLeftRight( true, false, 40, 320 )
	Buttions:setTopBottom( true, false, 404, 742 )
	Buttions:setWidgetType( CoD.GameSettings_Button )
	Buttions:setVerticalCount( 10 )
	Buttions:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		if IsCurrentMenu( menu, "GameSettings_CreateAClassSettings" ) then
			ButtonListFocused( self, element, controller )
			GameSettingsButtonGainFocus( self, element, controller )
		else
			GameSettingsButtonGainFocus( self, element, controller )
		end
		return f6_local0
	end )
	Buttions:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f7_local0
	end )
	Buttions:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( Buttions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		ProcessListAction( self, f9_arg0, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Buttions, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		OpenGameSettingsOptionsMenu( self, f11_arg0, f11_arg2, f11_arg1 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	Buttions:subscribeToGlobalModel( controller, "GametypeSettings", "presetClassesPerTeam", function ( model )
		local f13_local0 = Buttions
		if IsCurrentMenu( menu, "GameSettings_CreateAClassSettings" ) then
			UpdateDataSource( self, f13_local0, controller )
		end
	end )
	self:addElement( Buttions )
	self.Buttions = Buttions
	
	Sliders.navigation = {
		down = Buttions
	}
	Buttions.navigation = {
		up = Sliders
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 40, 382 )
				self.Title:setTopBottom( true, false, 0, 40 )
				self.clipFinished( Title, {} )
			end
		},
		NoHeader = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 40, 382 )
				self.Title:setTopBottom( true, false, 0, 10 )
				self.clipFinished( Title, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Sliders.id = "Sliders"
	Buttions.id = "Buttions"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Sliders:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Title:close()
		element.Sliders:close()
		element.Spacer:close()
		element.Buttions:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

