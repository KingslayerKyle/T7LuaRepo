require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Groups.GroupContentPanel" )

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
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, true, -782, 0 )
	Background:setTopBottom( true, false, 0, 460 )
	Background:setRGB( 0.14, 0.19, 0.23 )
	Background:setAlpha( 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonList = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 11, 367 )
	ButtonList:setTopBottom( true, false, 11, 428 )
	ButtonList:setRGB( 1, 1, 1 )
	ButtonList:setDataSource( "GroupHeadquartersOverviewButtonList" )
	ButtonList:setWidgetType( CoD.List1ButtonLarge_Left_wHeader )
	ButtonList:setVerticalCount( 12 )
	ButtonList:setSpacing( 3 )
	ButtonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( true, false, 805, 1152 )
	GroupsSummary:setTopBottom( true, false, 0, 460 )
	GroupsSummary:setRGB( 1, 1, 1 )
	GroupsSummary:subscribeToGlobalModel( controller, "SelectedGroup", nil, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, false, 399, 782.32 )
	BorderBaked0:setTopBottom( true, false, 36.5, 275.79 )
	BorderBaked0:setRGB( 1, 1, 1 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local BorderBaked1 = CoD.BorderBaked.new( menu, controller )
	BorderBaked1:setLeftRight( true, false, 399, 782.32 )
	BorderBaked1:setTopBottom( true, false, 316.5, 452 )
	BorderBaked1:setRGB( 1, 1, 1 )
	BorderBaked1:setAlpha( 0.5 )
	self:addElement( BorderBaked1 )
	self.BorderBaked1 = BorderBaked1
	
	local GroupContentPanel0 = CoD.GroupContentPanel.new( menu, controller )
	GroupContentPanel0:setLeftRight( true, false, 399, 783.32 )
	GroupContentPanel0:setTopBottom( true, false, 11.5, 452 )
	GroupContentPanel0:setRGB( 1, 1, 1 )
	self:addElement( GroupContentPanel0 )
	self.GroupContentPanel0 = GroupContentPanel0
	
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.ButtonList:close()
		self.GroupsSummary:close()
		self.BorderBaked0:close()
		self.BorderBaked1:close()
		self.GroupContentPanel0:close()
		CoD.OverviewTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

