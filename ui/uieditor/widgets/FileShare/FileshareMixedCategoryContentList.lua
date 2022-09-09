-- 58b49ec6c41b3b9201469f6faae7ac81
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileshareNoContentGraphic" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemLarge_NeverNormalSize" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" )
end

CoD.FileshareMixedCategoryContentList = InheritFrom( LUI.UIElement )
CoD.FileshareMixedCategoryContentList.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FileshareMixedCategoryContentList )
	self.id = "FileshareMixedCategoryContentList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 770 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FileshareNoContentGraphic = CoD.FileshareNoContentGraphic.new( menu, controller )
	FileshareNoContentGraphic:setLeftRight( true, false, 11.5, 760.5 )
	FileshareNoContentGraphic:setTopBottom( true, false, 1, 479 )
	self:addElement( FileshareNoContentGraphic )
	self.FileshareNoContentGraphic = FileshareNoContentGraphic
	
	local verticalCounter = CoD.verticalCounter.new( menu, controller )
	verticalCounter:setLeftRight( true, false, 285, 485 )
	verticalCounter:setTopBottom( true, false, 482, 507 )
	verticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetAsListVerticalCounter( self, element, "contentList" )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( verticalCounter )
	self.verticalCounter = verticalCounter
	
	local contentList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	contentList:makeFocusable()
	contentList:setLeftRight( true, false, 10.5, 735.5 )
	contentList:setTopBottom( true, false, 1, 474 )
	contentList:setWidgetType( CoD.FileshareSelectorItemLarge_NeverNormalSize )
	contentList:setHorizontalCount( 3 )
	contentList:setVerticalCount( 3 )
	contentList:setSpacing( 10 )
	contentList:setDataSource( "FilesharePublishedList" )
	contentList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" ), function ( model )
		local f4_local0 = contentList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.SelectedFileID"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	contentList:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "contentList", "FileshareCommunityList" )
		end
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	contentList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		if not ListElementHasElements( self, "contentList" ) then
			SetLoseFocusToElement( self, "contentList", controller )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		end
		return f6_local0
	end )
	contentList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		if IsFileshareCategoryScreenshot( self, element, controller ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			MediaManagerClearDisplay( self, element, controller )
			FileshareSetSelectedItemCategoryName( self, element, controller )
			FileshareDownloadScreenshot( controller, nil )
		else
			FileshareSetSelectedItem( self, element, controller, "" )
			MediaManagerClearDisplay( self, element, controller )
			FileshareSetSelectedItemCategoryName( self, element, controller )
		end
		return f7_local0
	end )
	contentList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f8_local0 = nil
		FileshareItemLoseFocus( element )
		return f8_local0
	end )
	contentList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsFileshareCategoryScreenshot( self, f10_arg0, f10_arg2 ) and FileshareHasCurrentScreenshot( f10_arg2 ) then
			FileshareSetSelectedItem( self, f10_arg0, f10_arg2, "true" )
			FileshareOpenFullscreenView( self, f10_arg0, f10_arg2, f10_arg1 )
			return true
		elseif not IsFileshareCategoryScreenshot( self, f10_arg0, f10_arg2 ) then
			ProcessListAction( self, f10_arg0, f10_arg2 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if IsFileshareCategoryScreenshot( self, f11_arg0, f11_arg2 ) and FileshareHasCurrentScreenshot( f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsFileshareCategoryScreenshot( self, f11_arg0, f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( contentList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if FileshareCanShowOptionsMenu( f12_arg2 ) and IsFileshareCategoryScreenshot( self, f12_arg0, f12_arg2 ) and FileshareHasCurrentScreenshot( f12_arg2 ) then
			OpenPopup( self, "FileshareOptions", f12_arg2, "", "" )
			PreserveThumbnails( f12_arg2, true )
			return true
		elseif FileshareCanShowOptionsMenu( f12_arg2 ) and not IsFileshareCategoryScreenshot( self, f12_arg0, f12_arg2 ) then
			OpenPopup( self, "FileshareOptions", f12_arg2, "", "" )
			PreserveThumbnails( f12_arg2, true )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if FileshareCanShowOptionsMenu( f13_arg2 ) and IsFileshareCategoryScreenshot( self, f13_arg0, f13_arg2 ) and FileshareHasCurrentScreenshot( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		elseif FileshareCanShowOptionsMenu( f13_arg2 ) and not IsFileshareCategoryScreenshot( self, f13_arg0, f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, contentList, controller )
	end )
	contentList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f15_local0 = contentList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f15_local0, controller )
		end
	end )
	self:addElement( contentList )
	self.contentList = contentList
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:setLeftRight( true, false, 261, 515 )
	FileshareNoContent:setTopBottom( true, false, 223.05, 252.95 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	FileshareNoContent:linkToElementModel( contentList, nil, false, function ( model )
		FileshareNoContent:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setLeftRight( true, false, 11.5, 760.5 )
				self.FileshareNoContentGraphic:setTopBottom( true, false, 1, 479 )
				self.clipFinished( FileshareNoContentGraphic, {} )

				verticalCounter:completeAnimation()
				self.verticalCounter:setLeftRight( true, false, 285, 485 )
				self.verticalCounter:setTopBottom( true, false, 482, 507 )
				self.clipFinished( verticalCounter, {} )

				contentList:completeAnimation()
				self.contentList:setLeftRight( true, false, 10.5, 735.5 )
				self.contentList:setTopBottom( true, false, 1, 481 )
				self.clipFinished( contentList, {} )
			end
		},
		GroupsOverviewRecentShowcase = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setLeftRight( true, false, 14.5, 388 )
				self.FileshareNoContentGraphic:setTopBottom( true, false, 1, 372.5 )
				self.clipFinished( FileshareNoContentGraphic, {} )

				verticalCounter:completeAnimation()
				self.verticalCounter:setLeftRight( true, false, 95, 295 )
				self.verticalCounter:setTopBottom( true, false, 440.5, 465.5 )
				self.clipFinished( verticalCounter, {} )

				contentList:completeAnimation()
				self.contentList:setLeftRight( true, false, 59.5, 784.5 )
				self.contentList:setTopBottom( true, false, -23, 457 )
				self.contentList:setScale( 0.9 )
				self.clipFinished( contentList, {} )

				FileshareNoContent:completeAnimation()
				self.FileshareNoContent:setLeftRight( true, false, 14.5, 379.5 )
				self.FileshareNoContent:setTopBottom( true, false, 171.75, 201.75 )
				self.clipFinished( FileshareNoContent, {} )
			end
		}
	}
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
		element.FileshareNoContentGraphic:close()
		element.verticalCounter:close()
		element.contentList:close()
		element.FileshareNoContent:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
