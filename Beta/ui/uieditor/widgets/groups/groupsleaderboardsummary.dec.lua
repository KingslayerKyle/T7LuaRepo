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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 460 )
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 0, 350 )
	Backing:setTopBottom( true, false, 0, 460 )
	Backing:setAlpha( 0.05 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local CallingCardDummy = LUI.UIImage.new()
	CallingCardDummy:setLeftRight( true, false, 14, 334 )
	CallingCardDummy:setTopBottom( true, false, 334, 435.82 )
	CallingCardDummy:setImage( RegisterImage( "uie_img_t7_menu_partyeaseslide_gamercard1dummy" ) )
	self:addElement( CallingCardDummy )
	self.CallingCardDummy = CallingCardDummy
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 79, 334 )
	Image0:setTopBottom( true, false, 334, 359 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.53 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local GroupMemberSummary = CoD.GroupMemberSummary.new( menu, controller )
	GroupMemberSummary:setLeftRight( true, false, 14, 334 )
	GroupMemberSummary:setTopBottom( true, false, 12.5, 77.5 )
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
	GroupLevel:setLeftRight( true, false, 17, 125 )
	GroupLevel:setTopBottom( true, false, 477, 502 )
	GroupLevel:setRGB( 0.5, 0.51, 0.52 )
	GroupLevel:setAlpha( 0 )
	GroupLevel:setText( Engine.Localize( "GROUPS_GROUP_LEVEL" ) )
	GroupLevel:setTTF( "fonts/default.ttf" )
	self:addElement( GroupLevel )
	self.GroupLevel = GroupLevel
	
	local GroupClanTagBacking = LUI.UIImage.new()
	GroupClanTagBacking:setLeftRight( true, false, 15, 79 )
	GroupClanTagBacking:setTopBottom( true, false, 334, 359 )
	GroupClanTagBacking:setRGB( 0.87, 0.88, 0.78 )
	self:addElement( GroupClanTagBacking )
	self.GroupClanTagBacking = GroupClanTagBacking
	
	local GroupClanTag = LUI.UIText.new()
	GroupClanTag:setLeftRight( true, false, 1, 93.5 )
	GroupClanTag:setTopBottom( true, false, 339, 359 )
	GroupClanTag:setRGB( 0, 0, 0 )
	GroupClanTag:setText( Engine.Localize( "CLAN" ) )
	GroupClanTag:setTTF( "fonts/UnitedSansRgMd.ttf" )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GroupClanTag )
	self.GroupClanTag = GroupClanTag
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, false, 85, 177.5 )
	Name:setTopBottom( true, false, 339, 359 )
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
	EmblemDummy:setLeftRight( true, false, 14, 334 )
	EmblemDummy:setTopBottom( true, false, 107.71, 304.4 )
	EmblemDummy:setImage( RegisterImage( "uie_img_t7_menu_partyeaseslide_emblemdummy" ) )
	self:addElement( EmblemDummy )
	self.EmblemDummy = EmblemDummy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				GroupMemberSummary:completeAnimation()
				self.GroupMemberSummary:setAlpha( 1 )
				self.clipFinished( GroupMemberSummary, {} )
				GroupClanTagBacking:completeAnimation()
				self.GroupClanTagBacking:setAlpha( 1 )
				self.clipFinished( GroupClanTagBacking, {} )
				GroupClanTag:completeAnimation()
				self.GroupClanTag:setAlpha( 1 )
				self.clipFinished( GroupClanTag, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupMemberSummary:close()
		self.Name:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

