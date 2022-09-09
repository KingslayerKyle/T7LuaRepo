-- 6ea87f1795d6d5404e672a1f47bfd9a7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_NotInTitle" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
require( "ui.uieditor.widgets.horizontalScrollingTextBoxGroups" )
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
	StartMenuframenoBG0:setLeftRight( true, false, 362, 664 )
	StartMenuframenoBG0:setTopBottom( true, false, 192, 450 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, false, 363, 663 )
	StartMenuframenoBG00:setTopBottom( true, false, 37, 192.25 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local Socialbackground0 = CoD.Social_background.new( menu, controller )
	Socialbackground0:setLeftRight( true, false, 10, 334 )
	Socialbackground0:setTopBottom( true, false, -1.17, 189.83 )
	self:addElement( Socialbackground0 )
	self.Socialbackground0 = Socialbackground0
	
	local notInTitle = CoD.Social_InfoPane_Presence_NotInTitle.new( menu, controller )
	notInTitle:setLeftRight( true, false, 364, 662 )
	notInTitle:setTopBottom( true, false, -2, 70 )
	notInTitle:setAlpha( 0 )
	notInTitle:linkToElementModel( self, nil, false, function ( model )
		notInTitle:setModel( model, controller )
	end )
	self:addElement( notInTitle )
	self.notInTitle = notInTitle
	
	local presence = CoD.Social_InfoPane_Presence.new( menu, controller )
	presence:setLeftRight( true, false, 364, 662 )
	presence:setTopBottom( true, false, -2, 189.83 )
	self:addElement( presence )
	self.presence = presence
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( true, false, 10, 163 )
	friendship:setTopBottom( true, false, 280.33, 302.33 )
	friendship:setAlpha( 0.5 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = CoD.horizontalScrollingTextBoxGroups.new( menu, controller )
	primaryGroup:setLeftRight( true, false, 12.56, 332.91 )
	primaryGroup:setTopBottom( true, false, 278.33, 300.33 )
	primaryGroup.textBox:setTTF( "fonts/default.ttf" )
	primaryGroup.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:linkToElementModel( self, "primaryGroup", true, function ( model )
		local _primaryGroup = Engine.GetModelValue( model )
		if _primaryGroup then
			primaryGroup:setAlpha( HideIfEmptyString( _primaryGroup ) )
		end
	end )
	primaryGroup:linkToElementModel( self, "primaryGroup", true, function ( model )
		local _primaryGroup = Engine.GetModelValue( model )
		if _primaryGroup then
			primaryGroup.textBox:setText( Engine.Localize( _primaryGroup ) )
		end
	end )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( true, false, 22.28, 324.75 )
	callingCard:setTopBottom( true, false, 199.73, 279.33 )
	callingCard:setScale( 1.07 )
	callingCard:linkToElementModel( self, "identityBadge", false, function ( model )
		callingCard:setModel( model, controller )
	end )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local rankCP = CoD.Social_Rank.new( menu, controller )
	rankCP:setLeftRight( true, false, 9.56, 89.56 )
	rankCP:setTopBottom( true, false, 312, 427 )
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
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 13, 333 )
	emblem:setTopBottom( true, false, 1.25, 188 )
	emblem:linkToElementModel( self, "identityBadge.xuid", true, function ( model )
		local identityBadgeXuid = Engine.GetModelValue( model )
		if identityBadgeXuid then
			emblem:setupPlayerEmblemByXUID( identityBadgeXuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( true, false, 132, 212 )
	rankMP:setTopBottom( true, false, 312, 427 )
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
	rankZM:setLeftRight( true, false, 252.91, 332.91 )
	rankZM:setTopBottom( true, false, 312, 427 )
	rankZM.GameMode:setText( Engine.Localize( "MENU_ZOMBIE_MODE_CAPS" ) )
	rankZM:linkToElementModel( self, "zmPrestige", true, function ( model )
		local zmPrestige = Engine.GetModelValue( model )
		if zmPrestige then
			rankZM.level:setRGB( SetToParagonColorIfPrestigeMasterByPLevel( "zm", 148, 162, 165, zmPrestige ) )
		end
	end )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local zmRank = Engine.GetModelValue( model )
		if zmRank then
			rankZM.level:setText( Engine.Localize( SetValueIfStringEqualTo( "0", "-", zmRank ) ) )
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
	
	local party = CoD.Social_InfoPane_Party.new( menu, controller )
	party:setLeftRight( true, false, 363, 662 )
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
	
	local pixel1 = LUI.UIImage.new()
	pixel1:setLeftRight( false, true, -779.69, -771.19 )
	pixel1:setTopBottom( true, false, -3, 5.5 )
	pixel1:setAlpha( 0.15 )
	pixel1:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel1 )
	self.pixel1 = pixel1
	
	local pixel00 = LUI.UIImage.new()
	pixel00:setLeftRight( false, true, -779.69, -771.19 )
	pixel00:setTopBottom( false, true, -301.25, -292.75 )
	pixel00:setAlpha( 0.15 )
	pixel00:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel00 )
	self.pixel00 = pixel00
	
	local pixel10 = LUI.UIImage.new()
	pixel10:setLeftRight( false, true, -457.25, -448.75 )
	pixel10:setTopBottom( true, false, -3, 5.5 )
	pixel10:setAlpha( 0.15 )
	pixel10:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel10 )
	self.pixel10 = pixel10
	
	local pixel000 = LUI.UIImage.new()
	pixel000:setLeftRight( false, true, -457.25, -448.75 )
	pixel000:setTopBottom( false, true, -301.5, -293 )
	pixel000:setAlpha( 0.15 )
	pixel000:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel000 )
	self.pixel000 = pixel000
	
	local StartMenuframenoBG000 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG000:setLeftRight( true, false, 10, 335 )
	StartMenuframenoBG000:setTopBottom( true, false, -2, 190 )
	self:addElement( StartMenuframenoBG000 )
	self.StartMenuframenoBG000 = StartMenuframenoBG000
	
	local StartMenuframenoBG0000 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0000:setLeftRight( true, false, 10.56, 335 )
	StartMenuframenoBG0000:setTopBottom( true, false, 196.33, 280.33 )
	self:addElement( StartMenuframenoBG0000 )
	self.StartMenuframenoBG0000 = StartMenuframenoBG0000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )

				notInTitle:completeAnimation()
				self.notInTitle:setAlpha( 0 )
				self.clipFinished( notInTitle, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 12.56, 332.91 )
				self.primaryGroup:setTopBottom( true, false, 278.33, 300.33 )
				self.clipFinished( primaryGroup, {} )

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
				self:setupElementClipCounter( 15 )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, -20.91, 472 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 143, 355 )
				self.StartMenuframenoBG0:setAlpha( 0.8 )
				self.clipFinished( StartMenuframenoBG0, {} )

				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( true, false, 484.9, 786.9 )
				self.StartMenuframenoBG00:setTopBottom( true, false, 143, 355 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )

				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, -30.91, 164.75 )
				self.Socialbackground0:setTopBottom( true, false, -5, 111.05 )
				self.Socialbackground0:setScale( 0.9 )
				self.clipFinished( Socialbackground0, {} )

				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, 117.09, 606 )
				self.notInTitle:setTopBottom( true, false, -51.98, 158.02 )
				self.notInTitle:setAlpha( 0 )
				self.clipFinished( notInTitle, {} )

				presence:completeAnimation()
				self.presence:setLeftRight( true, false, -20.91, 470 )
				self.presence:setTopBottom( true, false, 143, 290 )
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				friendship:completeAnimation()
				self.friendship:setLeftRight( true, false, 163.15, 316.15 )
				self.friendship:setTopBottom( true, false, 76.61, 98.61 )
				self.clipFinished( friendship, {} )

				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 164.75, 468 )
				self.primaryGroup:setTopBottom( true, false, 74.61, 96.61 )
				self.clipFinished( primaryGroup, {} )

				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, 166.33, 471.18 )
				self.callingCard:setTopBottom( true, false, 0, 74.12 )
				self.callingCard:setScale( 1 )
				self.clipFinished( callingCard, {} )

				rankCP:completeAnimation()
				self.rankCP:setLeftRight( true, false, 491.9, 565.9 )
				self.rankCP:setTopBottom( true, false, -0.45, 114 )
				self.clipFinished( rankCP, {} )

				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, -29.91, 165.75 )
				self.emblem:setTopBottom( true, false, -6, 110.8 )
				self.emblem:setScale( 0.9 )
				self.clipFinished( emblem, {} )

				rankMP:completeAnimation()

				rankMP.prestige.prestige:completeAnimation()
				self.rankMP:setLeftRight( true, false, 595.4, 675.4 )
				self.rankMP:setTopBottom( true, false, -0.45, 114 )
				self.clipFinished( rankMP, {} )

				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 704.9, 784.5 )
				self.rankZM:setTopBottom( true, false, -0.45, 114 )
				self.clipFinished( rankZM, {} )

				party:completeAnimation()
				self.party:setLeftRight( true, false, 486.9, 786.9 )
				self.party:setTopBottom( true, false, 143, 431 )
				self.clipFinished( party, {} )

				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setLeftRight( true, false, -23.91, 156.58 )
				self.StartMenuframenoBG000:setTopBottom( true, false, -2, 106.67 )
				self.clipFinished( StartMenuframenoBG000, {} )

				StartMenuframenoBG0000:completeAnimation()
				self.StartMenuframenoBG0000:setLeftRight( true, false, 163.15, 470 )
				self.StartMenuframenoBG0000:setTopBottom( true, false, -2, 76.61 )
				self.clipFinished( StartMenuframenoBG0000, {} )
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, -20.91, 472 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 143, 355 )
				self.clipFinished( StartMenuframenoBG0, {} )

				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( true, false, 484, 786 )
				self.StartMenuframenoBG00:setTopBottom( true, false, 143, 355 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )

				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( true, false, -20.91, 156.58 )
				self.Socialbackground0:setTopBottom( true, false, 0, 106.67 )
				self.clipFinished( Socialbackground0, {} )

				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, -20.91, 470 )
				self.notInTitle:setTopBottom( true, false, 142, 354 )
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )

				presence:completeAnimation()
				self.presence:setLeftRight( true, false, -18.91, 472 )
				self.presence:setTopBottom( true, false, 143, 290 )
				self.presence:setAlpha( 0 )
				self.clipFinished( presence, {} )

				friendship:completeAnimation()
				self.friendship:setLeftRight( true, false, 163.15, 316.15 )
				self.friendship:setTopBottom( true, false, 76.61, 98.61 )
				self.clipFinished( friendship, {} )

				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 164.75, 468 )
				self.primaryGroup:setTopBottom( true, false, 74.61, 96.61 )
				self.clipFinished( primaryGroup, {} )

				callingCard:completeAnimation()
				self.callingCard:setLeftRight( true, false, 166.32, 471.17 )
				self.callingCard:setTopBottom( true, false, 0.55, 74.12 )
				self.callingCard:setScale( 1 )
				self.clipFinished( callingCard, {} )

				rankCP:completeAnimation()
				self.rankCP:setLeftRight( true, false, 485.9, 565.9 )
				self.rankCP:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankCP, {} )

				emblem:completeAnimation()
				self.emblem:setLeftRight( true, false, -29.91, 165.75 )
				self.emblem:setTopBottom( true, false, -5, 111.8 )
				self.emblem:setScale( 0.9 )
				self.clipFinished( emblem, {} )

				rankMP:completeAnimation()
				self.rankMP:setLeftRight( true, false, 595.4, 675.4 )
				self.rankMP:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankMP, {} )

				rankZM:completeAnimation()
				self.rankZM:setLeftRight( true, false, 704.9, 784.5 )
				self.rankZM:setTopBottom( true, false, 1.55, 116 )
				self.clipFinished( rankZM, {} )

				party:completeAnimation()
				self.party:setLeftRight( true, false, 485.9, 784.5 )
				self.party:setTopBottom( true, false, 143, 431 )
				self.clipFinished( party, {} )

				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setLeftRight( true, false, -20.91, 156.58 )
				self.StartMenuframenoBG000:setTopBottom( true, false, 0, 106.67 )
				self.StartMenuframenoBG000:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG000, {} )

				StartMenuframenoBG0000:completeAnimation()
				self.StartMenuframenoBG0000:setLeftRight( true, false, 163.15, 470 )
				self.StartMenuframenoBG0000:setTopBottom( true, false, 0, 76.61 )
				self.clipFinished( StartMenuframenoBG0000, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 363, 664 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 37, 450 )
				self.StartMenuframenoBG0:setAlpha( 0.65 )
				self.clipFinished( StartMenuframenoBG0, {} )

				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )

				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( true, false, 354, 656 )
				self.notInTitle:setTopBottom( true, false, 200.73, 71 )
				self.notInTitle:setAlpha( 0 )
				self.clipFinished( notInTitle, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 12.56, 332.91 )
				self.primaryGroup:setTopBottom( true, false, 278.33, 300.33 )
				self.clipFinished( primaryGroup, {} )

				rankCP:completeAnimation()
				self.rankCP:setYRot( 0 )
				self.clipFinished( rankCP, {} )

				emblem:completeAnimation()
				self.emblem:setAlpha( 1 )
				self.clipFinished( emblem, {} )

				rankMP:completeAnimation()
				self.rankMP:setYRot( 0 )
				self.clipFinished( rankMP, {} )

				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG000, {} )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.party:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG00:close()
		element.Socialbackground0:close()
		element.notInTitle:close()
		element.presence:close()
		element.friendship:close()
		element.primaryGroup:close()
		element.callingCard:close()
		element.rankCP:close()
		element.rankMP:close()
		element.rankZM:close()
		element.party:close()
		element.StartMenuframenoBG000:close()
		element.StartMenuframenoBG0000:close()
		element.emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
