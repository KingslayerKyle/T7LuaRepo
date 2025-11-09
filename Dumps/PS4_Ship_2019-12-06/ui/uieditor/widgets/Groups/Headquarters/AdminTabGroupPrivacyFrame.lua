require( "ui.uieditor.widgets.Groups.GroupSliderWithTitle" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	AdminTabMakeNotFocusableIfDisabled( f1_arg0, f1_arg1 )
end

local f0_local1 = function ( f2_arg0 )
	return {
		models = {
			name = Engine.Localize( "GROUPS_PRIVACY_CAPS" ),
			desc = "",
			image = "t7_menu_social_privacy",
			optionsDatasource = "GroupPrivacyModes",
			currentSelection = nil,
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
end

local f0_local2 = function ( f3_arg0 )
	return {
		models = {
			name = Engine.Localize( "GROUPS_JOIN_APPROVAL_CAPS" ),
			desc = "",
			optionsDatasource = "GroupJoinApprovalTypes",
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
end

local f0_local3 = function ( f4_arg0 )
	local f4_local0 = {}
	table.insert( f4_local0, f0_local1( f4_arg0 ) )
	if CoD.SafeGetModelValue( CoD.perController[f4_arg0].selectedGroup, "privacy" ) == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		table.insert( f4_local0, f0_local2( f4_arg0 ) )
	end
	return f4_local0
end

local PreLoadFunc = function ( self, controller )
	DataSources.AdminTabGroupPrivacyOptions = DataSourceHelpers.ListSetup( "AdminTabGroupPrivacyOptions", f0_local3, true, nil, function ( f6_arg0, f6_arg1, f6_arg2 )
		if not f6_arg1.updateSubscription then
			f6_arg1.updateSubscription = f6_arg1:subscribeToModel( Engine.GetModel( CoD.perController[f6_arg0].selectedGroup, "privacy" ), function ()
				f6_arg1:updateDataSource()
			end, false )
		end
	end )
end

CoD.AdminTabGroupPrivacyFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupPrivacyFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupPrivacyFrame )
	self.id = "AdminTabGroupPrivacyFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ButtonList = LUI.UIList.new( menu, controller, -2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, -40, 630 )
	ButtonList:setTopBottom( true, false, 0, 132 )
	ButtonList:setWidgetType( CoD.GroupSliderWithTitle )
	ButtonList:setVerticalCount( 2 )
	ButtonList:setSpacing( -2 )
	ButtonList:setDataSource( "AdminTabGroupPrivacyOptions" )
	ButtonList:linkToElementModel( ButtonList, "selected", true, function ( model )
		local f9_local0 = ButtonList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f10_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", false )
			EnableNavigation( self, "ButtonList" )
			GroupsVariableOptionsSet( self, element, controller )
			MakeSiblingFocusable( self, "AdminOptions", controller )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", true )
			DisableNavigation( self, "ButtonList" )
			DispatchEventToChildren( element, "gain_focus", controller )
			MakeSiblingNotFocusable( self, "AdminOptions", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", false )
			EnableNavigation( self, "ButtonList" )
			DispatchEventToChildren( element, "lose_focus", controller )
			MakeSiblingFocusable( self, "AdminOptions", controller )
			GroupsVariableOptionsSet( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local GroupsNoConentDetail = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
	GroupsNoConentDetail:setTopBottom( true, false, 0, 270 )
	GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
	GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
	GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_FIND_GROUPS_CAPS" ) )
	GroupsNoConentDetail.Desc:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ) )
	GroupsNoConentDetail.Glow2:setRGB( 0.39, 0.07, 0.06 )
	self:addElement( GroupsNoConentDetail )
	self.GroupsNoConentDetail = GroupsNoConentDetail
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
				GroupsNoConentDetail:completeAnimation()
				GroupsNoConentDetail.HeaderBkgd:completeAnimation()
				self.GroupsNoConentDetail:setAlpha( 0 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( ColorSet.FactionAxis_CP.r, ColorSet.FactionAxis_CP.g, ColorSet.FactionAxis_CP.b )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0 )
				self.clipFinished( ButtonList, {} )
				GroupsNoConentDetail:completeAnimation()
				GroupsNoConentDetail.HeaderBkgd:completeAnimation()
				GroupsNoConentDetail.HeaderIcon:completeAnimation()
				GroupsNoConentDetail.Header:completeAnimation()
				GroupsNoConentDetail.Desc:completeAnimation()
				GroupsNoConentDetail.Glow2:completeAnimation()
				self.GroupsNoConentDetail:setAlpha( 1 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
				self.GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
				self.GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_ADMIN_NO_PRIVILEGE" ) )
				self.GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_ADMIN_NO_PRIVILEGE_DESC" ) )
				self.GroupsNoConentDetail.Glow2:setRGB( 0.39, 0.07, 0.06 )
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
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.GroupsNoConentDetail:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

