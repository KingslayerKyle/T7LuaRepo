require( "ui.uieditor.widgets.Groups.FindGroupsCategoryButton" )
require( "ui.uieditor.widgets.Groups.FindGroupsGridButton" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

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
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 943 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 43, 475 )
	Image0:setTopBottom( 0, 0, 0, 692 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( 0, 0, 0, 603 )
	BlackTint0:setTopBottom( 0, 0, -87, 837 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local CategoriesList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	CategoriesList:makeFocusable()
	CategoriesList:setLeftRight( 0, 0, 18, 579 )
	CategoriesList:setTopBottom( 0, 0, -65, 325 )
	CategoriesList:setWidgetType( CoD.FindGroupsCategoryButton )
	CategoriesList:setVerticalCount( 4 )
	CategoriesList:setSpacing( 10 )
	CategoriesList:setDataSource( "FindGroupsCategoryList" )
	CategoriesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		ChangeFindGroupsCategory( self, element, controller )
		return retVal
	end )
	self:addElement( CategoriesList )
	self.CategoriesList = CategoriesList
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1552 )
	Background:setTopBottom( 0, 0, 0, 690 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GroupsGrid = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	GroupsGrid:makeFocusable()
	GroupsGrid:setLeftRight( 0, 0, 624, 1146 )
	GroupsGrid:setTopBottom( 0, 0, -63, 539 )
	GroupsGrid:setWidgetType( CoD.FindGroupsGridButton )
	GroupsGrid:setVerticalCount( 6 )
	GroupsGrid:setSpacing( 4 )
	GroupsGrid:setVerticalCounter( CoD.verticalCounter )
	GroupsGrid:setDataSource( "FindGroupsButtonList" )
	GroupsGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetSelectedGroup( self, element, controller )
		return retVal
	end )
	GroupsGrid:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	GroupsGrid:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( GroupsGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( GroupsGrid )
	self.GroupsGrid = GroupsGrid
	
	local GroupsSummary = CoD.GroupsSummary.new( menu, controller )
	GroupsSummary:setLeftRight( 0, 0, 1148, 1668 )
	GroupsSummary:setTopBottom( 0, 0, -75, 635 )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	GroupsSummary:linkToElementModel( GroupsGrid, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	CategoriesList.navigation = {
		right = GroupsGrid
	}
	GroupsGrid.navigation = {
		left = CategoriesList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CategoriesList.id = "CategoriesList"
	GroupsGrid.id = "GroupsGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CategoriesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CategoriesList:close()
		self.GroupsGrid:close()
		self.GroupsSummary:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

