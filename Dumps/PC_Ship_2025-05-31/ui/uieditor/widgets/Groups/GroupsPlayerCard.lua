require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Social.Social_Rank" )

CoD.GroupsPlayerCard = InheritFrom( LUI.UIElement )
CoD.GroupsPlayerCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsPlayerCard )
	self.id = "GroupsPlayerCard"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 325 )
	self:setTopBottom( true, false, 0, 485 )
	self.anyChildUsesUpdateState = true
	
	local Socialbackground0 = CoD.Social_background.new( menu, controller )
	Socialbackground0:setLeftRight( true, false, 0, 324 )
	Socialbackground0:setTopBottom( true, false, 0, 191 )
	self:addElement( Socialbackground0 )
	self.Socialbackground0 = Socialbackground0
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( true, false, 0, 153 )
	friendship:setTopBottom( true, false, 290.33, 312.33 )
	friendship:setAlpha( 0.5 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( true, false, 0.56, 246.56 )
	primaryGroup:setTopBottom( true, false, 283.64, 305.64 )
	primaryGroup:setAlpha( 0 )
	primaryGroup:setText( Engine.Localize( "MENU_PRIMARY_GROUP_COLON" ) )
	primaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 324 )
	emblem:setTopBottom( true, false, 0, 191 )
	emblem:linkToElementModel( self, "identityBadge.xuid", true, function ( model )
		local identityBadgeXuid = Engine.GetModelValue( model )
		if identityBadgeXuid then
			emblem:setupPlayerEmblemByXUID( identityBadgeXuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( true, false, 12.56, 336 )
	callingCard:setTopBottom( true, false, 209.25, 287.64 )
	callingCard:setScale( 1.07 )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard:setModel( model, controller )
	end )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local rankCP = CoD.Social_Rank.new( menu, controller )
	rankCP:setLeftRight( true, false, -0.44, 79.56 )
	rankCP:setTopBottom( true, false, 323, 438 )
	rankCP.GameMode:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	rankCP:linkToElementModel( self, "cpRank", true, function ( model )
		local cpRank = Engine.GetModelValue( model )
		if cpRank then
			rankCP.level:setText( Engine.Localize( RankToLevelNumber( "cp", SetValueIfStringEqualTo( "0", "-", cpRank ) ) ) )
		end
	end )
	rankCP:linkToElementModel( self, "cpRankIcon", true, function ( model )
		local cpRankIcon = Engine.GetModelValue( model )
		if cpRankIcon then
			rankCP.rankIconAdd:setImage( RegisterImage( GetRankIconLarge( cpRankIcon ) ) )
		end
	end )
	rankCP:linkToElementModel( self, "cpPrestige", true, function ( model )
		local cpPrestige = Engine.GetModelValue( model )
		if cpPrestige then
			rankCP.prestige.prestige:setAlpha( cpPrestige )
		end
	end )
	rankCP:linkToElementModel( self, "cpPrestige", true, function ( model )
		local cpPrestige = Engine.GetModelValue( model )
		if cpPrestige then
			rankCP.prestige.prestige:setText( GetPrestigeTitleForPLevelAndMode( "cp", cpPrestige ) )
		end
	end )
	self:addElement( rankCP )
	self.rankCP = rankCP
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( true, false, 122, 202 )
	rankMP:setTopBottom( true, false, 323, 438 )
	rankMP.GameMode:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local mpPrestige = Engine.GetModelValue( model )
		if mpPrestige then
			rankMP.level:setRGB( SetToParagonColorIfPrestigeMasterByPLevel( "mp", 148, 162, 165, mpPrestige ) )
		end
	end )
	rankMP:linkToElementModel( self, "mpRank", true, function ( model )
		local mpRank = Engine.GetModelValue( model )
		if mpRank then
			rankMP.level:setText( Engine.Localize( mpRank ) )
		end
	end )
	rankMP:linkToElementModel( self, "mpRankIcon", true, function ( model )
		local mpRankIcon = Engine.GetModelValue( model )
		if mpRankIcon then
			rankMP.rankIconAdd:setImage( RegisterImage( GetRankIconLarge( mpRankIcon ) ) )
		end
	end )
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local mpPrestige = Engine.GetModelValue( model )
		if mpPrestige then
			rankMP.prestige.prestige:setAlpha( mpPrestige )
		end
	end )
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local mpPrestige = Engine.GetModelValue( model )
		if mpPrestige then
			rankMP.prestige.prestige:setText( GetPrestigeTitleForPLevelAndMode( "mp", mpPrestige ) )
		end
	end )
	self:addElement( rankMP )
	self.rankMP = rankMP
	
	local rankZM = CoD.Social_Rank.new( menu, controller )
	rankZM:setLeftRight( true, false, 242.91, 322.91 )
	rankZM:setTopBottom( true, false, 323, 438 )
	rankZM.GameMode:setText( Engine.Localize( "MENU_ZOMBIE_MODE_CAPS" ) )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local zmRank = Engine.GetModelValue( model )
		if zmRank then
			rankZM.level:setText( Engine.Localize( RankToLevelNumber( "zm", SetValueIfStringEqualTo( "0", "-", zmRank ) ) ) )
		end
	end )
	rankZM:linkToElementModel( self, "zmRankIcon", true, function ( model )
		local zmRankIcon = Engine.GetModelValue( model )
		if zmRankIcon then
			rankZM.rankIconAdd:setImage( RegisterImage( GetRankIconLarge( zmRankIcon ) ) )
		end
	end )
	rankZM:linkToElementModel( self, "zmPrestige", true, function ( model )
		local zmPrestige = Engine.GetModelValue( model )
		if zmPrestige then
			rankZM.prestige.prestige:setAlpha( zmPrestige )
		end
	end )
	rankZM:linkToElementModel( self, "zmPrestige", true, function ( model )
		local zmPrestige = Engine.GetModelValue( model )
		if zmPrestige then
			rankZM.prestige.prestige:setText( GetPrestigeTitleForPLevelAndMode( "zm", zmPrestige ) )
		end
	end )
	self:addElement( rankZM )
	self.rankZM = rankZM
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 324 )
				self.emblem:setTopBottom( true, false, 0, 191.01 )
				self.clipFinished( emblem, {} )
				rankCP:completeAnimation()
				self.rankCP:setYRot( 0 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setYRot( 0 )
				self.clipFinished( rankMP, {} )
			end
		},
		PlayerDetails = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 195.66 )
				self.Socialbackground0:setTopBottom( true, false, 0, 116.05 )
				self.clipFinished( Socialbackground0, {} )
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
				self.callingCard:setLeftRight( true, false, 189.75, 449.36 )
				self.callingCard:setTopBottom( true, false, -2.51, 60.61 )
				self.callingCard:setScale( 0.87 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( true, false, 485.9, 565.9 )
				self.rankCP:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( true, false, 595.4, 675.4 )
				self.rankMP:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 704.9, 784.5 )
				self.rankZM:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankZM, {} )
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 195.66 )
				self.Socialbackground0:setTopBottom( true, false, 0, 116.05 )
				self.clipFinished( Socialbackground0, {} )
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
				self.callingCard:setLeftRight( true, false, 189.75, 449.36 )
				self.callingCard:setTopBottom( true, false, -2.51, 60.61 )
				self.callingCard:setScale( 0.87 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( true, false, 485.9, 565.9 )
				self.rankCP:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( true, false, 595.4, 675.4 )
				self.rankMP:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 704.9, 784.5 )
				self.rankZM:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankZM, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 324 )
				self.Socialbackground0:setTopBottom( true, false, 0, 190.83 )
				self.clipFinished( Socialbackground0, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 4, 250 )
				self.primaryGroup:setTopBottom( true, false, 277.33, 299.33 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 324 )
				self.emblem:setTopBottom( true, false, 0, 191.01 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, 13, 341.01 )
				self.callingCard:setTopBottom( true, false, 197.73, 277.33 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( true, false, -0.44, 79.56 )
				self.rankCP:setTopBottom( true, false, 313, 428 )
				self.rankCP:setYRot( 0 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( true, false, 121.4, 201.4 )
				self.rankMP:setTopBottom( true, false, 313, 428 )
				self.rankMP:setYRot( 0 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 242.91, 322.91 )
				self.rankZM:setTopBottom( true, false, 313, 428 )
				self.clipFinished( rankZM, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Socialbackground0:close()
		element.friendship:close()
		element.callingCard:close()
		element.rankCP:close()
		element.rankMP:close()
		element.rankZM:close()
		element.emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

