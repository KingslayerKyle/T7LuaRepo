require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Button" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )

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
	self:setLeftRight( 0, 0, 0, 922 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local Title = CoD.StartMenu_OptionHighlight.new( menu, controller )
	Title:setLeftRight( 0, 0, 60, 573 )
	Title:setTopBottom( 0, 0, 0, 60 )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title.DescTitle:setText( Engine.Localize( "" ) )
	self:addElement( Title )
	self.Title = Title
	
	local Sliders = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Sliders:makeFocusable()
	Sliders:setLeftRight( 0, 0, 0, 816 )
	Sliders:setTopBottom( 0, 0, 65, 563 )
	Sliders:setWidgetType( CoD.Slider_Small )
	Sliders:setVerticalCount( 10 )
	Sliders:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	Sliders:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Sliders, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	self:addElement( Sliders )
	self.Sliders = Sliders
	
	local Spacer = CoD.VerticalListSpacer.new( menu, controller )
	Spacer:setLeftRight( 0, 0, 41, 791 )
	Spacer:setTopBottom( 0, 0, 567, 606 )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local Buttions = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttions:makeFocusable()
	Buttions:setLeftRight( 0, 0, 60, 480 )
	Buttions:setTopBottom( 0, 0, 611, 1109 )
	Buttions:setWidgetType( CoD.GameSettings_Button )
	Buttions:setVerticalCount( 10 )
	Buttions:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCurrentMenu( menu, "GameSettings_CreateAClassSettings" ) then
			ButtonListFocused( self, element, controller )
			GameSettingsButtonGainFocus( self, element, controller )
		else
			GameSettingsButtonGainFocus( self, element, controller )
		end
		return retVal
	end )
	Buttions:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	Buttions:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Buttions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( Buttions, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	Buttions:subscribeToGlobalModel( controller, "GametypeSettings", "presetClassesPerTeam", function ( model )
		local element = Buttions
		if IsCurrentMenu( menu, "GameSettings_CreateAClassSettings" ) then
			UpdateDataSource( self, element, controller )
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
	self.resetProperties = function ()
		Title:completeAnimation()
		Title:setLeftRight( 0, 0, 60, 573 )
		Title:setTopBottom( 0, 0, 0, 60 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoHeader = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setLeftRight( 0, 0, 60, 573 )
				self.Title:setTopBottom( 0, 0, 0.5, 15.5 )
				self.clipFinished( Title, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Sliders.id = "Sliders"
	Buttions.id = "Buttions"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Title:close()
		self.Sliders:close()
		self.Spacer:close()
		self.Buttions:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

