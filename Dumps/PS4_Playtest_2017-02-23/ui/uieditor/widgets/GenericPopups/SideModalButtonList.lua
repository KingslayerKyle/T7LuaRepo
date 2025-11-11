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
	self:setLeftRight( 0, 0, 0, 471 )
	self:setTopBottom( 0, 0, 0, 1005 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 26, 456 )
	Title:setTopBottom( 0, 0, 193, 247 )
	Title:setRGB( 0.87, 0.88, 0.78 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:subscribeToGlobalModel( controller, "ModalDialogData", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( 0, 0, 26, 723 )
	Subtitle:setTopBottom( 0, 0, 247, 277 )
	Subtitle:setAlpha( 0.9 )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Subtitle:subscribeToGlobalModel( controller, "ModalDialogData", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Subtitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	List0:makeFocusable()
	List0:setLeftRight( 0, 0, 26, 446 )
	List0:setTopBottom( 0, 0, 286, 734 )
	List0:setWidgetType( CoD.SideModalDialogButton )
	List0:setVerticalCount( 9 )
	List0:setDataSource( "SideModalDialogDataList" )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ModalSelectListOption( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.List0:close()
		self.Title:close()
		self.Subtitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

