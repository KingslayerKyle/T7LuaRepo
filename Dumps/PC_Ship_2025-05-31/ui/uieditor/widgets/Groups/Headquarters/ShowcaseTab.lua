require( "ui.uieditor.widgets.FileShare.FileshareCategorySelectoryListWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_GROUPS )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false ), "summaryFileUpdated", false )
end

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
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 0, 310.04 )
	BlackTint:setTopBottom( true, false, -29, 582 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1035 )
	Background:setTopBottom( true, false, 0, 460 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FileshareCategorySelectoryListWidget = CoD.FileshareCategorySelectoryListWidget.new( menu, controller )
	FileshareCategorySelectoryListWidget:setLeftRight( true, false, 14, 294 )
	FileshareCategorySelectoryListWidget:setTopBottom( true, false, 0, 500 )
	FileshareCategorySelectoryListWidget.itemList:setDataSource( "GroupsShowcaseButtons" )
	self:addElement( FileshareCategorySelectoryListWidget )
	self.FileshareCategorySelectoryListWidget = FileshareCategorySelectoryListWidget
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( true, false, 310.04, 1113.42 )
	Frame:setTopBottom( true, false, 0, 495 )
	Frame:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		SetFocusToElement( self, "FileshareCategorySelectoryListWidget", controller )
		return f3_local0
	end )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame:linkToElementModel( FileshareCategorySelectoryListWidget.itemList, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			Frame:changeFrameWidget( tabWidget )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.FileshareCategorySelectoryListWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareCategorySelectoryListWidget:close()
		element.Frame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

