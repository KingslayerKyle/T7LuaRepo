-- 47997c8cb8565b9731e07e583419845d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileshareNoContentGraphic" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareScreenshotSelectorItemLarge" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" )
end

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
	self:setLeftRight( true, false, 0, 770 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FileshareNoContentGraphic0 = CoD.FileshareNoContentGraphic.new( menu, controller )
	FileshareNoContentGraphic0:setLeftRight( true, false, 11.5, 760.5 )
	FileshareNoContentGraphic0:setTopBottom( true, false, 1, 479 )
	self:addElement( FileshareNoContentGraphic0 )
	self.FileshareNoContentGraphic0 = FileshareNoContentGraphic0
	
	local contentList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	contentList:makeFocusable()
	contentList:setLeftRight( true, false, 10.5, 765.5 )
	contentList:setTopBottom( true, false, 1, 477 )
	contentList:setWidgetType( CoD.FileshareScreenshotSelectorItemLarge )
	contentList:setHorizontalCount( 3 )
	contentList:setVerticalCount( 3 )
	contentList:setSpacing( 10 )
	contentList:setDataSource( "FilesharePublishedList" )
	contentList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" ), function ( model )
		local f3_local0 = contentList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.SelectedFileID"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
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
	contentList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		if not ListElementHasElements( self, "contentList" ) then
			SetLoseFocusToElement( self, "contentList", controller )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		end
		return f5_local0
	end )
	contentList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		MediaManagerClearDisplay( self, element, controller )
		FileshareDownloadScreenshot( controller, nil )
		return f6_local0
	end )
	contentList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f7_local0 = nil
		FileshareItemLoseFocus( element )
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
		if FileshareHasCurrentScreenshot( f9_arg2 ) then
			FileshareSetSelectedItem( self, f9_arg0, f9_arg2, "true" )
			FileshareOpenFullscreenView( self, f9_arg0, f9_arg2, f9_arg1 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if FileshareHasCurrentScreenshot( f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if FileshareCanShowOptionsMenu( f11_arg2 ) and FileshareHasCurrentScreenshot( f11_arg2 ) then
			OpenPopup( self, "FileshareOptions", f11_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if FileshareCanShowOptionsMenu( f12_arg2 ) and FileshareHasCurrentScreenshot( f12_arg2 ) then
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
		end
	end )
	self:addElement( contentList )
	self.contentList = contentList
	
	local verticalCounter = CoD.verticalCounter.new( menu, controller )
	verticalCounter:setLeftRight( true, false, 285, 485 )
	verticalCounter:setTopBottom( true, false, 482.5, 507.5 )
	verticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		SetAsListVerticalCounter( self, element, "contentList" )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( verticalCounter )
	self.verticalCounter = verticalCounter
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:setLeftRight( true, false, 261, 515 )
	FileshareNoContent:setTopBottom( true, false, 223.05, 252.95 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	FileshareNoContent:linkToElementModel( contentList, nil, false, function ( model )
		FileshareNoContent:setModel( model, controller )
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) then
			HideElement( self, "contentList" )
			HideElement( self, "verticalCounter" )
			DisableNavigation( self, "contentList" )
		else
			ShowElement( self, "contentList" )
			ShowElement( self, "verticalCounter" )
			EnableNavigation( self, "contentList" )
		end
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
		element.FileshareNoContentGraphic0:close()
		element.contentList:close()
		element.verticalCounter:close()
		element.FileshareNoContent:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

