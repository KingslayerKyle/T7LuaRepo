require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.Groups.GroupsSubTitle" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	AdminTabMakeNotFocusableIfDisabled( f1_arg0, f1_arg1 )
end

CoD.AdminTabGroupNameFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupNameFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupNameFrame )
	self.id = "AdminTabGroupNameFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupsInputButton = CoD.GroupsInputButton.new( menu, controller )
	GroupsInputButton:setLeftRight( true, false, -1, 384 )
	GroupsInputButton:setTopBottom( true, false, 39, 75 )
	GroupsInputButton:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			GroupsInputButton.Text:setText( name )
		end
	end )
	GroupsInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	GroupsInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( GroupsInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if HasAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_NAME ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_NAME ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( GroupsInputButton )
	self.GroupsInputButton = GroupsInputButton
	
	local GroupsSubTitle0 = CoD.GroupsSubTitle.new( menu, controller )
	GroupsSubTitle0:setLeftRight( true, false, -2, 166 )
	GroupsSubTitle0:setTopBottom( true, false, 0, 32 )
	self:addElement( GroupsSubTitle0 )
	self.GroupsSubTitle0 = GroupsSubTitle0
	
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
	
	self.GroupsSubTitle0:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			GroupsSubTitle0.weaponNameLabel:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				GroupsInputButton:completeAnimation()
				self.GroupsInputButton:setAlpha( 1 )
				self.clipFinished( GroupsInputButton, {} )
				GroupsSubTitle0:completeAnimation()
				self.GroupsSubTitle0:setAlpha( 1 )
				self.clipFinished( GroupsSubTitle0, {} )
				GroupsNoConentDetail:completeAnimation()
				GroupsNoConentDetail.HeaderBkgd:completeAnimation()
				self.GroupsNoConentDetail:setAlpha( 0 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( ColorSet.FactionAxis_CP.r, ColorSet.FactionAxis_CP.g, ColorSet.FactionAxis_CP.b )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				GroupsInputButton:completeAnimation()
				self.GroupsInputButton:setAlpha( 0 )
				self.clipFinished( GroupsInputButton, {} )
				GroupsSubTitle0:completeAnimation()
				self.GroupsSubTitle0:setAlpha( 0 )
				self.clipFinished( GroupsSubTitle0, {} )
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
	GroupsInputButton.id = "GroupsInputButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupsInputButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsInputButton:close()
		element.GroupsSubTitle0:close()
		element.GroupsNoConentDetail:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

