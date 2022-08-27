-- 53655892bce9b5422a799f8cd89759ce
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FileshareCategorySelectoryListWidget" )
require( "ui.uieditor.widgets.FileShare.MyShowcase_CategoryLabel" )

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
	
	local FileshareCategorySelectoryListWidget = CoD.FileshareCategorySelectoryListWidget.new( menu, controller )
	FileshareCategorySelectoryListWidget:setLeftRight( true, false, 10, 301 )
	FileshareCategorySelectoryListWidget:setTopBottom( true, false, 0, 500 )
	FileshareCategorySelectoryListWidget.itemList:setDataSource( "FileshareCategoriesList" )
	self:addElement( FileshareCategorySelectoryListWidget )
	self.FileshareCategorySelectoryListWidget = FileshareCategorySelectoryListWidget
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( true, false, 320.04, 1123.42 )
	Frame:setTopBottom( true, false, 0, 538.35 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local MyShowcaseCategoryLabel = CoD.MyShowcase_CategoryLabel.new( menu, controller )
	MyShowcaseCategoryLabel:setLeftRight( true, false, 331.04, 1159 )
	MyShowcaseCategoryLabel:setTopBottom( true, false, -23.38, -4.38 )
	self:addElement( MyShowcaseCategoryLabel )
	self.MyShowcaseCategoryLabel = MyShowcaseCategoryLabel
	
	Frame:linkToElementModel( FileshareCategorySelectoryListWidget.itemList, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			Frame:changeFrameWidget( tabWidget )
		end
	end )
	MyShowcaseCategoryLabel:linkToElementModel( FileshareCategorySelectoryListWidget.itemList, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			MyShowcaseCategoryLabel.categoryName:setText( Engine.Localize( displayText ) )
		end
	end )
	FileshareCategorySelectoryListWidget.navigation = {
		right = Frame
	}
	Frame.navigation = {
		left = FileshareCategorySelectoryListWidget
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "summaryFileUpdated", function ( model )
		local f5_local0 = self
		FileshareSummaryFileUpdate( controller )
	end )
	FileshareCategorySelectoryListWidget.id = "FileshareCategorySelectoryListWidget"
	Frame.id = "Frame"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.FileshareCategorySelectoryListWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareCategorySelectoryListWidget:close()
		element.MyShowcaseCategoryLabel:close()
		element.Frame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

