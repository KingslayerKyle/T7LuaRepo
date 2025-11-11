require( "ui.uieditor.widgets.FileShare.FileshareCategoryContentList" )
require( "ui.uieditor.widgets.Groups.GroupContentPanel" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )

local PostLoadFunc = function ( self, controller )
	FileshareCategorySelectorCategoryChanged( controller, "recent", nil, true )
end

CoD.OverviewTab = InheritFrom( LUI.UIElement )
CoD.OverviewTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OverviewTab )
	self.id = "OverviewTab"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 691 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 1, 1, -1173, 0 )
	Background:setTopBottom( 0, 0, 0, 690 )
	Background:setRGB( 0.14, 0.19, 0.23 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( 0, 0, 1148, 1668 )
	GroupsSummary:setTopBottom( 0, 0, -75, 635 )
	GroupsSummary:subscribeToGlobalModel( controller, "SelectedGroup", nil, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local GroupContentPanel0 = CoD.GroupContentPanel.new( menu, controller )
	GroupContentPanel0:setLeftRight( 0, 0, 639, 1215 )
	GroupContentPanel0:setTopBottom( 0, 0, -103, 559 )
	self:addElement( GroupContentPanel0 )
	self.GroupContentPanel0 = GroupContentPanel0
	
	local Banner0 = LUI.UIImage.new()
	Banner0:setLeftRight( 0, 0, 13, 499 )
	Banner0:setTopBottom( 0, 0, -67, -25 )
	Banner0:setRGB( 0, 0, 0 )
	Banner0:setAlpha( 0.7 )
	self:addElement( Banner0 )
	self.Banner0 = Banner0
	
	local Featured = LUI.UIText.new()
	Featured:setLeftRight( 0, 0, 21, 377 )
	Featured:setTopBottom( 0, 0, -63, -33 )
	Featured:setText( Engine.Localize( "GROUPS_RECENT_SHOWCASE" ) )
	Featured:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Featured )
	self.Featured = Featured
	
	local FileshareCategoryContentList = CoD.FileshareCategoryContentList.new( menu, controller )
	FileshareCategoryContentList:mergeStateConditions( {
		{
			stateName = "GroupsOverviewRecentShowcase",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	FileshareCategoryContentList:setLeftRight( 0, 0, 0, 500 )
	FileshareCategoryContentList:setTopBottom( 0, 0, 0, 788 )
	FileshareCategoryContentList.contentList:setHorizontalCount( 1 )
	self:addElement( FileshareCategoryContentList )
	self.FileshareCategoryContentList = FileshareCategoryContentList
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 0, 603 )
	BlackTint:setTopBottom( 0, 0, -87, 829 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	FileshareCategoryContentList.id = "FileshareCategoryContentList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.FileshareCategoryContentList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsSummary:close()
		self.GroupContentPanel0:close()
		self.FileshareCategoryContentList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

