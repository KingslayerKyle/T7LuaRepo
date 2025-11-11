require( "ui.uieditor.widgets.Groups.GroupMemberSummaryItem" )

local PreLoadFunc = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local selectedGroupModel = Engine.CreateModel( groupsModel, "selectedGroup" )
	Engine.CreateModel( selectedGroupModel, "memberCount" )
	Engine.CreateModel( selectedGroupModel, "inTitleCount" )
	Engine.CreateModel( selectedGroupModel, "onlineCount" )
end

CoD.GroupMemberSummary = InheritFrom( LUI.UIElement )
CoD.GroupMemberSummary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupMemberSummary )
	self.id = "GroupMemberSummary"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 97 )
	
	local MemberCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	MemberCount:setLeftRight( 0, 0, 3, 227 )
	MemberCount:setTopBottom( 0, 0, 0, 98 )
	MemberCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_MEMBERS" ) ) )
	MemberCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( MemberCount )
	self.MemberCount = MemberCount
	
	local PlayingCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	PlayingCount:setLeftRight( 0, 0, 234, 477 )
	PlayingCount:setTopBottom( 0, 0, 0, 98 )
	PlayingCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_PLAYING" ) ) )
	PlayingCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( PlayingCount )
	self.PlayingCount = PlayingCount
	
	local OnlineCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	OnlineCount:setLeftRight( 0, 0, 327, 477 )
	OnlineCount:setTopBottom( 0, 0, 0, 98 )
	OnlineCount:setAlpha( 0 )
	OnlineCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_ONLINE" ) ) )
	OnlineCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( OnlineCount )
	self.OnlineCount = OnlineCount
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MemberCount:close()
		self.PlayingCount:close()
		self.OnlineCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

