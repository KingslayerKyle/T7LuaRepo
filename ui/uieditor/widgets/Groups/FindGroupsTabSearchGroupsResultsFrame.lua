-- 794eab75ee70e30b501ca6cd9ec1d9b8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.FindGroupsTabSearchGroupsCommonWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "groups.paramSearchStarted" ) ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "groups.paramSearchStarted" ), false )
	else
		Engine.ClearLastGroupSearchResults( f1_arg1 )
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "groups.searchGroupsWaitingToStart" ), true )
		f1_arg0.setVisibleTimer = LUI.UITimer.newElementTimer( 1500, true, function ()
			SearchGroupsBySearchType( f1_arg0, f1_arg0, f1_arg1, Enum.GroupSearchType.GROUP_SEARCH_TYPE_SEARCH_BY_PARAMS )
			f1_arg0.setVisibleTimer = nil
		end )
		f1_arg0:addElement( f1_arg0.setVisibleTimer )
	end
end

CoD.FindGroupsTabSearchGroupsResultsFrame = InheritFrom( LUI.UIElement )
CoD.FindGroupsTabSearchGroupsResultsFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FindGroupsTabSearchGroupsResultsFrame )
	self.id = "FindGroupsTabSearchGroupsResultsFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 488 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FindGroupsTabSearchGroupsCommonWidget = CoD.FindGroupsTabSearchGroupsCommonWidget.new( menu, controller )
	FindGroupsTabSearchGroupsCommonWidget:setLeftRight( true, false, 0, 708 )
	FindGroupsTabSearchGroupsCommonWidget:setTopBottom( true, false, 0, 473 )
	self:addElement( FindGroupsTabSearchGroupsCommonWidget )
	self.FindGroupsTabSearchGroupsCommonWidget = FindGroupsTabSearchGroupsCommonWidget
	
	FindGroupsTabSearchGroupsCommonWidget.id = "FindGroupsTabSearchGroupsCommonWidget"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.FindGroupsTabSearchGroupsCommonWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FindGroupsTabSearchGroupsCommonWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

