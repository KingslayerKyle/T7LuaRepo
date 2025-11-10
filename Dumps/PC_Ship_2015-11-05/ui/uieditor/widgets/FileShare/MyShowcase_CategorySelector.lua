require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemLarge" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )
require( "ui.uieditor.widgets.FileShare.FileshareCategorySelectoryListWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	local f1_local1 = Engine.CreateModel( f1_local0, "listVerticalCount", false )
	local f1_local2 = Engine.CreateModel( f1_local0, "isNormalSize", false )
	local f1_local3 = Engine.CreateModel( f1_local0, "summaryFileUpdated", false )
	local f1_local4 = Engine.CreateModel( f1_local0, "itemsCount", false )
	Engine.SetModelValue( f1_local2, false )
	Engine.SetModelValue( f1_local1, 3 )
end

CoD.MyShowcase_CategorySelector = InheritFrom( LUI.UIElement )
CoD.MyShowcase_CategorySelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyShowcase_CategorySelector )
	self.id = "MyShowcase_CategorySelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 580 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FileshareNoContent0 = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent0:setLeftRight( true, false, 503, 907 )
	FileshareNoContent0:setTopBottom( true, false, 207.35, 237.35 )
	self:addElement( FileshareNoContent0 )
	self.FileshareNoContent0 = FileshareNoContent0
	
	local contentList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	contentList:makeFocusable()
	contentList:setLeftRight( true, false, 330.5, 1079.5 )
	contentList:setTopBottom( true, false, 0, 477 )
	contentList:setDataSource( "FilesharePublishedList" )
	contentList:setWidgetType( CoD.FileshareSelectorItemLarge )
	contentList:setHorizontalCount( 3 )
	contentList:setSpacing( 7 )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "listVerticalCount", function ( model )
		local listVerticalCount = Engine.GetModelValue( model )
		if listVerticalCount then
			contentList:setVerticalCount( listVerticalCount )
		end
	end )
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
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if FileshareCanShowOptionsMenu( controller ) then
			OpenPopup( self, "FileshareOptions", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if FileshareCanShowOptionsMenu( controller ) then
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
		end
	end )
	self:addElement( contentList )
	self.contentList = contentList
	
	local FileshareSpinner = CoD.FileshareSpinner.new( menu, controller )
	FileshareSpinner:setLeftRight( true, false, 1059.42, 1123.42 )
	FileshareSpinner:setTopBottom( true, false, 474.35, 538.35 )
	FileshareSpinner:setScale( 0.8 )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local FileshareCategorySelectoryListWidget = CoD.FileshareCategorySelectoryListWidget.new( menu, controller )
	FileshareCategorySelectoryListWidget:setLeftRight( true, false, 10, 301 )
	FileshareCategorySelectoryListWidget:setTopBottom( true, false, 0, 500 )
	FileshareCategorySelectoryListWidget.itemList:setDataSource( "FileshareCategoriesList" )
	self:addElement( FileshareCategorySelectoryListWidget )
	self.FileshareCategorySelectoryListWidget = FileshareCategorySelectoryListWidget
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( true, false, 594.92, 804.92 )
	verticalCounter0:setTopBottom( true, false, 493, 518 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		SetAsListVerticalCounter( self, element, "contentList" )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	FileshareNoContent0:linkToElementModel( contentList, nil, false, function ( model )
		FileshareNoContent0:setModel( model, controller )
	end )
	contentList.navigation = {
		left = FileshareCategorySelectoryListWidget
	}
	FileshareCategorySelectoryListWidget.navigation = {
		right = contentList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "summaryFileUpdated", function ( model )
		local f17_local0 = self
		FileshareSummaryFileUpdate( controller )
	end )
	contentList.id = "contentList"
	FileshareCategorySelectoryListWidget.id = "FileshareCategorySelectoryListWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.FileshareCategorySelectoryListWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareNoContent0:close()
		element.contentList:close()
		element.FileshareSpinner:close()
		element.FileshareCategorySelectoryListWidget:close()
		element.verticalCounter0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

