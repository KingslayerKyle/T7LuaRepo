require( "ui.uieditor.widgets.FileShare.FileshareCategorySelectoryListWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )
require( "ui.uieditor.widgets.FileShare.MyShowcase_CategoryLabel" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	local verticalCountModel = Engine.CreateModel( rootModel, "listVerticalCount", false )
	local sizeModel = Engine.CreateModel( rootModel, "isNormalSize", false )
	local summaryFileUpdatedModel = Engine.CreateModel( rootModel, "summaryFileUpdated", false )
	local itemsCountModel = Engine.CreateModel( rootModel, "itemsCount", false )
	Engine.SetModelValue( sizeModel, false )
	Engine.SetModelValue( verticalCountModel, 3 )
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
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 870 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FileshareCategorySelectoryListWidget = CoD.FileshareCategorySelectoryListWidget.new( menu, controller )
	FileshareCategorySelectoryListWidget:setLeftRight( 0, 0, 15, 451 )
	FileshareCategorySelectoryListWidget:setTopBottom( 0, 0, 0, 750 )
	FileshareCategorySelectoryListWidget.itemList:setDataSource( "FileshareCategoriesList" )
	self:addElement( FileshareCategorySelectoryListWidget )
	self.FileshareCategorySelectoryListWidget = FileshareCategorySelectoryListWidget
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( 0, 0, 480, 1685 )
	Frame:setTopBottom( 0, 0, -2, 806 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local FileshareSpinner = CoD.FileshareSpinner.new( menu, controller )
	FileshareSpinner:setLeftRight( 0, 0, 1589, 1685 )
	FileshareSpinner:setTopBottom( 0, 0, 712, 808 )
	FileshareSpinner:setScale( 0.8 )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local MyShowcaseCategoryLabel = CoD.MyShowcase_CategoryLabel.new( menu, controller )
	MyShowcaseCategoryLabel:setLeftRight( 0, 0, 497, 1739 )
	MyShowcaseCategoryLabel:setTopBottom( 0, 0, -35, -7 )
	self:addElement( MyShowcaseCategoryLabel )
	self.MyShowcaseCategoryLabel = MyShowcaseCategoryLabel
	
	Frame:linkToElementModel( FileshareCategorySelectoryListWidget.itemList, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
		end
	end )
	MyShowcaseCategoryLabel:linkToElementModel( FileshareCategorySelectoryListWidget.itemList, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MyShowcaseCategoryLabel.categoryName:setText( Engine.Localize( modelValue ) )
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
		local element = self
		FileshareSummaryFileUpdate( controller )
	end )
	FileshareCategorySelectoryListWidget.id = "FileshareCategorySelectoryListWidget"
	Frame.id = "Frame"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.FileshareCategorySelectoryListWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareCategorySelectoryListWidget:close()
		self.FileshareSpinner:close()
		self.MyShowcaseCategoryLabel:close()
		self.Frame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

