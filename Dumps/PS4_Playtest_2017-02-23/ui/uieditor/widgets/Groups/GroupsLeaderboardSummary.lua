require( "ui.uieditor.widgets.Groups.GroupMemberSummary" )

CoD.GroupsLeaderboardSummary = InheritFrom( LUI.UIElement )
CoD.GroupsLeaderboardSummary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsLeaderboardSummary )
	self.id = "GroupsLeaderboardSummary"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 690 )
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( 0, 0, 0, 525 )
	Backing:setTopBottom( 0, 0, 0, 690 )
	Backing:setAlpha( 0.05 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local CallingCardDummy = LUI.UIImage.new()
	CallingCardDummy:setLeftRight( 0, 0, 21, 501 )
	CallingCardDummy:setTopBottom( 0, 0, 501, 654 )
	CallingCardDummy:setImage( RegisterImage( "uie_img_t7_menu_partyeaseslide_gamercard1dummy" ) )
	self:addElement( CallingCardDummy )
	self.CallingCardDummy = CallingCardDummy
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 119, 501 )
	Image0:setTopBottom( 0, 0, 501, 539 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.53 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local GroupMemberSummary = CoD.GroupMemberSummary.new( menu, controller )
	GroupMemberSummary:setLeftRight( 0, 0, 21, 501 )
	GroupMemberSummary:setTopBottom( 0, 0, 19, 117 )
	GroupMemberSummary.PlayingCount.Title:setText( Engine.Localize( "SCORE / MIN" ) )
	GroupMemberSummary.PlayingCount.Count:setText( Engine.Localize( "00000" ) )
	GroupMemberSummary.OnlineCount.Title:setText( Engine.Localize( "KILLS" ) )
	GroupMemberSummary.OnlineCount.Count:setText( Engine.Localize( "00000" ) )
	GroupMemberSummary:subscribeToGlobalModel( controller, "LeaderboardHeader", "position", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.MemberCount.Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupMemberSummary:linkToElementModel( self, "position", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.MemberCount.Count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupMemberSummary )
	self.GroupMemberSummary = GroupMemberSummary
	
	local GroupLevel = LUI.UITightText.new()
	GroupLevel:setLeftRight( 0, 0, 25, 187 )
	GroupLevel:setTopBottom( 0, 0, 715, 753 )
	GroupLevel:setRGB( 0.5, 0.51, 0.52 )
	GroupLevel:setAlpha( 0 )
	GroupLevel:setText( Engine.Localize( "GROUPS_GROUP_LEVEL" ) )
	GroupLevel:setTTF( "fonts/default.ttf" )
	self:addElement( GroupLevel )
	self.GroupLevel = GroupLevel
	
	local GroupClanTagBacking = LUI.UIImage.new()
	GroupClanTagBacking:setLeftRight( 0, 0, 22, 118 )
	GroupClanTagBacking:setTopBottom( 0, 0, 501, 539 )
	GroupClanTagBacking:setRGB( 0.87, 0.88, 0.78 )
	self:addElement( GroupClanTagBacking )
	self.GroupClanTagBacking = GroupClanTagBacking
	
	local GroupClanTag = LUI.UIText.new()
	GroupClanTag:setLeftRight( 0, 0, 1, 140 )
	GroupClanTag:setTopBottom( 0, 0, 509, 539 )
	GroupClanTag:setRGB( 0, 0, 0 )
	GroupClanTag:setText( Engine.Localize( "CLAN" ) )
	GroupClanTag:setTTF( "fonts/UnitedSansRgMd.ttf" )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GroupClanTag )
	self.GroupClanTag = GroupClanTag
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( 0, 0, 127, 266 )
	Name:setTopBottom( 0, 0, 509, 539 )
	Name:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( modelValue )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local EmblemDummy = LUI.UIImage.new()
	EmblemDummy:setLeftRight( 0, 0, 21, 501 )
	EmblemDummy:setTopBottom( 0, 0, 162, 457 )
	EmblemDummy:setImage( RegisterImage( "uie_img_t7_menu_partyeaseslide_emblemdummy" ) )
	self:addElement( EmblemDummy )
	self.EmblemDummy = EmblemDummy
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupMemberSummary:close()
		self.Name:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

