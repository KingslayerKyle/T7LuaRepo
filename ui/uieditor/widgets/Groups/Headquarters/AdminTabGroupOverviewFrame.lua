-- dd3db9f2018b1f664960448c7a8a2225
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsCreateButtonLG" )
require( "ui.uieditor.widgets.Groups.GroupsSubTitle" )
require( "ui.uieditor.widgets.Groups.GroupsInputButtonScroll" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	AdminTabMakeNotFocusableIfDisabled( f1_arg0, f1_arg1 )
end

CoD.AdminTabGroupOverviewFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupOverviewFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupOverviewFrame )
	self.id = "AdminTabGroupOverviewFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( true, false, 4, 255.6 )
	GroupEmblem:setTopBottom( true, false, 335.06, 493.06 )
	GroupEmblem:setAlpha( 0 )
	GroupEmblem:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local groupId = Engine.GetModelValue( model )
		if groupId then
			GroupEmblem:setupGroupEmblem( groupId )
		end
	end )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	local EmblemButton = CoD.GroupsCreateButtonLG.new( menu, controller )
	EmblemButton:setLeftRight( true, false, 0.5, 258.6 )
	EmblemButton:setTopBottom( true, false, 332.56, 496.56 )
	EmblemButton:setAlpha( 0 )
	EmblemButton.ImageText:setText( Engine.Localize( "" ) )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f4_local0 = EmblemButton
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f5_local0 = EmblemButton
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemButton:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	EmblemButton:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( EmblemButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if IsLive() and not IsUserContentRestricted( f8_arg2 ) and HasAdminPrivilege( f8_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_EMBLEM ) then
			OpenEmblemSelect( self, f8_arg0, f8_arg2, Enum.StorageFileType.STORAGE_EMBLEMS, f8_arg1 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if IsLive() and not IsUserContentRestricted( f9_arg2 ) and HasAdminPrivilege( f9_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_EMBLEM ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( EmblemButton )
	self.EmblemButton = EmblemButton
	
	local GroupsSubTitle0 = CoD.GroupsSubTitle.new( menu, controller )
	GroupsSubTitle0:setLeftRight( true, false, 0, 168 )
	GroupsSubTitle0:setTopBottom( true, false, 0, 32 )
	GroupsSubTitle0:setAlpha( 0 )
	GroupsSubTitle0.weaponNameLabel:setText( Engine.Localize( "GROUPS_EDIT_MESSAGE" ) )
	self:addElement( GroupsSubTitle0 )
	self.GroupsSubTitle0 = GroupsSubTitle0
	
	local GroupsSubTitle00 = CoD.GroupsSubTitle.new( menu, controller )
	GroupsSubTitle00:setLeftRight( true, false, 1, 169 )
	GroupsSubTitle00:setTopBottom( true, false, 166.43, 198.43 )
	GroupsSubTitle00:setAlpha( 0 )
	GroupsSubTitle00.weaponNameLabel:setText( Engine.Localize( "GROUPS_EDIT_GROUP_DESCRIPTION" ) )
	self:addElement( GroupsSubTitle00 )
	self.GroupsSubTitle00 = GroupsSubTitle00
	
	local GroupsSubTitle000 = CoD.GroupsSubTitle.new( menu, controller )
	GroupsSubTitle000:setLeftRight( true, false, 1, 169 )
	GroupsSubTitle000:setTopBottom( true, false, 293.56, 325.56 )
	GroupsSubTitle000:setAlpha( 0 )
	GroupsSubTitle000.weaponNameLabel:setText( Engine.Localize( "GROUPS_EDIT_GROUP_EMBLEM" ) )
	self:addElement( GroupsSubTitle000 )
	self.GroupsSubTitle000 = GroupsSubTitle000
	
	local GroupsInputButtonScroll = CoD.GroupsInputButtonScroll.new( menu, controller )
	GroupsInputButtonScroll:setLeftRight( true, false, 0, 385 )
	GroupsInputButtonScroll:setTopBottom( true, false, 39.5, 149.5 )
	GroupsInputButtonScroll:setAlpha( 0 )
	GroupsInputButtonScroll.verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupsInputButtonScroll:subscribeToGlobalModel( controller, "SelectedGroup", "message", function ( model )
		local message = Engine.GetModelValue( model )
		if message then
			GroupsInputButtonScroll.verticalScrollingTextBox.textBox:setText( message )
		end
	end )
	GroupsInputButtonScroll:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	GroupsInputButtonScroll:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( GroupsInputButtonScroll, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if HasAdminPrivilege( f13_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE ) then
			EditSelectedGroupMessage( self, f13_arg0, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if HasAdminPrivilege( f14_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( GroupsInputButtonScroll )
	self.GroupsInputButtonScroll = GroupsInputButtonScroll
	
	local GroupsInputButtonScroll0 = CoD.GroupsInputButtonScroll.new( menu, controller )
	GroupsInputButtonScroll0:setLeftRight( true, false, 0, 385 )
	GroupsInputButtonScroll0:setTopBottom( true, false, 208.5, 280 )
	GroupsInputButtonScroll0:setAlpha( 0 )
	GroupsInputButtonScroll0.verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupsInputButtonScroll0:subscribeToGlobalModel( controller, "SelectedGroup", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			GroupsInputButtonScroll0.verticalScrollingTextBox.textBox:setText( description )
		end
	end )
	GroupsInputButtonScroll0:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	GroupsInputButtonScroll0:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( GroupsInputButtonScroll0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if HasAdminPrivilege( f18_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE ) then
			EditSelectedGroupDescription( self, f18_arg0, f18_arg2 )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if HasAdminPrivilege( f19_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( GroupsInputButtonScroll0 )
	self.GroupsInputButtonScroll0 = GroupsInputButtonScroll0
	
	local GroupsNoConentDetail = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
	GroupsNoConentDetail:setTopBottom( true, false, 0, 270 )
	GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
	GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
	GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_FIND_GROUPS_CAPS" ) )
	GroupsNoConentDetail.Desc:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ) )
	GroupsNoConentDetail.Glow2:setRGB( ColorSet.FactionAxis.r, ColorSet.FactionAxis.g, ColorSet.FactionAxis.b )
	self:addElement( GroupsNoConentDetail )
	self.GroupsNoConentDetail = GroupsNoConentDetail
	
	EmblemButton.navigation = {
		up = GroupsInputButtonScroll0
	}
	GroupsInputButtonScroll.navigation = {
		down = GroupsInputButtonScroll0
	}
	GroupsInputButtonScroll0.navigation = {
		up = GroupsInputButtonScroll,
		down = EmblemButton
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 1 )
				self.clipFinished( GroupEmblem, {} )

				EmblemButton:completeAnimation()
				self.EmblemButton:setAlpha( 1 )
				self.clipFinished( EmblemButton, {} )

				GroupsSubTitle0:completeAnimation()
				self.GroupsSubTitle0:setAlpha( 1 )
				self.clipFinished( GroupsSubTitle0, {} )

				GroupsSubTitle00:completeAnimation()
				self.GroupsSubTitle00:setAlpha( 1 )
				self.clipFinished( GroupsSubTitle00, {} )

				GroupsSubTitle000:completeAnimation()
				self.GroupsSubTitle000:setAlpha( 1 )
				self.clipFinished( GroupsSubTitle000, {} )

				GroupsInputButtonScroll:completeAnimation()
				self.GroupsInputButtonScroll:setAlpha( 1 )
				self.clipFinished( GroupsInputButtonScroll, {} )

				GroupsInputButtonScroll0:completeAnimation()
				self.GroupsInputButtonScroll0:setAlpha( 1 )
				self.clipFinished( GroupsInputButtonScroll0, {} )

				GroupsNoConentDetail:completeAnimation()

				GroupsNoConentDetail.HeaderBkgd:completeAnimation()
				self.GroupsNoConentDetail:setAlpha( 0 )
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( ColorSet.FactionAxis_CP.r, ColorSet.FactionAxis_CP.g, ColorSet.FactionAxis_CP.b )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 0 )
				self.clipFinished( GroupEmblem, {} )

				EmblemButton:completeAnimation()
				self.EmblemButton:setAlpha( 0 )
				self.clipFinished( EmblemButton, {} )

				GroupsSubTitle0:completeAnimation()
				self.GroupsSubTitle0:setAlpha( 0 )
				self.clipFinished( GroupsSubTitle0, {} )

				GroupsSubTitle00:completeAnimation()
				self.GroupsSubTitle00:setAlpha( 0 )
				self.clipFinished( GroupsSubTitle00, {} )

				GroupsSubTitle000:completeAnimation()
				self.GroupsSubTitle000:setAlpha( 0 )
				self.clipFinished( GroupsSubTitle000, {} )

				GroupsInputButtonScroll:completeAnimation()
				self.GroupsInputButtonScroll:setAlpha( 0 )
				self.clipFinished( GroupsInputButtonScroll, {} )

				GroupsInputButtonScroll0:completeAnimation()
				self.GroupsInputButtonScroll0:setAlpha( 0 )
				self.clipFinished( GroupsInputButtonScroll0, {} )

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
				self.GroupsNoConentDetail.Glow2:setRGB( ColorSet.FactionAxis.r, ColorSet.FactionAxis.g, ColorSet.FactionAxis.b )
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	EmblemButton.id = "EmblemButton"
	GroupsInputButtonScroll.id = "GroupsInputButtonScroll"
	GroupsInputButtonScroll0.id = "GroupsInputButtonScroll0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GroupsInputButtonScroll0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EmblemButton:close()
		element.GroupsSubTitle0:close()
		element.GroupsSubTitle00:close()
		element.GroupsSubTitle000:close()
		element.GroupsInputButtonScroll:close()
		element.GroupsInputButtonScroll0:close()
		element.GroupsNoConentDetail:close()
		element.GroupEmblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

