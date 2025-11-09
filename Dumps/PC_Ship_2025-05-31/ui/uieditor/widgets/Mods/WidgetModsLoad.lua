require( "ui.uieditor.widgets.Mods.EntryModsLoad" )

CoD.WidgetModsLoad = InheritFrom( LUI.UIElement )
CoD.WidgetModsLoad.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WidgetModsLoad )
	self.id = "WidgetModsLoad"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BackgroundDark = LUI.UIImage.new()
	BackgroundDark:setLeftRight( true, false, 0, 600 )
	BackgroundDark:setTopBottom( true, false, 0, 480 )
	BackgroundDark:setRGB( 0.31, 0.31, 0.31 )
	BackgroundDark:setAlpha( 0.7 )
	self:addElement( BackgroundDark )
	self.BackgroundDark = BackgroundDark
	
	local ListMods = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ListMods:makeFocusable()
	ListMods:setLeftRight( true, false, 0, 600 )
	ListMods:setTopBottom( true, false, 0, 466 )
	ListMods:setWidgetType( CoD.EntryModsLoad )
	ListMods:setVerticalCount( 18 )
	ListMods:setDataSource( "ModsLoadEntry" )
	ListMods:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ListMods:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( ListMods, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		Mods_LoadMod( controller, element )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_LOAD" )
		return true
	end, false )
	ListMods:subscribeToGlobalModel( controller, "ModsGlobal", "update", function ( model )
		UpdateDataSource( self, ListMods, controller )
	end )
	self:addElement( ListMods )
	self.ListMods = ListMods
	
	ListMods.id = "ListMods"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ListMods:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ListMods:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

