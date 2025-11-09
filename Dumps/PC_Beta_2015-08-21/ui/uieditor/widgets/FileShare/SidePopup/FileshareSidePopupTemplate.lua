require( "ui.uieditor.widgets.FileShare.FileshareOptionButton" )

CoD.FileshareSidePopupTemplate = InheritFrom( LUI.UIElement )
CoD.FileshareSidePopupTemplate.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSidePopupTemplate )
	self.id = "FileshareSidePopupTemplate"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 7, 450 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.9 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 3, 7 )
	Border:setTopBottom( true, false, 0, 720 )
	self:addElement( Border )
	self.Border = Border
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( true, false, 0, 3 )
	Border0:setTopBottom( true, false, 0, 720 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 20.5, 307.5 )
	Title:setTopBottom( true, false, 173, 209 )
	Title:setRGB( 0.87, 0.88, 0.78 )
	Title:setText( Engine.Localize( "MENU_ARE_YOU_SURE" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( true, false, 20.5, 485.42 )
	Subtitle:setTopBottom( true, false, 209, 229 )
	Subtitle:setAlpha( 0.9 )
	Subtitle:setText( Engine.Localize( "MENU_FILESHARE_CANNOT_UNDO" ) )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( true, false, 20.5, 300.5 )
	List0:setTopBottom( true, false, 232, 638 )
	List0:setWidgetType( CoD.FileshareOptionButton )
	List0:setVerticalCount( 12 )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.List0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

