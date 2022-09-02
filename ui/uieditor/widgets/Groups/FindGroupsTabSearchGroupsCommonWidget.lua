-- 461f24451b59059cd0e248922722f71f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.FindGroupsGridButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounterNoNumbers" )
require( "ui.uieditor.widgets.Groups.GroupsSummaryForSearch" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.GroupsGrid:registerEventHandler( "lose_list_focus", function ( element, event )
		local f2_local0 = nil
		f1_arg0.GroupsSummaryForSearch.buttonprompt:setState( "Hidden" )
		return f2_local0
	end )
	f1_arg0.GroupsGrid:registerEventHandler( "gain_list_focus", function ( element, event )
		local f3_local0 = nil
		f1_arg0.GroupsSummaryForSearch.buttonprompt:setState( "DefaultState" )
		return f3_local0
	end )
end

CoD.FindGroupsTabSearchGroupsCommonWidget = InheritFrom( LUI.UIElement )
CoD.FindGroupsTabSearchGroupsCommonWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FindGroupsTabSearchGroupsCommonWidget )
	self.id = "FindGroupsTabSearchGroupsCommonWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 708 )
	self:setTopBottom( true, false, 0, 473 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupsGrid = LUI.UIList.new( menu, controller, 5, 0, function ( f5_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f5_arg0, "friendsSearchType" ) ) == "friends"
	end, false, false, 0, 0, false, false )
	GroupsGrid:makeFocusable()
	GroupsGrid:setLeftRight( true, false, 0, 348 )
	GroupsGrid:setTopBottom( true, false, 0, 415 )
	GroupsGrid:setWidgetType( CoD.FindGroupsGridButton )
	GroupsGrid:setVerticalCount( 6 )
	GroupsGrid:setSpacing( 5 )
	GroupsGrid:setVerticalCounter( CoD.verticalCounterNoNumbers )
	GroupsGrid:setDataSource( "FindGroupsButtonList" )
	GroupsGrid:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchGroupsInProgress" ), function ( model )
		local f6_local0 = GroupsGrid
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchGroupsInProgress"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	GroupsGrid:linkToElementModel( GroupsGrid, "groupId", true, function ( model )
		local f7_local0 = GroupsGrid
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	GroupsGrid:linkToElementModel( GroupsGrid, "name", true, function ( model )
		local f8_local0 = GroupsGrid
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	GroupsGrid:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.skipViewFriendsInGroup" ), function ( model )
		local f9_local0 = GroupsGrid
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.skipViewFriendsInGroup"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	GroupsGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		FetchHighlightedGroupJoinApprovalType( self, element, controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
		return f10_local0
	end )
	GroupsGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f11_local0
	end )
	GroupsGrid:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( GroupsGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if not SearchGroupResultsLoading( f13_arg0, f13_arg2 ) and ListHasElements( f13_arg0 ) and not IsSelfModelValueEqualTo( f13_arg0, f13_arg2, "groupId", Engine.StringToXUIDDecimal( "0" ) ) and IsSelfModelValueNonEmptyString( f13_arg0, f13_arg2, "name" ) then
			SetSelectedGroup( self, f13_arg0, f13_arg2 )
			ProcessListAction( self, f13_arg0, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if not SearchGroupResultsLoading( f14_arg0, f14_arg2 ) and ListHasElements( f14_arg0 ) and not IsSelfModelValueEqualTo( f14_arg0, f14_arg2, "groupId", Engine.StringToXUIDDecimal( "0" ) ) and IsSelfModelValueNonEmptyString( f14_arg0, f14_arg2, "name" ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( GroupsGrid, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if not SearchGroupResultsLoading( f15_arg0, f15_arg2 ) and ListHasElements( f15_arg0 ) and not IsSelfModelValueEqualTo( f15_arg0, f15_arg2, "groupId", Engine.StringToXUIDDecimal( "0" ) ) and IsSelfModelValueNonEmptyString( f15_arg0, f15_arg2, "name" ) then
			SetSelectedGroup( self, f15_arg0, f15_arg2 )
			OpenGroupOptionsPopup( self, f15_arg0, f15_arg2 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if not SearchGroupResultsLoading( f16_arg0, f16_arg2 ) and ListHasElements( f16_arg0 ) and not IsSelfModelValueEqualTo( f16_arg0, f16_arg2, "groupId", Engine.StringToXUIDDecimal( "0" ) ) and IsSelfModelValueNonEmptyString( f16_arg0, f16_arg2, "name" ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( GroupsGrid, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if not SearchGroupResultsLoading( f17_arg0, f17_arg2 ) and ListHasElements( f17_arg0 ) and not IsSelfModelValueEqualTo( f17_arg0, f17_arg2, "groupId", Engine.StringToXUIDDecimal( "0" ) ) and IsSelfModelValueNonEmptyString( f17_arg0, f17_arg2, "name" ) and not IsModelValueTrue( f17_arg2, "groups.skipViewFriendsInGroup" ) then
			SetSelectedGroup( self, f17_arg0, f17_arg2 )
			OpenGroupFriendsPopup( self, f17_arg0, f17_arg2 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if not SearchGroupResultsLoading( f18_arg0, f18_arg2 ) and ListHasElements( f18_arg0 ) and not IsSelfModelValueEqualTo( f18_arg0, f18_arg2, "groupId", Engine.StringToXUIDDecimal( "0" ) ) and IsSelfModelValueNonEmptyString( f18_arg0, f18_arg2, "name" ) and not IsModelValueTrue( f18_arg2, "groups.skipViewFriendsInGroup" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "GROUPS_VIEW_GROUP_FRIENDS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( GroupsGrid )
	self.GroupsGrid = GroupsGrid
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( true, false, 285, 413 )
	Spinner:setTopBottom( true, false, 167.63, 295.63 )
	Spinner:setAlpha( 0 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local NoResults = LUI.UIText.new()
	NoResults:setLeftRight( true, false, 0, 708 )
	NoResults:setTopBottom( true, false, 191.5, 231.5 )
	NoResults:setAlpha( 0 )
	NoResults:setText( Engine.Localize( "GROUPS_SEARCH_NO_RESULTS" ) )
	NoResults:setTTF( "fonts/default.ttf" )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoResults )
	self.NoResults = NoResults
	
	local GroupsSummaryForSearch = CoD.GroupsSummaryForSearch.new( menu, controller )
	GroupsSummaryForSearch:setLeftRight( true, false, 361, 708 )
	GroupsSummaryForSearch:setTopBottom( true, false, -7, 466.25 )
	GroupsSummaryForSearch:mergeStateConditions( {
		{
			stateName = "FriendsGroups",
			condition = function ( menu, element, event )
				local f19_local0
				if not IsModelValueTrue( controller, "groups.skipViewFriendsInGroup" ) then
					f19_local0 = not IsPC()
				else
					f19_local0 = false
				end
				return f19_local0
			end
		}
	} )
	GroupsSummaryForSearch:linkToElementModel( GroupsSummaryForSearch, "groupId", true, function ( model )
		menu:updateElementState( GroupsSummaryForSearch, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	GroupsSummaryForSearch:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.skipViewFriendsInGroup" ), function ( model )
		menu:updateElementState( GroupsSummaryForSearch, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.skipViewFriendsInGroup"
		} )
	end )
	self:addElement( GroupsSummaryForSearch )
	self.GroupsSummaryForSearch = GroupsSummaryForSearch
	
	GroupsSummaryForSearch:linkToElementModel( GroupsGrid, nil, false, function ( model )
		GroupsSummaryForSearch:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GroupsGrid:completeAnimation()
				self.GroupsGrid:setAlpha( 1 )
				self.clipFinished( GroupsGrid, {} )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )

				NoResults:completeAnimation()
				self.NoResults:setAlpha( 0 )
				self.clipFinished( NoResults, {} )

				GroupsSummaryForSearch:completeAnimation()
				self.GroupsSummaryForSearch:setAlpha( 1 )
				self.clipFinished( GroupsSummaryForSearch, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GroupsGrid:completeAnimation()
				self.GroupsGrid:setAlpha( 0 )
				self.clipFinished( GroupsGrid, {} )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				self.clipFinished( Spinner, {} )

				NoResults:completeAnimation()
				self.NoResults:setAlpha( 0 )
				self.clipFinished( NoResults, {} )

				GroupsSummaryForSearch:completeAnimation()
				self.GroupsSummaryForSearch:setAlpha( 0 )
				self.clipFinished( GroupsSummaryForSearch, {} )
			end
		},
		NoResults = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GroupsGrid:completeAnimation()
				self.GroupsGrid:setAlpha( 0 )
				self.clipFinished( GroupsGrid, {} )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )

				NoResults:completeAnimation()
				self.NoResults:setAlpha( 1 )
				self.clipFinished( NoResults, {} )

				GroupsSummaryForSearch:completeAnimation()
				self.GroupsSummaryForSearch:setAlpha( 0 )
				self.clipFinished( GroupsSummaryForSearch, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "groups.searchGroupsWaitingToStart" )
			end
		},
		{
			stateName = "NoResults",
			condition = function ( menu, element, event )
				local f27_local0 = IsModelValueEqualTo( controller, "groups.searchGroupsResultsCount", 0 )
				if f27_local0 then
					if not IsModelValueTrue( controller, "groups.searchGroupsWaitingToStart" ) then
						f27_local0 = not IsModelValueTrue( controller, "groups.searchGroupsInProgress" )
					else
						f27_local0 = false
					end
				end
				return f27_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchGroupsWaitingToStart" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchGroupsWaitingToStart"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchGroupsResultsCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchGroupsResultsCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchGroupsInProgress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchGroupsInProgress"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "groups.searchGroupsInProgress", function ( model )
		local f31_local0 = self
		if IsModelValueTrue( controller, "groups.searchGroupsInProgress" ) then
			DisableNavigation( self, "GroupsGrid" )
		else
			EnableNavigation( self, "GroupsGrid" )
		end
	end )
	GroupsGrid.id = "GroupsGrid"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GroupsGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsGrid:close()
		element.GroupsSummaryForSearch:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

