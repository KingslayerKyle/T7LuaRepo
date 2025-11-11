local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.frameWidget" ), "CoD.GroupsSocialMainFrameWidget" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.frameType" ), "main" )
	CoD.OverlayUtility.AddSystemOverlay( "GroupsInviteConfirmation", {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_GroupsInvite",
		title = Engine.Localize( "GROUPS_GROUP_INVITE" ),
		description = function ( controller, params )
			local selectedGroupNameModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.groupName" )
			if selectedGroupNameModel then
				return Engine.Localize( "GROUPS_GROUP_INVITE_DESC", Engine.GetModelValue( selectedGroupNameModel ) )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( controller, params )
			DataSources.GroupsInviteMenuList = DataSourceHelpers.ListSetup( "GroupsInviteMenuList", function ( controller, list )
				local buttonsList = {}
				local addItemListButton = function ( displayText, action, selected, disabled )
					return {
						models = {
							displayText = displayText,
							disabled = disabled
						},
						properties = {
							action = action,
							actionParam = params,
							selectIndex = selected
						}
					}
				end
				
				table.insert( buttonsList, addItemListButton( "GROUPS_JOIN_GROUP", AcceptGroupInvite, true, false ) )
				table.insert( buttonsList, addItemListButton( "GROUPS_DECLINE_INVITATION", RejectGroupInvite, false, false ) )
				return buttonsList
			end, true )
			return "GroupsInviteMenuList"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	} )
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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( 0, 0, 0, 1725 )
	Frame:setTopBottom( 0, 0, 0, 780 )
	Frame:subscribeToGlobalModel( controller, "Groups", "frameWidget", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
		end
	end )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame.id = "Frame"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Frame:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Frame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

