require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_NotInTitle" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Social.Social_Rank" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Party" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SocialRoot.recentPlayers.update" )
	self:subscribeToGlobalModel( controller, "SocialRoot", "recentPlayers.update", function ( model )
		DataSources.SocialPlayerInfo.getModel( controller )
	end )
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
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( false, false, -40, 261 )
	StartMenuframenoBG0:setTopBottom( true, true, -2, -35 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, false, 487, 787 )
	StartMenuframenoBG00:setTopBottom( true, false, 143, 355 )
	StartMenuframenoBG00:setAlpha( 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local Socialbackground0 = CoD.Social_background.new( menu, controller )
	Socialbackground0:setLeftRight( true, false, 0, 324 )
	Socialbackground0:setTopBottom( true, false, 0, 191 )
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
	presence:setLeftRight( true, false, 352, 655 )
	presence:setTopBottom( true, false, -2, 189.83 )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	self:addElement( presence )
	self.presence = presence
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( true, false, 0, 153 )
	friendship:setTopBottom( true, false, 280.33, 302.33 )
	friendship:setAlpha( 0.5 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( true, false, 0.56, 246.56 )
	primaryGroup:setTopBottom( true, false, 273.64, 295.64 )
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
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( true, false, 0, 328.01 )
	callingCard:setTopBottom( true, false, 195.25, 274.85 )
	callingCard.CallingCardsFrameWidget.CardIconFrame:setScale( 0.67 )
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
	rankCP:setTopBottom( true, false, 313, 428 )
	rankCP.GameMode:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	rankCP:linkToElementModel( self, "cpRank", true, function ( model )
		local cpRank = Engine.GetModelValue( model )
		if cpRank then
			rankCP.level:setText( Engine.Localize( SetValueIfStringEqualTo( "0", "-", ToString( cpRank ) ) ) )
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
			rankCP.prestige.prestige:setText( Engine.Localize( GetPrestigeTitleForPLevelAndMode( "cp", cpPrestige ) ) )
		end
	end )
	self:addElement( rankCP )
	self.rankCP = rankCP
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( true, false, 122, 202 )
	rankMP:setTopBottom( true, false, 313, 428 )
	rankMP.GameMode:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	rankMP:linkToElementModel( self, "mpRank", true, function ( model )
		local mpRank = Engine.GetModelValue( model )
		if mpRank then
			rankMP.level:setText( Engine.Localize( RankToLevelNumber( "mp", mpRank ) ) )
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
			rankMP.prestige.prestige:setText( Engine.Localize( GetPrestigeTitleForPLevelAndMode( "mp", mpPrestige ) ) )
		end
	end )
	self:addElement( rankMP )
	self.rankMP = rankMP
	
	local rankZM = CoD.Social_Rank.new( menu, controller )
	rankZM:setLeftRight( true, false, 242.91, 322.91 )
	rankZM:setTopBottom( true, false, 313, 428 )
	rankZM.GameMode:setText( Engine.Localize( "MENU_ZOMBIE_MODE_CAPS" ) )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local zmRank = Engine.GetModelValue( model )
		if zmRank then
			rankZM.level:setText( Engine.Localize( SetValueIfStringEqualTo( "0", "-", ToString( zmRank ) ) ) )
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
			rankZM.prestige.prestige:setText( Engine.Localize( GetPrestigeTitleForPLevelAndMode( "zm", zmPrestige ) ) )
		end
	end )
	self:addElement( rankZM )
	self.rankZM = rankZM
	
	local party = CoD.Social_InfoPane_Party.new( menu, controller )
	party:setLeftRight( true, false, 354, 652 )
	party:setTopBottom( true, false, 192.25, 479.75 )
	party:linkToElementModel( self, "partySize", true, function ( model )
		local partySize = Engine.GetModelValue( model )
		if partySize then
			party:setAlpha( SocialShowPartyHeader( partySize ) )
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
				self:setupElementClipCounter( 11 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( false, false, -40, 261 )
				self.StartMenuframenoBG0:setTopBottom( true, true, -2, -35 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 324 )
				self.Socialbackground0:setTopBottom( true, false, 0, 190.83 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, 354, 648 )
				self.notInTitle:setTopBottom( true, false, -1, 144 )
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( true, false, 352, 655 )
				self.presence:setTopBottom( true, false, -2, 189.83 )
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 324 )
				self.emblem:setTopBottom( true, false, 0, 191.01 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, 0, 328.01 )
				self.callingCard:setTopBottom( true, false, 195.25, 274.85 )
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
				party:completeAnimation()
				self.party:setLeftRight( true, false, 354, 652 )
				self.party:setTopBottom( true, false, 192.25, 479.75 )
				self.clipFinished( party, {} )
			end
		},
		PlayerDetails = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 0, 468 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 143, 355 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( true, false, 484.9, 786.9 )
				self.StartMenuframenoBG00:setTopBottom( true, false, 143, 355 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
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
				self.presence:setLeftRight( true, false, -2, 470 )
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
				callingCard.CallingCardsFrameWidget.CardIconFrame:completeAnimation()
				self.callingCard:setLeftRight( true, false, 200.75, 460.36 )
				self.callingCard:setTopBottom( true, false, 3.49, 66.61 )
				self.callingCard.CallingCardsFrameWidget.CardIconFrame:setScale( 0.53 )
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
				party:completeAnimation()
				self.party:setLeftRight( true, false, 486.9, 786.9 )
				self.party:setTopBottom( true, false, 143, 431 )
				self.clipFinished( party, {} )
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( false, false, -393, 75 )
				self.StartMenuframenoBG0:setTopBottom( true, true, 143, -130 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( true, false, 484, 786 )
				self.StartMenuframenoBG00:setTopBottom( true, false, 143, 355 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 195.66 )
				self.Socialbackground0:setTopBottom( true, false, 0, 116.05 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, 0, 468 )
				self.notInTitle:setTopBottom( true, false, 143, 290 )
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( true, false, 0, 468 )
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
				callingCard.CallingCardsFrameWidget.CardIconFrame:completeAnimation()
				self.callingCard:setLeftRight( true, false, 200.75, 460.36 )
				self.callingCard:setTopBottom( true, false, 3.49, 66.61 )
				self.callingCard.CallingCardsFrameWidget.CardIconFrame:setScale( 0.53 )
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
				party:completeAnimation()
				self.party:setLeftRight( true, false, 485.9, 789.9 )
				self.party:setTopBottom( true, false, 143, 431 )
				self.clipFinished( party, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 353, 654 )
				self.StartMenuframenoBG0:setTopBottom( true, false, -2, 450 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, 0, 324 )
				self.Socialbackground0:setTopBottom( true, false, 0, 190.83 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, 354, 656 )
				self.notInTitle:setTopBottom( true, false, -1, 71 )
				self.notInTitle:setAlpha( 0 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( true, false, 352, 655 )
				self.presence:setTopBottom( true, false, -2, 189.83 )
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 4, 250 )
				self.primaryGroup:setTopBottom( true, false, 277.33, 299.33 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, 0, 324 )
				self.emblem:setTopBottom( true, false, 0, 191.01 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, 0, 328.01 )
				self.callingCard:setTopBottom( true, false, 195.25, 274.85 )
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
				party:completeAnimation()
				self.party:setLeftRight( true, false, 354, 652 )
				self.party:setTopBottom( true, false, 192.25, 479.75 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG00:close()
		element.Socialbackground0:close()
		element.notInTitle:close()
		element.presence:close()
		element.friendship:close()
		element.callingCard:close()
		element.rankCP:close()
		element.rankMP:close()
		element.rankZM:close()
		element.party:close()
		element.emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

