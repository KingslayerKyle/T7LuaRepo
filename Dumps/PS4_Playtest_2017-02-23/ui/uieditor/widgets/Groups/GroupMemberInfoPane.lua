require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Party" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_NotInTitle" )
require( "ui.uieditor.widgets.Social.Social_Rank" )

CoD.GroupMemberInfoPane = InheritFrom( LUI.UIElement )
CoD.GroupMemberInfoPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupMemberInfoPane )
	self.id = "GroupMemberInfoPane"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1179 )
	self:setTopBottom( 0, 0, 0, 727 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Socialbackground00 = CoD.Social_background.new( menu, controller )
	Socialbackground00:setLeftRight( 0, 0, 0, 483 )
	Socialbackground00:setTopBottom( 0, 0, 293, 412 )
	self:addElement( Socialbackground00 )
	self.Socialbackground00 = Socialbackground00
	
	local Socialbackground0 = CoD.Social_background.new( menu, controller )
	Socialbackground0:setLeftRight( 0, 0, 0, 485 )
	Socialbackground0:setTopBottom( 0, 0, 0, 285 )
	self:addElement( Socialbackground0 )
	self.Socialbackground0 = Socialbackground0
	
	local notInTitle = CoD.Social_InfoPane_Presence_NotInTitle.new( menu, controller )
	notInTitle:setLeftRight( 0, 0, 553, 994 )
	notInTitle:setTopBottom( 0, 0, -3, 105 )
	notInTitle:setAlpha( 0 )
	notInTitle:linkToElementModel( self, nil, false, function ( model )
		notInTitle:setModel( model, controller )
	end )
	self:addElement( notInTitle )
	self.notInTitle = notInTitle
	
	local presence = CoD.Social_InfoPane_Presence.new( menu, controller )
	presence:setLeftRight( 0, 0, 564, 1006 )
	presence:setTopBottom( 0, 0, -4, 239 )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	self:addElement( presence )
	self.presence = presence
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( 0, 0, 7, 237 )
	friendship:setTopBottom( 0, 0, 451, 484 )
	friendship:setAlpha( 0.5 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( 0, 0, 12, 381 )
	primaryGroup:setTopBottom( 0, 0, 422, 455 )
	primaryGroup:setText( Engine.Localize( "Primary Group: Treyarch" ) )
	primaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 0, 484 )
	emblem:setTopBottom( 0, 0, 0, 285 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( 0, 0, 0, 485 )
	callingCard:setTopBottom( 0, 0, 293, 412 )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local rankCP = CoD.Social_Rank.new( menu, controller )
	rankCP:setLeftRight( 0, 0, -1, 119 )
	rankCP:setTopBottom( 0, 0, 464, 636 )
	rankCP.GameMode:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	rankCP.prestige.prestige:setText( Engine.Localize( "" ) )
	rankCP:linkToElementModel( self, "cpRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.level:setText( Engine.Localize( modelValue ) )
		end
	end )
	rankCP:linkToElementModel( self, "cpRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.rankIconAdd:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	self:addElement( rankCP )
	self.rankCP = rankCP
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( 0, 0, 182, 302 )
	rankMP:setTopBottom( 0, 0, 464, 636 )
	rankMP.GameMode:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	rankMP.prestige.prestige:setText( Engine.Localize( "" ) )
	rankMP:linkToElementModel( self, "mpRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.level:setText( Engine.Localize( modelValue ) )
		end
	end )
	rankMP:linkToElementModel( self, "mpRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.rankIconAdd:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	self:addElement( rankMP )
	self.rankMP = rankMP
	
	local rankZM = CoD.Social_Rank.new( menu, controller )
	rankZM:setLeftRight( 0, 0, 364, 484 )
	rankZM:setTopBottom( 0, 0, 464, 636 )
	rankZM.GameMode:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	rankZM.prestige.prestige:setText( Engine.Localize( "" ) )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.level:setText( Engine.Localize( modelValue ) )
		end
	end )
	rankZM:linkToElementModel( self, "zmRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.rankIconAdd:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	self:addElement( rankZM )
	self.rankZM = rankZM
	
	local MissionRecordVaultlines01 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines01:setLeftRight( 0, 0, 577, 1005 )
	MissionRecordVaultlines01:setTopBottom( 0, 0, 179, 185 )
	MissionRecordVaultlines01:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines01 )
	self.MissionRecordVaultlines01 = MissionRecordVaultlines01
	
	local MissionRecordVaultlines010 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines010:setLeftRight( 0, 0, 543, 971 )
	MissionRecordVaultlines010:setTopBottom( 0, 0, 233, 239 )
	MissionRecordVaultlines010:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines010 )
	self.MissionRecordVaultlines010 = MissionRecordVaultlines010
	
	local party = CoD.Social_InfoPane_Party.new( menu, controller )
	party:setLeftRight( 0, 0, 564.5, 1011.5 )
	party:setTopBottom( 0, 0, 288, 719 )
	party:linkToElementModel( self, nil, false, function ( model )
		party:setModel( model, controller )
	end )
	self:addElement( party )
	self.party = party
	
	callingCard.navigation = {
		right = party
	}
	party.navigation = {
		left = callingCard
	}
	self.resetProperties = function ()
		notInTitle:completeAnimation()
		MissionRecordVaultlines01:completeAnimation()
		friendship:completeAnimation()
		rankCP:completeAnimation()
		rankMP:completeAnimation()
		rankZM:completeAnimation()
		presence:completeAnimation()
		MissionRecordVaultlines010:completeAnimation()
		callingCard:completeAnimation()
		emblem:completeAnimation()
		Socialbackground0:completeAnimation()
		Socialbackground00:completeAnimation()
		primaryGroup:completeAnimation()
		notInTitle:setLeftRight( 0, 0, 553, 994 )
		notInTitle:setTopBottom( 0, 0, -3, 105 )
		notInTitle:setAlpha( 0 )
		MissionRecordVaultlines01:setLeftRight( 0, 0, 577, 1005 )
		MissionRecordVaultlines01:setTopBottom( 0, 0, 179, 185 )
		friendship:setLeftRight( 0, 0, 7, 237 )
		friendship:setTopBottom( 0, 0, 451, 484 )
		rankCP:setLeftRight( 0, 0, -1, 119 )
		rankCP:setTopBottom( 0, 0, 464, 636 )
		rankMP:setLeftRight( 0, 0, 182, 302 )
		rankMP:setTopBottom( 0, 0, 464, 636 )
		rankZM:setLeftRight( 0, 0, 364, 484 )
		rankZM:setTopBottom( 0, 0, 464, 636 )
		presence:setLeftRight( 0, 0, 564, 1006 )
		presence:setTopBottom( 0, 0, -4, 239 )
		MissionRecordVaultlines010:setLeftRight( 0, 0, 543, 971 )
		MissionRecordVaultlines010:setTopBottom( 0, 0, 233, 239 )
		callingCard:setLeftRight( 0, 0, 0, 485 )
		callingCard:setTopBottom( 0, 0, 293, 412 )
		emblem:setLeftRight( 0, 0, 0, 484 )
		emblem:setTopBottom( 0, 0, 0, 285 )
		Socialbackground0:setLeftRight( 0, 0, 0, 485 )
		Socialbackground0:setTopBottom( 0, 0, 0, 285 )
		Socialbackground00:setLeftRight( 0, 0, 0, 483 )
		Socialbackground00:setTopBottom( 0, 0, 293, 412 )
		primaryGroup:setLeftRight( 0, 0, 12, 381 )
		primaryGroup:setTopBottom( 0, 0, 422, 455 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( 0, 0, 564, 1005 )
				self.notInTitle:setTopBottom( 0, 0, 0, 108 )
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 7, 237 )
				self.friendship:setTopBottom( 0, 0, 450, 483 )
				self.clipFinished( friendship, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( 0, 0, 543, 971 )
				self.MissionRecordVaultlines01:setTopBottom( 0, 0, 179, 185 )
				self.clipFinished( MissionRecordVaultlines01, {} )
			end
		},
		PlayerDetails = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				Socialbackground00:completeAnimation()
				self.Socialbackground00:setLeftRight( 0, 0, 300.5, 690.5 )
				self.Socialbackground00:setTopBottom( 0, 0, 4, 101 )
				self.clipFinished( Socialbackground00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( 0, 0, 0, 293 )
				self.Socialbackground0:setTopBottom( 0, 0, 0.5, 174.5 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( 0, 0, -2, 695 )
				self.notInTitle:setTopBottom( 0, 0, 223, 371 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( 0, 0, -2, 700 )
				self.presence:setTopBottom( 0, 0, 215, 436 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 298, 528 )
				self.friendship:setTopBottom( 0, 0, 136, 169 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 301, 670 )
				self.primaryGroup:setTopBottom( 0, 0, 107, 140 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, 0.5, 293.5 )
				self.emblem:setTopBottom( 0, 0, 0.5, 174.5 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 301, 690 )
				self.callingCard:setTopBottom( 0, 0, 5, 100 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, 729, 839 )
				self.rankCP:setTopBottom( 0, 0, 4, 154 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 893, 1003 )
				self.rankMP:setTopBottom( 0, 0, 4, 154 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 1057, 1167 )
				self.rankZM:setTopBottom( 0, 0, 4, 154 )
				self.clipFinished( rankZM, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( 0, 0, 4, 700 )
				self.MissionRecordVaultlines01:setTopBottom( 0, 0, 376, 382 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setLeftRight( 0, 0, 4, 700 )
				self.MissionRecordVaultlines010:setTopBottom( 0, 0, 429, 435 )
				self.clipFinished( MissionRecordVaultlines010, {} )
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				Socialbackground00:completeAnimation()
				self.Socialbackground00:setLeftRight( 0, 0, 300.5, 690.5 )
				self.Socialbackground00:setTopBottom( 0, 0, 4, 101 )
				self.clipFinished( Socialbackground00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( 0, 0, 0, 293 )
				self.Socialbackground0:setTopBottom( 0, 0, 0.5, 174.5 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( 0, 0, -2, 695 )
				self.notInTitle:setTopBottom( 0, 0, 223, 371 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( 0, 0, -2, 700 )
				self.presence:setTopBottom( 0, 0, 215, 436 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 298, 528 )
				self.friendship:setTopBottom( 0, 0, 136, 169 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 301, 670 )
				self.primaryGroup:setTopBottom( 0, 0, 107, 140 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, 0.5, 293.5 )
				self.emblem:setTopBottom( 0, 0, 0.5, 174.5 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 301, 690 )
				self.callingCard:setTopBottom( 0, 0, 5, 100 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, 729, 839 )
				self.rankCP:setTopBottom( 0, 0, 4, 154 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 893, 1003 )
				self.rankMP:setTopBottom( 0, 0, 4, 154 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 1057, 1167 )
				self.rankZM:setTopBottom( 0, 0, 4, 154 )
				self.clipFinished( rankZM, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( 0, 0, 4, 700 )
				self.MissionRecordVaultlines01:setTopBottom( 0, 0, 376, 382 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setLeftRight( 0, 0, 4, 700 )
				self.MissionRecordVaultlines010:setTopBottom( 0, 0, 429, 435 )
				self.clipFinished( MissionRecordVaultlines010, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( 0, 0, 531, 972 )
				self.notInTitle:setTopBottom( 0, 0, -2, 106 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( 0, 0, 530, 972 )
				self.presence:setTopBottom( 0, 0, -4, 239 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 7, 237 )
				self.friendship:setTopBottom( 0, 0, 450, 483 )
				self.clipFinished( friendship, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 364, 484 )
				self.rankZM:setTopBottom( 0, 0, 503, 675 )
				self.clipFinished( rankZM, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( 0, 0, 543, 971 )
				self.MissionRecordVaultlines01:setTopBottom( 0, 0, 179, 185 )
				self.clipFinished( MissionRecordVaultlines01, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PlayerDetails",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "PlayerDetails_NotInTitle",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotInTitle",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	callingCard.id = "callingCard"
	party.id = "party"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.party:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Socialbackground00:close()
		self.Socialbackground0:close()
		self.notInTitle:close()
		self.presence:close()
		self.friendship:close()
		self.callingCard:close()
		self.rankCP:close()
		self.rankMP:close()
		self.rankZM:close()
		self.MissionRecordVaultlines01:close()
		self.MissionRecordVaultlines010:close()
		self.party:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

