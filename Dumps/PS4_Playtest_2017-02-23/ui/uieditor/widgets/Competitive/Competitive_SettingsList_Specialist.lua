require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )

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
	self:setLeftRight( 0, 0, 0, 1005 )
	self:setTopBottom( 0, 0, 0, 165 )
	self.anyChildUsesUpdateState = true
	
	local Title = CoD.StartMenu_OptionHighlight.new( menu, controller )
	Title:setLeftRight( 0, 0, 62, 809 )
	Title:setTopBottom( 0, 0, 0, 56 )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Title )
	self.Title = Title
	
	local Options = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 0, 816 )
	Options:setTopBottom( 0, 0, 56, 154 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 2 )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	self.Title:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title.DescTitle:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self.Options:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Options:setDataSource( modelValue )
		end
	end )
	Options.id = "Options"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Title:close()
		self.Options:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

