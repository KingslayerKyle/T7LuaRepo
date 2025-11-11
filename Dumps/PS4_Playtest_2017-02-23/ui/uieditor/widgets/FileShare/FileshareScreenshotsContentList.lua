require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.FileshareScreenshotSelectorItemLarge" )
require( "ui.uieditor.widgets.FileshareNoContentGraphic" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.FileshareScreenshotsContentList = InheritFrom( LUI.UIElement )
CoD.FileshareScreenshotsContentList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareScreenshotsContentList )
	self.id = "FileshareScreenshotsContentList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1155 )
	self:setTopBottom( 0, 0, 0, 787 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local contentList = LUI.UIList.new( menu, controller, 15, 0, nil, false, false, 0, 0, false, false )
	contentList:makeFocusable()
	contentList:setLeftRight( 0, 0, 16, 1147 )
	contentList:setTopBottom( 0, 0, 0, 714 )
	contentList:setWidgetType( CoD.FileshareScreenshotSelectorItemLarge )
	contentList:setHorizontalCount( 3 )
	contentList:setVerticalCount( 3 )
	contentList:setSpacing( 15 )
	contentList:setDataSource( "FilesharePublishedList" )
	contentList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "contentList", "FileshareCommunityList" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	contentList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		MediaManagerClearDisplay( self, element, controller )
		FileshareDownloadScreenshot( controller )
		return retVal
	end )
	contentList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		FileshareItemLoseFocus( element )
		return retVal
	end )
	contentList:registerEventHandler( "gain_focus", function ( element, event )
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
	contentList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		FileshareSetSelectedItem( self, element, controller, "true" )
		FileshareOpenFullscreenView( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if FileshareCanShowOptionsMenu( controller ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareCanShowOptionsMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = contentList
		UpdateDataSource( self, element, controller )
	end )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = contentList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, element, controller )
		end
	end )
	self:addElement( contentList )
	self.contentList = contentList
	
	local verticalCounter = CoD.verticalCounter.new( menu, controller )
	verticalCounter:setLeftRight( 0, 0, 428, 728 )
	verticalCounter:setTopBottom( 0, 0, 723, 761 )
	verticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "contentList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter )
	self.verticalCounter = verticalCounter
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:setLeftRight( 0, 0, 387, 768 )
	FileshareNoContent:setTopBottom( 0, 0, 337, 382 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	local FileshareNoContentGraphic = CoD.FileshareNoContentGraphic.new( menu, controller )
	FileshareNoContentGraphic:setLeftRight( 0, 0, 17, 1141 )
	FileshareNoContentGraphic:setTopBottom( 0, 0, 1.5, 718.5 )
	self:addElement( FileshareNoContentGraphic )
	self.FileshareNoContentGraphic = FileshareNoContentGraphic
	
	FileshareNoContent:linkToElementModel( contentList, nil, false, function ( model )
		FileshareNoContent:setModel( model, controller )
	end )
	contentList.navigation = {
		down = verticalCounter
	}
	verticalCounter.navigation = {
		up = contentList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	contentList.id = "contentList"
	verticalCounter.id = "verticalCounter"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.contentList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.contentList:close()
		self.verticalCounter:close()
		self.FileshareNoContent:close()
		self.FileshareNoContentGraphic:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

