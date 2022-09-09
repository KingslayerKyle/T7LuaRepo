-- 0508a2f4a9e854a3ffd37d9e2c81ac78
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left" )
require( "ui.uieditor.widgets.GenericPopups.ButtonPrompts" )

local PostLoadFunc = function ( f1_arg0 )
	if LUI.DEVHideButtonPrompts then
		f1_arg0.ButtonPrompts:setAlpha( 0 )
	end
end

CoD.ModalDialogItems = InheritFrom( LUI.UIElement )
CoD.ModalDialogItems.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 14
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.ModalDialogItems )
	self.id = "ModalDialogItems"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 484 )
	self:setTopBottom( true, false, 0, 200 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 58.04, 522.96 )
	Title:setTopBottom( true, false, 0, 36 )
	Title:setRGB( 0.87, 0.88, 0.78 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:subscribeToGlobalModel( controller, "ModalDialogData", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( true, false, 58.04, 522.96 )
	Subtitle:setTopBottom( true, false, 50, 70 )
	Subtitle:setAlpha( 0.9 )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Subtitle:subscribeToGlobalModel( controller, "ModalDialogData", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Subtitle:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local optionsList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 58.04, 338.04 )
	optionsList:setTopBottom( true, false, 84, 150 )
	optionsList:setDataSource( "ModalDialogDataList" )
	optionsList:setWidgetType( CoD.List1ButtonLarge_Left )
	optionsList:setVerticalCount( 2 )
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		ModalSelectListOption( self, f7_arg0, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local ButtonPrompts = CoD.ButtonPrompts.new( menu, controller )
	ButtonPrompts:setLeftRight( true, false, 58.04, 379.04 )
	ButtonPrompts:setTopBottom( true, false, 164, 195 )
	self:addElement( ButtonPrompts )
	self.ButtonPrompts = ButtonPrompts
	
	optionsList.id = "optionsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.optionsList:close()
		element.ButtonPrompts:close()
		element.Title:close()
		element.Subtitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
