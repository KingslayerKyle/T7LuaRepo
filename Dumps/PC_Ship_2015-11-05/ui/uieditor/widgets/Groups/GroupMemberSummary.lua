require( "ui.uieditor.widgets.Groups.GroupMemberSummaryItem" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "groups" ), "selectedGroup" )
	Engine.CreateModel( f1_local0, "memberCount" )
	Engine.CreateModel( f1_local0, "inTitleCount" )
	Engine.CreateModel( f1_local0, "onlineCount" )
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
	MemberCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_MEMBERS" ) ) )
	MemberCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( MemberCount )
	self.MemberCount = MemberCount
	
	local PlayingCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	PlayingCount:setLeftRight( true, false, 110, 210 )
	PlayingCount:setTopBottom( true, false, 0, 65 )
	PlayingCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_PLAYING" ) ) )
	PlayingCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( PlayingCount )
	self.PlayingCount = PlayingCount
	
	local OnlineCount = CoD.GroupMemberSummaryItem.new( menu, controller )
	OnlineCount:setLeftRight( true, false, 218, 318 )
	OnlineCount:setTopBottom( true, false, 0, 65 )
	OnlineCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_ONLINE" ) ) )
	OnlineCount.Count:setText( Engine.Localize( "00000" ) )
	self:addElement( OnlineCount )
	self.OnlineCount = OnlineCount
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MemberCount:close()
		element.PlayingCount:close()
		element.OnlineCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

