-- de8476edaf8012e87babb409b93be3c3
-- This hash is used for caching, delete to decompile the file again

local PreLoadFunc = function ( self, controller )
	local f1_local0 = "CoD.GroupsSocialMainFrameWidget"
	if IsUserContentRestricted( controller ) or IsUserChatRestricted( controller ) then
		f1_local0 = "CoD.GroupsSocialMainFrameWidgetDisabled"
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.frameWidget" ), f1_local0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.frameType" ), "main" )
	CoD.OverlayUtility.AddSystemOverlay( "GroupsInviteConfirmation", {
		menuName = "SystemOverlay_Compact",
		frameWidget = "CoD.systemOverlay_GroupsInvite",
		title = Engine.Localize( "GROUPS_GROUP_INVITE" ),
		description = function ( f2_arg0, f2_arg1 )
			local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg0 ), "groups.selectedGroup.groupName" )
			if f2_local0 then
				return Engine.Localize( "GROUPS_GROUP_INVITE_DESC", Engine.GetModelValue( f2_local0 ) )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f3_arg0, f3_arg1 )
			DataSources.GroupsInviteMenuList = DataSourceHelpers.ListSetup( "GroupsInviteMenuList", function ( f4_arg0, f4_arg1 )
				local f4_local0 = {}
				local f4_local1 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
					ShowReportGroupDialog( f5_arg0, f5_arg1, f5_arg2, f5_arg3, GoBack( f5_arg0, f5_arg2 ) )
				end
				
				local f4_local2 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
					return {
						models = {
							displayText = f6_arg0,
							disabled = f6_arg3
						},
						properties = {
							action = f6_arg1,
							actionParam = f3_arg1,
							selectIndex = f6_arg2
						}
					}
				end
				
				table.insert( f4_local0, f4_local2( "GROUPS_JOIN_GROUP", AcceptGroupInvite, true, false ) )
				table.insert( f4_local0, f4_local2( "GROUPS_DECLINE_INVITATION", RejectGroupInvite, false, false ) )
				table.insert( f4_local0, f4_local2( "MENU_REPORT_GROUP", f4_local1, false, false ) )
				return f4_local0
			end, true )
			return "GroupsInviteMenuList"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	} )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_GROUPS )
end

CoD.Social_Groups = InheritFrom( LUI.UIElement )
CoD.Social_Groups.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_Groups )
	self.id = "Social_Groups"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( true, false, 0, 1150 )
	Frame:setTopBottom( true, false, 0, 520 )
	Frame:subscribeToGlobalModel( controller, "Groups", "frameWidget", function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			Frame:changeFrameWidget( frameWidget )
		end
	end )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame.id = "Frame"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Frame:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Frame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
