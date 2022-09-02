-- 047e61c6df80bce46445bb9f60db17a5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileshareNoContentGraphic" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.Groups.GroupsFeaturedItemLarge" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.UITimer.newElementTimer( 7000, false, function ()
		if f1_arg0.contentList then
			if f1_arg0.contentList.activeWidget then
				SelectNextItemIfPossible( f1_arg0, f1_arg0.contentList.activeWidget, f1_arg1 )
			else
				SelectFirstItemIfPossible( f1_arg0, f1_arg0.contentList, f1_arg1 )
			end
		end
	end, f1_arg0 )
	f1_arg0.featureListTimer = f1_local0
	f1_arg0:addElement( f1_local0 )
end

CoD.GroupsFeaturedListLarge = InheritFrom( LUI.UIElement )
CoD.GroupsFeaturedListLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.GroupsFeaturedListLarge )
	self.id = "GroupsFeaturedListLarge"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 643 )
	self:setTopBottom( true, false, 0, 350 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FileshareNoContentGraphic = CoD.FileshareNoContentGraphic.new( menu, controller )
	FileshareNoContentGraphic:setLeftRight( true, false, 1, 648 )
	FileshareNoContentGraphic:setTopBottom( true, false, 1, 356 )
	self:addElement( FileshareNoContentGraphic )
	self.FileshareNoContentGraphic = FileshareNoContentGraphic
	
	local contentList = LUI.UIList.new( menu, controller, 10, 300, nil, true, true, 0, 0, false, false )
	contentList:makeFocusable()
	contentList:setLeftRight( true, false, 0, 643 )
	contentList:setTopBottom( true, false, 0, 350 )
	contentList:setWidgetType( CoD.GroupsFeaturedItemLarge )
	contentList:setSpacing( 10 )
	contentList:setDataSource( "FilesharePublishedList" )
	contentList:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "contentList", "FileshareCommunityList" )
		end
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	contentList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		MediaManagerClearDisplay( self, element, controller )
		return f5_local0
	end )
	contentList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f6_local0 = nil
		FileshareItemLoseFocus( element )
		return f6_local0
	end )
	contentList:registerEventHandler( "gain_focus", function ( element, event )
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
	contentList:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		ProcessListAction( self, f9_arg0, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if FileshareCanShowOptionsMenu( f11_arg2 ) then
			OpenPopup( self, "FileshareOptions", f11_arg2, "", "" )
			PreserveThumbnails( f11_arg2, true )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if FileshareCanShowOptionsMenu( f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, contentList, controller )
	end )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f14_local0 = contentList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f14_local0, controller )
			SelectFirstItemIfPossible( self, f14_local0, controller )
		end
	end )
	self:addElement( contentList )
	self.contentList = contentList
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:setLeftRight( true, false, 197.5, 451.5 )
	FileshareNoContent:setTopBottom( true, false, 163.05, 192.95 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	FileshareNoContent:linkToElementModel( contentList, nil, false, function ( model )
		FileshareNoContent:setModel( model, controller )
	end )
	contentList.id = "contentList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.contentList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareNoContentGraphic:close()
		element.contentList:close()
		element.FileshareNoContent:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

