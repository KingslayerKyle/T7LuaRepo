-- fcd7f13350f3abbedc6134072c9fce92
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsRosterRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupApplications" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	AdminTabMakeNotFocusableIfDisabled( f2_arg0, f2_arg1 )
end

CoD.AdminTabGroupApplicationsFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupApplicationsFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupApplicationsFrame )
	self.id = "AdminTabGroupApplicationsFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local applicationsList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	applicationsList:makeFocusable()
	applicationsList:setLeftRight( true, false, 0, 374 )
	applicationsList:setTopBottom( true, false, 0, 370 )
	applicationsList:setWidgetType( CoD.GroupsRosterRow )
	applicationsList:setVerticalCount( 6 )
	applicationsList:setVerticalCounter( CoD.verticalCounter )
	applicationsList:setDataSource( "SocialPlayersList" )
	applicationsList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupApplicationsInProgress" ), function ( model )
		local f4_local0 = applicationsList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupApplicationsInProgress"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	applicationsList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	applicationsList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( applicationsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not FetchGroupApplicationsResultsLoading( f7_arg2 ) and ListHasElements( f7_arg0 ) then
			ProcessGroupApplication( self, f7_arg0, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if not FetchGroupApplicationsResultsLoading( f8_arg2 ) and ListHasElements( f8_arg0 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	applicationsList:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return FetchGroupApplicationsResultsLoading( controller )
			end
		}
	} )
	applicationsList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupApplicationsInProgress" ), function ( model )
		menu:updateElementState( applicationsList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupApplicationsInProgress"
		} )
	end )
	self:addElement( applicationsList )
	self.applicationsList = applicationsList
	
	local GroupsNoConentDetail = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
	GroupsNoConentDetail:setTopBottom( true, false, 0, 270 )
	GroupsNoConentDetail:setAlpha( 0 )
	GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
	GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
	GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_ADMIN_NO_PRIVILEGE" ) )
	GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_ADMIN_NO_PRIVILEGE_DESC" ) )
	GroupsNoConentDetail.Glow2:setRGB( 0.39, 0.07, 0.06 )
	self:addElement( GroupsNoConentDetail )
	self.GroupsNoConentDetail = GroupsNoConentDetail
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				applicationsList:completeAnimation()
				self.applicationsList:setAlpha( 1 )
				self.clipFinished( applicationsList, {} )

				GroupsNoConentDetail:completeAnimation()

				GroupsNoConentDetail.HeaderBkgd:completeAnimation()

				GroupsNoConentDetail.HeaderIcon:completeAnimation()

				GroupsNoConentDetail.Header:completeAnimation()

				GroupsNoConentDetail.Desc:completeAnimation()

				GroupsNoConentDetail.Glow2:completeAnimation()
				self.GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
				self.GroupsNoConentDetail:setTopBottom( true, false, 0, 270 )
				self.GroupsNoConentDetail:setAlpha( 0 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
				self.GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
				self.GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_ADMIN_NO_PRIVILEGE" ) )
				self.GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_ADMIN_NO_PRIVILEGE_DESC" ) )
				self.GroupsNoConentDetail.Glow2:setRGB( 0.39, 0.07, 0.06 )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				applicationsList:completeAnimation()
				self.applicationsList:setAlpha( 0 )
				self.clipFinished( applicationsList, {} )

				GroupsNoConentDetail:completeAnimation()

				GroupsNoConentDetail.HeaderBkgd:completeAnimation()

				GroupsNoConentDetail.HeaderIcon:completeAnimation()

				GroupsNoConentDetail.Header:completeAnimation()

				GroupsNoConentDetail.Desc:completeAnimation()

				GroupsNoConentDetail.Glow2:completeAnimation()
				self.GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
				self.GroupsNoConentDetail:setTopBottom( true, false, 0, 270 )
				self.GroupsNoConentDetail:setAlpha( 1 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
				self.GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
				self.GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_ADMIN_NO_PRIVILEGE" ) )
				self.GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_ADMIN_NO_PRIVILEGE_DESC" ) )
				self.GroupsNoConentDetail.Glow2:setRGB( 0.39, 0.07, 0.06 )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		},
		NoContent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				applicationsList:completeAnimation()
				self.applicationsList:setAlpha( 0 )
				self.clipFinished( applicationsList, {} )

				GroupsNoConentDetail:completeAnimation()

				GroupsNoConentDetail.HeaderBkgd:completeAnimation()

				GroupsNoConentDetail.HeaderIcon:completeAnimation()

				GroupsNoConentDetail.Header:completeAnimation()

				GroupsNoConentDetail.Desc:completeAnimation()

				GroupsNoConentDetail.Glow2:completeAnimation()
				self.GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
				self.GroupsNoConentDetail:setTopBottom( true, false, 0, 186 )
				self.GroupsNoConentDetail:setAlpha( 1 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( 1, 0.84, 0 )
				self.GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_groups_invites" ) )
				self.GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_JOIN_REQUESTS" ) )
				self.GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_JOIN_REQUESTS_DESC" ) )
				self.GroupsNoConentDetail.Glow2:setRGB( 0.3, 0.67, 0.1 )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "NoContent",
			condition = function ( menu, element, event )
				return HasNoJoinRequests( controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	applicationsList.id = "applicationsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.applicationsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.applicationsList:close()
		element.GroupsNoConentDetail:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

