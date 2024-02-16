-- d77a571f4d5521eb5fbe4e084db616a3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsRosterRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupAdmins" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	AdminTabMakeNotFocusableIfDisabled( f2_arg0, f2_arg1 )
end

CoD.AdminTabGroupAdminsTransferOwnershipFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupAdminsTransferOwnershipFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupAdminsTransferOwnershipFrame )
	self.id = "AdminTabGroupAdminsTransferOwnershipFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local AdminsList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	AdminsList:makeFocusable()
	AdminsList:setLeftRight( true, false, 0, 374 )
	AdminsList:setTopBottom( true, false, 0, 370 )
	AdminsList:setWidgetType( CoD.GroupsRosterRow )
	AdminsList:setVerticalCount( 6 )
	AdminsList:setVerticalCounter( CoD.verticalCounter )
	AdminsList:setDataSource( "SocialPlayersList" )
	AdminsList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	AdminsList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( AdminsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		SetSelectedFriendXUID( self, f6_arg0, f6_arg2 )
		PromoteSelectedGroupAdminToOwner( self, f6_arg0, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( AdminsList )
	self.AdminsList = AdminsList
	
	local GroupsNoConentDetail = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
	GroupsNoConentDetail:setTopBottom( true, false, 0, 185 )
	GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
	GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_FIND_GROUPS_CAPS" ) )
	GroupsNoConentDetail.Desc:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ) )
	GroupsNoConentDetail.Glow2:setRGB( 0.3, 0.67, 0.1 )
	self:addElement( GroupsNoConentDetail )
	self.GroupsNoConentDetail = GroupsNoConentDetail
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				AdminsList:completeAnimation()
				self.AdminsList:setAlpha( 1 )
				self.clipFinished( AdminsList, {} )

				GroupsNoConentDetail:completeAnimation()

				GroupsNoConentDetail.HeaderBkgd:completeAnimation()
				self.GroupsNoConentDetail:setAlpha( 0 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( ColorSet.FactionAxis_CP.r, ColorSet.FactionAxis_CP.g, ColorSet.FactionAxis_CP.b )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		},
		NoContent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				AdminsList:completeAnimation()
				self.AdminsList:setAlpha( 0 )
				self.clipFinished( AdminsList, {} )

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
				self.GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
				self.GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_ADMINS" ) )
				self.GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_ADMINS_DESC" ) )
				self.GroupsNoConentDetail.Glow2:setRGB( 0.3, 0.67, 0.1 )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoContent",
			condition = function ( menu, element, event )
				return HasNoGroupAdmin( controller )
			end
		}
	} )
	AdminsList.id = "AdminsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.AdminsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AdminsList:close()
		element.GroupsNoConentDetail:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
