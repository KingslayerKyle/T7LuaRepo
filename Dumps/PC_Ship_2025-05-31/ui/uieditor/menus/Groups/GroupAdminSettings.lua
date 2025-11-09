require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Groups.Headquarters.AdminTabAdminSettingsCheckboxButton" )
require( "ui.uieditor.widgets.Groups.GroupsSubTitle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.hintText" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.FavoriteShowcaseContent.navigation = {
		up = f1_arg0.BanMembers,
		right = f1_arg0.EditGroupPrivacySettings,
		down = f1_arg0.RemoveShowcaseContent,
		left = f1_arg0.BanFromGroupButton
	}
	f1_arg0.RemoveShowcaseContent.navigation = {
		up = f1_arg0.FavoriteShowcaseContent,
		right = f1_arg0.EditGroupName,
		left = f1_arg0.BanFromGroupButton
	}
	f1_arg0.EditDescription.navigation = {
		up = f1_arg0.EditEmblem,
		down = f1_arg0.EditGroupPrivacySettings,
		left = f1_arg0.BanMembers
	}
	f1_arg0.BanMembers.navigation = {
		up = f1_arg0.RemoveMembers,
		right = f1_arg0.EditEmblem,
		down = f1_arg0.FavoriteShowcaseContent,
		left = f1_arg0.BanFromGroupButton
	}
end

LUI.createMenu.GroupAdminSettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupAdminSettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupAdminSettings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_ADMIN_SETTINGS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_ADMIN_SETTINGS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 64, 368 )
	BlackTint:setTopBottom( true, false, 85.86, 677.86 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local RemoveAdminPrivilegesButton = CoD.List1ButtonLarge_PH.new( self, controller )
	RemoveAdminPrivilegesButton:setLeftRight( true, false, 77.28, 357.28 )
	RemoveAdminPrivilegesButton:setTopBottom( true, false, 171.86, 203.86 )
	RemoveAdminPrivilegesButton.btnDisplayText:setText( Engine.Localize( "GROUPS_REMOVE_ADMIN_PRIVILEGES_CAPS" ) )
	RemoveAdminPrivilegesButton.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_REMOVE_ADMIN_PRIVILEGES_CAPS" ) )
	RemoveAdminPrivilegesButton:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	RemoveAdminPrivilegesButton:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( RemoveAdminPrivilegesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		DemoteAdminToRegularMember( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( RemoveAdminPrivilegesButton )
	self.RemoveAdminPrivilegesButton = RemoveAdminPrivilegesButton
	
	local RemoveFromGroupButton = CoD.List1ButtonLarge_PH.new( self, controller )
	RemoveFromGroupButton:setLeftRight( true, false, 77.28, 357.28 )
	RemoveFromGroupButton:setTopBottom( true, false, 206.86, 238.86 )
	RemoveFromGroupButton.btnDisplayText:setText( Engine.Localize( "GROUPS_REMOVE_FROM_GROUP_CAPS" ) )
	RemoveFromGroupButton.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_REMOVE_FROM_GROUP_CAPS" ) )
	RemoveFromGroupButton:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	RemoveFromGroupButton:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( RemoveFromGroupButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		RemoveFromGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( RemoveFromGroupButton )
	self.RemoveFromGroupButton = RemoveFromGroupButton
	
	local BanFromGroupButton = CoD.List1ButtonLarge_PH.new( self, controller )
	BanFromGroupButton:setLeftRight( true, false, 77.28, 357.28 )
	BanFromGroupButton:setTopBottom( true, false, 239.86, 271.86 )
	BanFromGroupButton.btnDisplayText:setText( Engine.Localize( "GROUPS_BAN_FROM_GROUP_CAPS" ) )
	BanFromGroupButton.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_BAN_FROM_GROUP_CAPS" ) )
	BanFromGroupButton:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	BanFromGroupButton:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( BanFromGroupButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		BanFromGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BanFromGroupButton )
	self.BanFromGroupButton = BanFromGroupButton
	
	local InvitePlayers = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	InvitePlayers:setLeftRight( true, false, 523.31, 803.31 )
	InvitePlayers:setTopBottom( true, false, 170.86, 202.86 )
	InvitePlayers.btnDisplayText:setText( Engine.Localize( "GROUPS_INVITE_PLAYERS" ) )
	InvitePlayers.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_INVITE_PLAYERS" ) )
	InvitePlayers:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_INVITE_PLAYERS_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f15_local0
	end )
	InvitePlayers:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( InvitePlayers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_INVITE_PLAYERS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	InvitePlayers:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_INVITE_PLAYERS )
			end
		}
	} )
	InvitePlayers:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( InvitePlayers, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( InvitePlayers )
	self.InvitePlayers = InvitePlayers
	
	local ApproveJoinRequests = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	ApproveJoinRequests:setLeftRight( true, false, 523.31, 803.31 )
	ApproveJoinRequests:setTopBottom( true, false, 215.86, 247.86 )
	ApproveJoinRequests.btnDisplayText:setText( Engine.Localize( "GROUPS_APPROVE_JOIN_REQUESTS" ) )
	ApproveJoinRequests.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_APPROVE_JOIN_REQUESTS" ) )
	ApproveJoinRequests:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_APPROVE_JOIN_REQUESTS_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f21_local0
	end )
	ApproveJoinRequests:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
	end )
	self:AddButtonCallbackFunction( ApproveJoinRequests, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_APPROVE_JOIN_REQUESTS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	ApproveJoinRequests:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_APPROVE_JOIN_REQUESTS )
			end
		}
	} )
	ApproveJoinRequests:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( ApproveJoinRequests, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( ApproveJoinRequests )
	self.ApproveJoinRequests = ApproveJoinRequests
	
	local RemoveMembers = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	RemoveMembers:setLeftRight( true, false, 523.31, 803.31 )
	RemoveMembers:setTopBottom( true, false, 263.86, 295.86 )
	RemoveMembers.btnDisplayText:setText( Engine.Localize( "GROUPS_REMOVE_MEMBERS" ) )
	RemoveMembers.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_REMOVE_MEMBERS" ) )
	RemoveMembers:registerEventHandler( "gain_focus", function ( element, event )
		local f27_local0 = nil
		if element.gainFocus then
			f27_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f27_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_REMOVE_MEMBERS_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f27_local0
	end )
	RemoveMembers:registerEventHandler( "lose_focus", function ( element, event )
		local f28_local0 = nil
		if element.loseFocus then
			f28_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f28_local0 = element.super:loseFocus( event )
		end
		return f28_local0
	end )
	self:AddButtonCallbackFunction( RemoveMembers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_MEMBERS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	RemoveMembers:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_MEMBERS )
			end
		}
	} )
	RemoveMembers:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( RemoveMembers, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( RemoveMembers )
	self.RemoveMembers = RemoveMembers
	
	local BanMembers = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	BanMembers:setLeftRight( true, false, 523.31, 803.31 )
	BanMembers:setTopBottom( true, false, 312.86, 344.86 )
	BanMembers.btnDisplayText:setText( Engine.Localize( "GROUPS_BAN_MEMBERS" ) )
	BanMembers.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_BAN_MEMBERS" ) )
	BanMembers:registerEventHandler( "gain_focus", function ( element, event )
		local f33_local0 = nil
		if element.gainFocus then
			f33_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f33_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_BAN_MEMBERS_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f33_local0
	end )
	BanMembers:registerEventHandler( "lose_focus", function ( element, event )
		local f34_local0 = nil
		if element.loseFocus then
			f34_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f34_local0 = element.super:loseFocus( event )
		end
		return f34_local0
	end )
	self:AddButtonCallbackFunction( BanMembers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_BAN_MEMBERS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	BanMembers:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_BAN_MEMBERS )
			end
		}
	} )
	BanMembers:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( BanMembers, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( BanMembers )
	self.BanMembers = BanMembers
	
	local EditFeatured = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	EditFeatured:setLeftRight( true, false, 868.31, 1148.31 )
	EditFeatured:setTopBottom( true, false, 170.86, 202.86 )
	EditFeatured.btnDisplayText:setText( Engine.Localize( "GROUPS_EDIT_FEATURED" ) )
	EditFeatured.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_EDIT_FEATURED" ) )
	EditFeatured:registerEventHandler( "gain_focus", function ( element, event )
		local f39_local0 = nil
		if element.gainFocus then
			f39_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f39_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_EDIT_FEATURED_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f39_local0
	end )
	EditFeatured:registerEventHandler( "lose_focus", function ( element, event )
		local f40_local0 = nil
		if element.loseFocus then
			f40_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f40_local0 = element.super:loseFocus( event )
		end
		return f40_local0
	end )
	self:AddButtonCallbackFunction( EditFeatured, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_FEATURED_CONTENT )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	EditFeatured:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_FEATURED_CONTENT )
			end
		}
	} )
	EditFeatured:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( EditFeatured, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( EditFeatured )
	self.EditFeatured = EditFeatured
	
	local FavoriteShowcaseContent = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	FavoriteShowcaseContent:setLeftRight( true, false, 523.31, 803.31 )
	FavoriteShowcaseContent:setTopBottom( true, false, 433.86, 465.86 )
	FavoriteShowcaseContent.btnDisplayText:setText( Engine.Localize( "GROUPS_FAVORITE_SHOWCASE_CONTENT" ) )
	FavoriteShowcaseContent.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_FAVORITE_SHOWCASE_CONTENT" ) )
	FavoriteShowcaseContent:registerEventHandler( "gain_focus", function ( element, event )
		local f45_local0 = nil
		if element.gainFocus then
			f45_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f45_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_FAVORITE_SHOWCASE_CONTENT_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f45_local0
	end )
	FavoriteShowcaseContent:registerEventHandler( "lose_focus", function ( element, event )
		local f46_local0 = nil
		if element.loseFocus then
			f46_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f46_local0 = element.super:loseFocus( event )
		end
		return f46_local0
	end )
	self:AddButtonCallbackFunction( FavoriteShowcaseContent, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_FAVORITE_SHOWCASE_CONTENT )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	FavoriteShowcaseContent:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_FAVORITE_SHOWCASE_CONTENT )
			end
		}
	} )
	FavoriteShowcaseContent:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( FavoriteShowcaseContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( FavoriteShowcaseContent )
	self.FavoriteShowcaseContent = FavoriteShowcaseContent
	
	local RemoveShowcaseContent = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	RemoveShowcaseContent:setLeftRight( true, false, 523.31, 803.31 )
	RemoveShowcaseContent:setTopBottom( true, false, 479, 511 )
	RemoveShowcaseContent.btnDisplayText:setText( Engine.Localize( "GROUPS_REMOVE_SHOWCASE_CONTENT" ) )
	RemoveShowcaseContent.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_REMOVE_SHOWCASE_CONTENT" ) )
	RemoveShowcaseContent:registerEventHandler( "gain_focus", function ( element, event )
		local f51_local0 = nil
		if element.gainFocus then
			f51_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f51_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_REMOVE_SHOWCASE_CONTENT_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f51_local0
	end )
	RemoveShowcaseContent:registerEventHandler( "lose_focus", function ( element, event )
		local f52_local0 = nil
		if element.loseFocus then
			f52_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f52_local0 = element.super:loseFocus( event )
		end
		return f52_local0
	end )
	self:AddButtonCallbackFunction( RemoveShowcaseContent, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_SHOWCASE_CONTENT )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	RemoveShowcaseContent:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_SHOWCASE_CONTENT )
			end
		}
	} )
	RemoveShowcaseContent:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( RemoveShowcaseContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( RemoveShowcaseContent )
	self.RemoveShowcaseContent = RemoveShowcaseContent
	
	local EditMessage = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	EditMessage:setLeftRight( true, false, 868.31, 1148.31 )
	EditMessage:setTopBottom( true, false, 215.86, 247.86 )
	EditMessage.btnDisplayText:setText( Engine.Localize( "GROUPS_EDIT_MESSAGE" ) )
	EditMessage.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_EDIT_MESSAGE" ) )
	EditMessage:registerEventHandler( "gain_focus", function ( element, event )
		local f57_local0 = nil
		if element.gainFocus then
			f57_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f57_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_EDIT_MESSAGE_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f57_local0
	end )
	EditMessage:registerEventHandler( "lose_focus", function ( element, event )
		local f58_local0 = nil
		if element.loseFocus then
			f58_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f58_local0 = element.super:loseFocus( event )
		end
		return f58_local0
	end )
	self:AddButtonCallbackFunction( EditMessage, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	EditMessage:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE )
			end
		}
	} )
	EditMessage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( EditMessage, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( EditMessage )
	self.EditMessage = EditMessage
	
	local EditLeaderboard = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	EditLeaderboard:setLeftRight( true, false, 868.31, 1148.31 )
	EditLeaderboard:setTopBottom( true, false, 263.86, 295.86 )
	EditLeaderboard.btnDisplayText:setText( Engine.Localize( "GROUPS_EDIT_LEADERBOARD" ) )
	EditLeaderboard.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_EDIT_LEADERBOARD" ) )
	EditLeaderboard:registerEventHandler( "gain_focus", function ( element, event )
		local f63_local0 = nil
		if element.gainFocus then
			f63_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f63_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_EDIT_LEADERBOARD_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f63_local0
	end )
	EditLeaderboard:registerEventHandler( "lose_focus", function ( element, event )
		local f64_local0 = nil
		if element.loseFocus then
			f64_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f64_local0 = element.super:loseFocus( event )
		end
		return f64_local0
	end )
	self:AddButtonCallbackFunction( EditLeaderboard, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	EditLeaderboard:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD )
			end
		}
	} )
	EditLeaderboard:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( EditLeaderboard, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( EditLeaderboard )
	self.EditLeaderboard = EditLeaderboard
	
	local EditEmblem = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	EditEmblem:setLeftRight( true, false, 868.31, 1148.31 )
	EditEmblem:setTopBottom( true, false, 312.86, 344.86 )
	EditEmblem.btnDisplayText:setText( Engine.Localize( "GROUPS_EDIT_EMBLEM" ) )
	EditEmblem.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_EDIT_EMBLEM" ) )
	EditEmblem:registerEventHandler( "gain_focus", function ( element, event )
		local f69_local0 = nil
		if element.gainFocus then
			f69_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f69_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_EDIT_EMBLEM_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f69_local0
	end )
	EditEmblem:registerEventHandler( "lose_focus", function ( element, event )
		local f70_local0 = nil
		if element.loseFocus then
			f70_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f70_local0 = element.super:loseFocus( event )
		end
		return f70_local0
	end )
	self:AddButtonCallbackFunction( EditEmblem, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_EMBLEM )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	EditEmblem:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_EMBLEM )
			end
		}
	} )
	EditEmblem:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( EditEmblem, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( EditEmblem )
	self.EditEmblem = EditEmblem
	
	local EditDescription = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	EditDescription:setLeftRight( true, false, 868.31, 1148.31 )
	EditDescription:setTopBottom( true, false, 360, 392 )
	EditDescription.btnDisplayText:setText( Engine.Localize( "GROUPS_EIDT_DESCRIPTION" ) )
	EditDescription.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_EIDT_DESCRIPTION" ) )
	EditDescription:registerEventHandler( "gain_focus", function ( element, event )
		local f75_local0 = nil
		if element.gainFocus then
			f75_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f75_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_EDIT_DESCRIPTION_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f75_local0
	end )
	EditDescription:registerEventHandler( "lose_focus", function ( element, event )
		local f76_local0 = nil
		if element.loseFocus then
			f76_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f76_local0 = element.super:loseFocus( event )
		end
		return f76_local0
	end )
	self:AddButtonCallbackFunction( EditDescription, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_DESCRIPTION )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	EditDescription:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_DESCRIPTION )
			end
		}
	} )
	EditDescription:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( EditDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( EditDescription )
	self.EditDescription = EditDescription
	
	local EditGroupPrivacySettings = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	EditGroupPrivacySettings:setLeftRight( true, false, 868.31, 1148.31 )
	EditGroupPrivacySettings:setTopBottom( true, false, 433.86, 465.86 )
	EditGroupPrivacySettings.btnDisplayText:setText( Engine.Localize( "GROUPS_EDIT_GROUP_PRIVACY_SETTINGS" ) )
	EditGroupPrivacySettings.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_EDIT_GROUP_PRIVACY_SETTINGS" ) )
	EditGroupPrivacySettings:registerEventHandler( "gain_focus", function ( element, event )
		local f81_local0 = nil
		if element.gainFocus then
			f81_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f81_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_EDIT_GROUP_PRIVACY_SETTINGS_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f81_local0
	end )
	EditGroupPrivacySettings:registerEventHandler( "lose_focus", function ( element, event )
		local f82_local0 = nil
		if element.loseFocus then
			f82_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f82_local0 = element.super:loseFocus( event )
		end
		return f82_local0
	end )
	self:AddButtonCallbackFunction( EditGroupPrivacySettings, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_TYPE )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	EditGroupPrivacySettings:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_TYPE )
			end
		}
	} )
	EditGroupPrivacySettings:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( EditGroupPrivacySettings, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( EditGroupPrivacySettings )
	self.EditGroupPrivacySettings = EditGroupPrivacySettings
	
	local EditGroupName = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	EditGroupName:setLeftRight( true, false, 868.31, 1148.31 )
	EditGroupName:setTopBottom( true, false, 479, 511 )
	EditGroupName.btnDisplayText:setText( Engine.Localize( "GROUPS_EDIT_GROUP_NAME" ) )
	EditGroupName.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_EDIT_GROUP_NAME" ) )
	EditGroupName:registerEventHandler( "gain_focus", function ( element, event )
		local f87_local0 = nil
		if element.gainFocus then
			f87_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f87_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_EDIT_GROUP_NAME_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f87_local0
	end )
	EditGroupName:registerEventHandler( "lose_focus", function ( element, event )
		local f88_local0 = nil
		if element.loseFocus then
			f88_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f88_local0 = element.super:loseFocus( event )
		end
		return f88_local0
	end )
	self:AddButtonCallbackFunction( EditGroupName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_NAME )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	EditGroupName:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_NAME )
			end
		}
	} )
	EditGroupName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( EditGroupName, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( EditGroupName )
	self.EditGroupName = EditGroupName
	
	local ManageAdmins = CoD.AdminTabAdminSettingsCheckboxButton.new( self, controller )
	ManageAdmins:setLeftRight( true, false, 868.31, 1148.31 )
	ManageAdmins:setTopBottom( true, false, 524, 556 )
	ManageAdmins.btnDisplayText:setText( Engine.Localize( "GROUPS_MANAGE_ADMINS" ) )
	ManageAdmins.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_MANAGE_ADMINS" ) )
	ManageAdmins:registerEventHandler( "gain_focus", function ( element, event )
		local f93_local0 = nil
		if element.gainFocus then
			f93_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f93_local0 = element.super:gainFocus( event )
		end
		SetHintTextToString( controller, "GROUPS_MANAGE_ADMINS_DESC" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f93_local0
	end )
	ManageAdmins:registerEventHandler( "lose_focus", function ( element, event )
		local f94_local0 = nil
		if element.loseFocus then
			f94_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f94_local0 = element.super:loseFocus( event )
		end
		return f94_local0
	end )
	self:AddButtonCallbackFunction( ManageAdmins, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGroupAdminPrivilege( self, element, controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_MANAGE_ADMINS )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	ManageAdmins:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckSelectedAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_MANAGE_ADMINS )
			end
		}
	} )
	ManageAdmins:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.currentAdminPrivileges" ), function ( model )
		self:updateElementState( ManageAdmins, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.currentAdminPrivileges"
		} )
	end )
	self:addElement( ManageAdmins )
	self.ManageAdmins = ManageAdmins
	
	local GroupsSubTitle0 = CoD.GroupsSubTitle.new( self, controller )
	GroupsSubTitle0:setLeftRight( true, false, 868.31, 1036.31 )
	GroupsSubTitle0:setTopBottom( true, false, 123.86, 155.86 )
	GroupsSubTitle0.weaponNameLabel:setText( Engine.Localize( "GROUPS_GROUP_PERMISSIONS" ) )
	self:addElement( GroupsSubTitle0 )
	self.GroupsSubTitle0 = GroupsSubTitle0
	
	local GroupsSubTitle00 = CoD.GroupsSubTitle.new( self, controller )
	GroupsSubTitle00:setLeftRight( true, false, 523.31, 691.31 )
	GroupsSubTitle00:setTopBottom( true, false, 123.86, 155.86 )
	GroupsSubTitle00.weaponNameLabel:setText( Engine.Localize( "GROUPS_MEMBER_PERMISSIONS" ) )
	self:addElement( GroupsSubTitle00 )
	self.GroupsSubTitle00 = GroupsSubTitle00
	
	local GroupsSubTitle000 = CoD.GroupsSubTitle.new( self, controller )
	GroupsSubTitle000:setLeftRight( true, false, 523.31, 691.31 )
	GroupsSubTitle000:setTopBottom( true, false, 388.86, 420.86 )
	GroupsSubTitle000.weaponNameLabel:setText( Engine.Localize( "GROUPS_SHOWCASE_PERMISSIONS" ) )
	self:addElement( GroupsSubTitle000 )
	self.GroupsSubTitle000 = GroupsSubTitle000
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local hintText0 = CoD.hintText.new( self, controller )
	hintText0:setLeftRight( true, false, 523.31, 1123.31 )
	hintText0:setTopBottom( true, false, 606.39, 626.39 )
	self:addElement( hintText0 )
	self.hintText0 = hintText0
	
	RemoveAdminPrivilegesButton.navigation = {
		right = InvitePlayers,
		down = RemoveFromGroupButton
	}
	RemoveFromGroupButton.navigation = {
		up = RemoveAdminPrivilegesButton,
		right = ApproveJoinRequests,
		down = BanFromGroupButton
	}
	BanFromGroupButton.navigation = {
		up = RemoveFromGroupButton,
		right = {
			ApproveJoinRequests,
			RemoveMembers
		}
	}
	InvitePlayers.navigation = {
		left = RemoveAdminPrivilegesButton,
		right = EditFeatured,
		down = ApproveJoinRequests
	}
	ApproveJoinRequests.navigation = {
		left = {
			RemoveFromGroupButton,
			BanFromGroupButton
		},
		up = InvitePlayers,
		right = EditMessage,
		down = RemoveMembers
	}
	RemoveMembers.navigation = {
		left = BanFromGroupButton,
		up = ApproveJoinRequests,
		right = EditLeaderboard,
		down = BanMembers
	}
	BanMembers.navigation = {
		up = RemoveMembers,
		right = EditEmblem,
		down = FavoriteShowcaseContent
	}
	EditFeatured.navigation = {
		left = InvitePlayers,
		down = EditMessage
	}
	FavoriteShowcaseContent.navigation = {
		up = BanMembers,
		right = EditGroupPrivacySettings,
		down = RemoveShowcaseContent
	}
	RemoveShowcaseContent.navigation = {
		up = FavoriteShowcaseContent,
		right = EditGroupName
	}
	EditMessage.navigation = {
		left = ApproveJoinRequests,
		up = EditFeatured,
		down = EditLeaderboard
	}
	EditLeaderboard.navigation = {
		left = RemoveMembers,
		up = EditMessage,
		down = EditEmblem
	}
	EditEmblem.navigation = {
		left = BanMembers,
		up = EditLeaderboard,
		down = EditDescription
	}
	EditDescription.navigation = {
		up = EditEmblem,
		down = EditGroupPrivacySettings
	}
	EditGroupPrivacySettings.navigation = {
		left = FavoriteShowcaseContent,
		up = EditDescription,
		down = EditGroupName
	}
	EditGroupName.navigation = {
		left = RemoveShowcaseContent,
		up = EditGroupPrivacySettings,
		down = ManageAdmins
	}
	ManageAdmins.navigation = {
		up = EditGroupName
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		UpdateSelectedGroupAdminPrivileges( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "menu_back" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	RemoveAdminPrivilegesButton.id = "RemoveAdminPrivilegesButton"
	RemoveFromGroupButton.id = "RemoveFromGroupButton"
	BanFromGroupButton.id = "BanFromGroupButton"
	InvitePlayers.id = "InvitePlayers"
	ApproveJoinRequests.id = "ApproveJoinRequests"
	RemoveMembers.id = "RemoveMembers"
	BanMembers.id = "BanMembers"
	EditFeatured.id = "EditFeatured"
	FavoriteShowcaseContent.id = "FavoriteShowcaseContent"
	RemoveShowcaseContent.id = "RemoveShowcaseContent"
	EditMessage.id = "EditMessage"
	EditLeaderboard.id = "EditLeaderboard"
	EditEmblem.id = "EditEmblem"
	EditDescription.id = "EditDescription"
	EditGroupPrivacySettings.id = "EditGroupPrivacySettings"
	EditGroupName.id = "EditGroupName"
	ManageAdmins.id = "ManageAdmins"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.RemoveAdminPrivilegesButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.RemoveAdminPrivilegesButton:close()
		element.RemoveFromGroupButton:close()
		element.BanFromGroupButton:close()
		element.InvitePlayers:close()
		element.ApproveJoinRequests:close()
		element.RemoveMembers:close()
		element.BanMembers:close()
		element.EditFeatured:close()
		element.FavoriteShowcaseContent:close()
		element.RemoveShowcaseContent:close()
		element.EditMessage:close()
		element.EditLeaderboard:close()
		element.EditEmblem:close()
		element.EditDescription:close()
		element.EditGroupPrivacySettings:close()
		element.EditGroupName:close()
		element.ManageAdmins:close()
		element.GroupsSubTitle0:close()
		element.GroupsSubTitle00:close()
		element.GroupsSubTitle000:close()
		element.FEMenuLeftGraphics:close()
		element.hintText0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupAdminSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

