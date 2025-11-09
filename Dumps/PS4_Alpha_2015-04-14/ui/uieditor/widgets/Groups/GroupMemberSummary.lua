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
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 65 )
	
	local MemberCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	MemberCount:setLeftRight( true, false, 2, 102 )
	MemberCount:setTopBottom( true, false, 0, 65 )
	MemberCount:setRGB( 1, 1, 1 )
	MemberCount.Title:setText( Engine.Localize( AppendString( "GROUPS_MEMBERS", "_CAPS" ) ) )
	MemberCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( MemberCount )
	self.MemberCount = MemberCount
	
	local PlayingCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	PlayingCount:setLeftRight( true, false, 110, 210 )
	PlayingCount:setTopBottom( true, false, 0, 65 )
	PlayingCount:setRGB( 1, 1, 1 )
	PlayingCount.Title:setText( Engine.Localize( AppendString( "GROUPS_PLAYING", "_CAPS" ) ) )
	PlayingCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( PlayingCount )
	self.PlayingCount = PlayingCount
	
	local OnlineCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	OnlineCount:setLeftRight( true, false, 218, 318 )
	OnlineCount:setTopBottom( true, false, 0, 65 )
	OnlineCount:setRGB( 1, 1, 1 )
	OnlineCount.Title:setText( Engine.Localize( AppendString( "GROUPS_ONLINE", "_CAPS" ) ) )
	OnlineCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( OnlineCount )
	self.OnlineCount = OnlineCount
	
	self.close = function ( self )
		self.MemberCount:close()
		self.PlayingCount:close()
		self.OnlineCount:close()
		CoD.GroupMemberSummary.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

