-- 83773dfdae9d366318f36d1926c577b7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.FindGroupsCategoryButton" )

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
	self:setTopBottom( true, false, 0, 629 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 28.93, 317 )
	Image0:setTopBottom( true, false, 0, 461 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, 0, 402 )
	BlackTint0:setTopBottom( true, false, -58, 558 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local CategoriesList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	CategoriesList:makeFocusable()
	CategoriesList:setLeftRight( true, false, 12, 386 )
	CategoriesList:setTopBottom( true, false, -44, 217 )
	CategoriesList:setWidgetType( CoD.FindGroupsCategoryButton )
	CategoriesList:setVerticalCount( 4 )
	CategoriesList:setSpacing( 7 )
	CategoriesList:setDataSource( "FindGroupsCategoryList" )
	CategoriesList:linkToElementModel( CategoriesList, "category", true, function ( model )
		local f2_local0 = CategoriesList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CategoriesList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchResultsVisible" ), function ( model )
		local f3_local0 = CategoriesList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchResultsVisible"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f4_local0
	end )
	CategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( CategoriesList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if IsSelfModelValueEqualTo( f6_arg0, f6_arg2, "category", "params" ) and IsModelValueTrue( f6_arg2, "groups.searchResultsVisible" ) then
			UpdateFindGroupsTabSearchFrameWidget( self, f6_arg0, f6_arg2 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if IsSelfModelValueEqualTo( f7_arg0, f7_arg2, "category", "params" ) and IsModelValueTrue( f7_arg2, "groups.searchResultsVisible" ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "GROUPS_UPDATE_SEARCH" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CategoriesList )
	self.CategoriesList = CategoriesList
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1035 )
	Background:setTopBottom( true, false, 0, 460 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FindGroupsTabFrame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	FindGroupsTabFrame:setLeftRight( true, false, 402, 1152 )
	FindGroupsTabFrame:setTopBottom( true, false, -42, 509 )
	self:addElement( FindGroupsTabFrame )
	self.FindGroupsTabFrame = FindGroupsTabFrame
	
	FindGroupsTabFrame:linkToElementModel( CategoriesList, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			FindGroupsTabFrame:changeFrameWidget( frameWidget )
		end
	end )
	CategoriesList.navigation = {
		right = FindGroupsTabFrame
	}
	FindGroupsTabFrame.navigation = {
		left = CategoriesList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CategoriesList.id = "CategoriesList"
	FindGroupsTabFrame.id = "FindGroupsTabFrame"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CategoriesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CategoriesList:close()
		element.FindGroupsTabFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
