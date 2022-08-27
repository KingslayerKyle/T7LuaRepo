-- 93ab9e490ecc1d6fd924de7d05be52c5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GenericPopups.SideModalDialogButton" )

CoD.SideModalButtonList = InheritFrom( LUI.UIElement )
CoD.SideModalButtonList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SideModalButtonList )
	self.id = "SideModalButtonList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 670 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 17, 304 )
	Title:setTopBottom( true, false, 129, 165 )
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
	Subtitle:setLeftRight( true, false, 17, 481.92 )
	Subtitle:setTopBottom( true, false, 165, 185 )
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
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( true, false, 17, 297 )
	List0:setTopBottom( true, false, 188, 492 )
	List0:setDataSource( "SideModalDialogDataList" )
	List0:setWidgetType( CoD.SideModalDialogButton )
	List0:setVerticalCount( 9 )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		ModalSelectListOption( self, f6_arg0, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.List0:close()
		element.Title:close()
		element.Subtitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

