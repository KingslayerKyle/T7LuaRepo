require( "ui.uieditor.widgets.FileShare.FileshareCategorySelectoryListWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )

CoD.ShowcaseTab = InheritFrom( LUI.UIElement )
CoD.ShowcaseTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ShowcaseTab )
	self.id = "ShowcaseTab"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 691 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 0, 456 )
	BlackTint:setTopBottom( 0, 0, -84, 825 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1552 )
	Background:setTopBottom( 0, 0, 0, 690 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FileshareCategorySelectoryListWidget = CoD.FileshareCategorySelectoryListWidget.new( menu, controller )
	FileshareCategorySelectoryListWidget:setLeftRight( 0, 0, 18, 438 )
	FileshareCategorySelectoryListWidget:setTopBottom( 0, 0, -65, 685 )
	FileshareCategorySelectoryListWidget.itemList:setDataSource( "GroupsShowcaseButtons" )
	self:addElement( FileshareCategorySelectoryListWidget )
	self.FileshareCategorySelectoryListWidget = FileshareCategorySelectoryListWidget
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( 0, 0, 465, 1670 )
	Frame:setTopBottom( 0, 0, -64, 743 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local FileshareSpinner = CoD.FileshareSpinner.new( menu, controller )
	FileshareSpinner:setLeftRight( 0, 0, 1589, 1685 )
	FileshareSpinner:setTopBottom( 0, 0, 592, 688 )
	FileshareSpinner:setScale( 0.8 )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	Frame:linkToElementModel( FileshareCategorySelectoryListWidget.itemList, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
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
		self.Frame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

