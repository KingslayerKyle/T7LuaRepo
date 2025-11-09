require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )

CoD.Competitive_SettingsList_Specialist = InheritFrom( LUI.UIElement )
CoD.Competitive_SettingsList_Specialist.new = function ( menu, controller )
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
	self:setClass( CoD.Competitive_SettingsList_Specialist )
	self.id = "Competitive_SettingsList_Specialist"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 670 )
	self:setTopBottom( true, false, 0, 110 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = CoD.StartMenu_OptionHighlight.new( menu, controller )
	Title:setLeftRight( true, false, 41, 539 )
	Title:setTopBottom( true, false, 0, 37 )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Title )
	self.Title = Title
	
	local Options = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 0, 670 )
	Options:setTopBottom( true, false, 37, 103 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 2 )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f2_local0
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	self.Title:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			Title.DescTitle:setText( Engine.Localize( LocalizeToUpperString( name ) ) )
		end
	end )
	self.Options:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local optionsDatasource = Engine.GetModelValue( model )
		if optionsDatasource then
			Options:setDataSource( optionsDatasource )
		end
	end )
	Options.id = "Options"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Title:close()
		element.Options:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

