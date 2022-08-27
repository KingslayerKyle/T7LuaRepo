-- b481e3bd85c51b2c5b06f6ba4ada46f0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.menus.Groups.GroupInvitesOptions" )
require( "ui.uieditor.widgets.Social.Social_Groups_InvitesButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Groups.GroupsSummary" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "groups" ), "eventUpdate" ), function ()
		if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "groups.eventName" ) ) == "refreshInvites" and Engine.GetTotalGroupInvitesCount( f1_arg1 ) == 0 then
			GoBack( f1_arg0, f1_arg1 )
		end
	end, false )
end

LUI.createMenu.GroupInvites = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupInvites" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupInvites.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, 65, 468.5 )
	BlackTint0:setTopBottom( true, false, 86, 684 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_INVITES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_INVITES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f3_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local InvitesList = LUI.UIList.new( f3_local1, controller, 7, 0, nil, false, false, 0, 0, false, false )
	InvitesList:makeFocusable()
	InvitesList:setLeftRight( true, false, 80, 454 )
	InvitesList:setTopBottom( true, false, 156, 551 )
	InvitesList:setWidgetType( CoD.Social_Groups_InvitesButton )
	InvitesList:setVerticalCount( 6 )
	InvitesList:setSpacing( 7 )
	InvitesList:setVerticalCounter( CoD.verticalCounter )
	InvitesList:setDataSource( "GroupsInvitesList" )
	InvitesList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_START )
		return f6_local0
	end )
	InvitesList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	f3_local1:AddButtonCallbackFunction( InvitesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		OpenGroupsInviteConfirmation( self, f8_arg0, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( InvitesList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		SetGroupInvitePlayerModels( self, f10_arg0, f10_arg2 )
		OpenPopup( self, "GroupInvitesOptions", f10_arg2, "", "" )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( InvitesList )
	self.InvitesList = InvitesList
	
	local GroupsSummary = CoD.GroupsSummary.new( f3_local1, controller )
	GroupsSummary:setLeftRight( true, false, 479.5, 838 )
	GroupsSummary:setTopBottom( true, false, 149, 609 )
	GroupsSummary:mergeStateConditions( {
		{
			stateName = "NoGroupSelected",
			condition = function ( menu, element, event )
				return HideGroupInviteSummary( element, controller )
			end
		},
		{
			stateName = "InvitesGroupSummary",
			condition = function ( menu, element, event )
				return not HideGroupInviteSummary( element, controller )
			end
		}
	} )
	GroupsSummary:linkToElementModel( GroupsSummary, "groupId", true, function ( model )
		f3_local1:updateElementState( GroupsSummary, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	GroupsSummary:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupInvitesInProgress" ), function ( model )
		f3_local1:updateElementState( GroupsSummary, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupInvitesInProgress"
		} )
	end )
	GroupsSummary:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupProfilesInProgress" ), function ( model )
		f3_local1:updateElementState( GroupsSummary, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupProfilesInProgress"
		} )
	end )
	self:addElement( GroupsSummary )
	self.GroupsSummary = GroupsSummary
	
	GroupsSummary:linkToElementModel( InvitesList, nil, false, function ( model )
		GroupsSummary:setModel( model, controller )
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f18_local0 = nil
		HandleGroupsKeyboardComplete( self, element, controller, event )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f19_local0 = nil
		FetchGroupInviteProfiles( self, element, controller )
		SetControllerModelValue( controller, "groups.fetchProfilesForInvites", true )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		GroupInvitesGoBack( self, f20_arg0, f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( controller, "groups.fetchProfilesForInvites", false )
		ClearSavedState( self, controller )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	InvitesList.id = "InvitesList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.InvitesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.SelfIdentityBadge:close()
		element.InvitesList:close()
		element.GroupsSummary:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupInvites.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

