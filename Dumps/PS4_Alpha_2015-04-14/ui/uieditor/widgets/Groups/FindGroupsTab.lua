require( "ui.uieditor.widgets.Groups.GroupsItemRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbarNew" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )

CoD.FindGroupsTab = InheritFrom( LUI.UIElement )
CoD.FindGroupsTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FindGroupsTab )
	self.id = "FindGroupsTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1035 )
	Background:setTopBottom( true, false, 0, 460 )
	Background:setRGB( 1, 1, 1 )
	Background:setAlpha( 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonList = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 10, 366 )
	ButtonList:setTopBottom( true, false, 11, 408 )
	ButtonList:setRGB( 1, 1, 1 )
	ButtonList:setDataSource( "FindGroupsButtonList" )
	ButtonList:setWidgetType( CoD.GroupsItemRow )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setSpacing( 3 )
	ButtonList:setVerticalScrollbar( CoD.verticalScrollbarNew )
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
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	GroupsSummary:linkToElementModel( ButtonList, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
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
		CoD.FindGroupsTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

