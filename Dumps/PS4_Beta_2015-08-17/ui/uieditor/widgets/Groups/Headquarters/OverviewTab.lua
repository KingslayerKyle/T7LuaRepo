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
	self:addElement( Background )
	self.Background = Background
	
	local ButtonList = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 11, 367 )
	ButtonList:setTopBottom( true, false, 11, 428 )
	ButtonList:setDataSource( "GroupHeadquartersOverviewButtonList" )
	ButtonList:setWidgetType( CoD.List1ButtonLarge_Left_wHeader )
	ButtonList:setVerticalCount( 12 )
	ButtonList:setSpacing( 3 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( true, false, 805, 1152 )
	GroupsSummary:setTopBottom( true, false, 0, 460 )
	GroupsSummary:subscribeToGlobalModel( controller, "SelectedGroup", nil, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, false, 399, 782.32 )
	BorderBaked0:setTopBottom( true, false, 36.5, 275.79 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local BorderBaked1 = CoD.BorderBaked.new( menu, controller )
	BorderBaked1:setLeftRight( true, false, 399, 782.32 )
	BorderBaked1:setTopBottom( true, false, 316.5, 452 )
	BorderBaked1:setAlpha( 0.5 )
	self:addElement( BorderBaked1 )
	self.BorderBaked1 = BorderBaked1
	
	local GroupContentPanel0 = CoD.GroupContentPanel.new( menu, controller )
	GroupContentPanel0:setLeftRight( true, false, 399, 783.32 )
	GroupContentPanel0:setTopBottom( true, false, 11.5, 452 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.GroupsSummary:close()
		self.BorderBaked0:close()
		self.BorderBaked1:close()
		self.GroupContentPanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

