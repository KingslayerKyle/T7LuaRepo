require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_NotInTitle" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Social.Social_Rank" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Party" )

local PostLoadFunc = function ( self, controller, menu )
	
end

CoD.Social_InfoPane = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane )
	self.id = "Social_InfoPane"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 786 )
	self:setTopBottom( true, false, 0, 485 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Socialbackground00 = CoD.Social_background.new( menu, controller )
	Socialbackground00:setLeftRight( true, false, 0, 322.16 )
	Socialbackground00:setTopBottom( true, false, 195.33, 274.64 )
	self:addElement( Socialbackground00 )
	self.Socialbackground00 = Socialbackground00
	
	local Socialbackground0 = CoD.Social_background.new( menu, controller )
	Socialbackground0:setLeftRight( true, false, 0, 323.28 )
	Socialbackground0:setTopBottom( true, false, 0, 189.83 )
	self:addElement( Socialbackground0 )
	self.Socialbackground0 = Socialbackground0
	
	local notInTitle = CoD.Social_InfoPane_Presence_NotInTitle.new( menu, controller )
	notInTitle:setLeftRight( true, false, 346, 640 )
	notInTitle:setTopBottom( true, false, -2, 70 )
	notInTitle:setAlpha( 0 )
	notInTitle:linkToElementModel( self, nil, false, function ( model )
		notInTitle:setModel( model, controller )
	end )
	self:addElement( notInTitle )
	self.notInTitle = notInTitle
	
	local presence = CoD.Social_InfoPane_Presence.new( menu, controller )
	presence:setLeftRight( true, false, 353, 648 )
	presence:setTopBottom( true, false, -2.44, 159.56 )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	self:addElement( presence )
	self.presence = presence
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( true, false, 5, 158 )
	friendship:setTopBottom( true, false, 300.33, 322.33 )
	friendship:setAlpha( 0.5 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( true, false, 7, 253 )
	primaryGroup:setTopBottom( true, false, 281.33, 303.33 )
	primaryGroup:setAlpha( 0 )
	primaryGroup:setText( Engine.Localize( "MENU_PRIMARY_GROUP_COLON" ) )
	primaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 322.91 )
	emblem:setTopBottom( true, false, 0, 189.83 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( true, false, -0.1, 322.91 )
	callingCard:setTopBottom( true, false, 195.33, 274.93 )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard:setModel( model, controller )
	end )
	callingCard:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			callingCard.backing:setImage( RegisterImage( GetRandomPlayercardForPlayer( modelValue ) ) )
		end
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local rankCP = CoD.Social_Rank.new( menu, controller )
	rankCP:setLeftRight( true, false, -0.44, 79.56 )
	rankCP:setTopBottom( true, false, 335, 450 )
	rankCP.levelBackground:setAlpha( 0 )
	rankCP.level:setAlpha( 0 )
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
	rankCP:linkToElementModel( self, "cpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.prestige:setAlpha( modelValue )
		end
	end )
	rankCP:linkToElementModel( self, "cpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.prestige:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rankCP )
	self.rankCP = rankCP
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( true, false, 121.4, 201.4 )
	rankMP:setTopBottom( true, false, 335, 450 )
	rankMP:linkToElementModel( self, "mpRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.level:setText( Engine.Localize( RankToLevelNumber( "mp", modelValue ) ) )
		end
	end )
	rankMP:linkToElementModel( self, "mpRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.rankIconAdd:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.prestige:setAlpha( modelValue )
		end
	end )
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.prestige:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rankMP )
	self.rankMP = rankMP
	
	local rankZM = CoD.Social_Rank.new( menu, controller )
	rankZM:setLeftRight( true, false, 242.91, 322.91 )
	rankZM:setTopBottom( true, false, 335, 450 )
	rankZM.levelBackground:setAlpha( 0 )
	rankZM.level:setAlpha( 0 )
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
	rankZM:linkToElementModel( self, "zmPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.prestige:setAlpha( modelValue )
		end
	end )
	rankZM:linkToElementModel( self, "zmPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.prestige:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rankZM )
	self.rankZM = rankZM
	
	local MissionRecordVaultlines01 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines01:setLeftRight( true, false, 362, 647 )
	MissionRecordVaultlines01:setTopBottom( true, false, 119.56, 123.56 )
	MissionRecordVaultlines01:setAlpha( 0.5 )
	self:addElement( MissionRecordVaultlines01 )
	self.MissionRecordVaultlines01 = MissionRecordVaultlines01
	
	local MissionRecordVaultlines010 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines010:setLeftRight( true, false, 362, 647 )
	MissionRecordVaultlines010:setTopBottom( true, false, 155.56, 159.56 )
	MissionRecordVaultlines010:setAlpha( 0.5 )
	self:addElement( MissionRecordVaultlines010 )
	self.MissionRecordVaultlines010 = MissionRecordVaultlines010
	
	local party = CoD.Social_InfoPane_Party.new( menu, controller )
	party:setLeftRight( true, false, 353, 651 )
	party:setTopBottom( true, false, 191.83, 479.33 )
	party:linkToElementModel( self, "partySize", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			party:setAlpha( SocialShowPartyHeader( modelValue ) )
		end
	end )
	party:linkToElementModel( self, nil, false, function ( model )
		party:setModel( model, controller )
	end )
	self:addElement( party )
	self.party = party
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Socialbackground00:completeAnimation()
				self.Socialbackground00:setLeftRight( true, false, 0, 322.16 )
				self.Socialbackground00:setTopBottom( true, false, 195.33, 274.64 )
				self.clipFinished( Socialbackground00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 323.28 )
				self.Socialbackground0:setTopBottom( true, false, 0, 189.83 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, 354, 648 )
				self.notInTitle:setTopBottom( true, false, -1, 71 )
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( true, false, 353, 648 )
				self.presence:setTopBottom( true, false, -2.44, 159.56 )
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( true, false, 5, 158 )
				self.friendship:setTopBottom( true, false, 300.33, 322.33 )
				self.clipFinished( friendship, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 322.91 )
				self.emblem:setTopBottom( true, false, 0, 189.83 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, -0.1, 322.91 )
				self.callingCard:setTopBottom( true, false, 195.33, 274.93 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setYRot( 0 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setYRot( 0 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 242.91, 322.91 )
				self.rankZM:setTopBottom( true, false, 335, 450 )
				self.clipFinished( rankZM, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( true, false, 362, 647 )
				self.MissionRecordVaultlines01:setTopBottom( true, false, 119.56, 123.56 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setLeftRight( true, false, 362, 647 )
				self.MissionRecordVaultlines010:setTopBottom( true, false, 155.56, 159.56 )
				self.clipFinished( MissionRecordVaultlines010, {} )
				party:completeAnimation()
				self.party:setLeftRight( true, false, 353, 651 )
				self.party:setTopBottom( true, false, 192, 480 )
				self.clipFinished( party, {} )
			end
		},
		PlayerDetails = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				Socialbackground00:completeAnimation()
				self.Socialbackground00:setLeftRight( true, false, 200.39, 460.36 )
				self.Socialbackground00:setTopBottom( true, false, 3, 67.61 )
				self.clipFinished( Socialbackground00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 195.66 )
				self.Socialbackground0:setTopBottom( true, false, 0, 116.05 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, -5, 468 )
				self.notInTitle:setTopBottom( true, false, 143, 290 )
				self.notInTitle:setAlpha( 0 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( true, false, -5, 468 )
				self.presence:setTopBottom( true, false, 143, 290 )
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( true, false, 203.66, 356.66 )
				self.friendship:setTopBottom( true, false, 90.61, 112.61 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 205.37, 451.37 )
				self.primaryGroup:setTopBottom( true, false, 68.61, 90.61 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 195.66 )
				self.emblem:setTopBottom( true, false, 0, 116.05 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, 200.75, 460.36 )
				self.callingCard:setTopBottom( true, false, 3.49, 66.61 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( true, false, 485.9, 558.9 )
				self.rankCP:setTopBottom( true, false, 2.55, 102.42 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( true, false, 595.4, 668.4 )
				self.rankMP:setTopBottom( true, false, 2.55, 102.42 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 704.9, 777.9 )
				self.rankZM:setTopBottom( true, false, 2.55, 102.42 )
				self.clipFinished( rankZM, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( true, false, 3, 466.72 )
				self.MissionRecordVaultlines01:setTopBottom( true, false, 250.89, 254.89 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setLeftRight( true, false, 3, 466.72 )
				self.MissionRecordVaultlines010:setTopBottom( true, false, 285.89, 289.89 )
				self.clipFinished( MissionRecordVaultlines010, {} )
				party:completeAnimation()
				self.party:setLeftRight( true, false, 489, 789 )
				self.party:setTopBottom( true, false, 143, 431 )
				self.clipFinished( party, {} )
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				Socialbackground00:completeAnimation()
				self.Socialbackground00:setLeftRight( true, false, 200.39, 460.36 )
				self.Socialbackground00:setTopBottom( true, false, 3, 67.61 )
				self.clipFinished( Socialbackground00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 195.66 )
				self.Socialbackground0:setTopBottom( true, false, 0, 116.05 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, -5, 468 )
				self.notInTitle:setTopBottom( true, false, 143, 290 )
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( true, false, -5, 468 )
				self.presence:setTopBottom( true, false, 143, 290 )
				self.presence:setAlpha( 0 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( true, false, 203.66, 356.66 )
				self.friendship:setTopBottom( true, false, 90.61, 112.61 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 205.37, 451.37 )
				self.primaryGroup:setTopBottom( true, false, 68.61, 90.61 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 195.66 )
				self.emblem:setTopBottom( true, false, 0, 116.05 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, 200.75, 460.36 )
				self.callingCard:setTopBottom( true, false, 3.49, 66.61 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( true, false, 485.9, 558.9 )
				self.rankCP:setTopBottom( true, false, 2.55, 102.42 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( true, false, 595.4, 668.4 )
				self.rankMP:setTopBottom( true, false, 2.55, 102.42 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 704.9, 777.9 )
				self.rankZM:setTopBottom( true, false, 2.55, 102.42 )
				self.clipFinished( rankZM, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( true, false, 3, 466.72 )
				self.MissionRecordVaultlines01:setTopBottom( true, false, 250.89, 254.89 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setLeftRight( true, false, 3, 466.72 )
				self.MissionRecordVaultlines010:setTopBottom( true, false, 285.89, 289.89 )
				self.clipFinished( MissionRecordVaultlines010, {} )
				party:completeAnimation()
				self.party:setLeftRight( true, false, 489, 789 )
				self.party:setTopBottom( true, false, 143, 431 )
				self.clipFinished( party, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Socialbackground00:completeAnimation()
				self.Socialbackground00:setLeftRight( true, false, 0, 322.16 )
				self.Socialbackground00:setTopBottom( true, false, 195.33, 274.64 )
				self.clipFinished( Socialbackground00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 323.28 )
				self.Socialbackground0:setTopBottom( true, false, 0, 189.83 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, 354, 648 )
				self.notInTitle:setTopBottom( true, false, -1, 71 )
				self.notInTitle:setAlpha( 0 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( true, false, 353, 648 )
				self.presence:setTopBottom( true, false, -2.44, 159.56 )
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( true, false, 5, 158 )
				self.friendship:setTopBottom( true, false, 300.33, 322.33 )
				self.clipFinished( friendship, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 322.91 )
				self.emblem:setTopBottom( true, false, 0, 189.83 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, -0.1, 322.91 )
				self.callingCard:setTopBottom( true, false, 195.33, 274.93 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setYRot( 0 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setYRot( 0 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 242.91, 322.91 )
				self.rankZM:setTopBottom( true, false, 335, 450 )
				self.clipFinished( rankZM, {} )
				MissionRecordVaultlines01:completeAnimation()
				self.MissionRecordVaultlines01:setLeftRight( true, false, 362, 647 )
				self.MissionRecordVaultlines01:setTopBottom( true, false, 119.56, 123.56 )
				self.clipFinished( MissionRecordVaultlines01, {} )
				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setLeftRight( true, false, 362, 647 )
				self.MissionRecordVaultlines010:setTopBottom( true, false, 155.56, 159.56 )
				self.clipFinished( MissionRecordVaultlines010, {} )
				party:completeAnimation()
				self.party:setLeftRight( true, false, 353, 651 )
				self.party:setTopBottom( true, false, 192, 479 )
				self.clipFinished( party, {} )
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
		self.emblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

