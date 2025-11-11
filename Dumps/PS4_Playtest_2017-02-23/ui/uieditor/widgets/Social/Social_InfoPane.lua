require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Party" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_NotInTitle" )
require( "ui.uieditor.widgets.Social.Social_Rank" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PostLoadFunc = function ( self, controller, menu )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "SocialRoot.recentPlayers.update" )
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
	self:setLeftRight( 0, 0, 0, 1179 )
	self:setTopBottom( 0, 0, 0, 727 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, 528, 981 )
	StartMenuframenoBG0:setTopBottom( 0, 0, 288, 675 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 0, 529, 979 )
	StartMenuframenoBG00:setTopBottom( 0, 0, 55, 288 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local Socialbackground0 = CoD.Social_background.new( menu, controller )
	Socialbackground0:setLeftRight( 0, 0, 0, 486 )
	Socialbackground0:setTopBottom( 0, 0, -1, 285 )
	self:addElement( Socialbackground0 )
	self.Socialbackground0 = Socialbackground0
	
	local notInTitle = CoD.Social_InfoPane_Presence_NotInTitle.new( menu, controller )
	notInTitle:setLeftRight( 0, 0, 531, 978 )
	notInTitle:setTopBottom( 0, 0, -3, 105 )
	notInTitle:setAlpha( 0 )
	notInTitle:linkToElementModel( self, nil, false, function ( model )
		notInTitle:setModel( model, controller )
	end )
	self:addElement( notInTitle )
	self.notInTitle = notInTitle
	
	local presence = CoD.Social_InfoPane_Presence.new( menu, controller )
	presence:setLeftRight( 0, 0, 531, 978 )
	presence:setTopBottom( 0, 0, -5, 283 )
	self:addElement( presence )
	self.presence = presence
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( 0, 0, 0, 230 )
	friendship:setTopBottom( 0, 0, 421, 454 )
	friendship:setAlpha( 0.5 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( 0, 0, 1, 370 )
	primaryGroup:setTopBottom( 0, 0, 410, 443 )
	primaryGroup:setAlpha( 0 )
	primaryGroup:setText( Engine.Localize( "MENU_PRIMARY_GROUP_COLON" ) )
	primaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( 0, 0, 21, 475 )
	callingCard:setTopBottom( 0, 0, 300, 419 )
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
	rankCP:setLeftRight( 0, 0, -1, 119 )
	rankCP:setTopBottom( 0, 0, 468, 640 )
	rankCP.GameMode:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	rankCP:linkToElementModel( self, "cpRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.level:setText( Engine.Localize( RankToLevelNumber( "cp", SetValueIfStringEqualTo( "0", "-", modelValue ) ) ) )
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
			rankCP.prestige.prestige:setAlpha( modelValue )
		end
	end )
	rankCP:linkToElementModel( self, "cpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.prestige.prestige:setText( GetPrestigeTitleForPLevelAndMode( "cp", modelValue ) )
		end
	end )
	self:addElement( rankCP )
	self.rankCP = rankCP
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 0, 486 )
	emblem:setTopBottom( 0, 0, -1, 285 )
	emblem:linkToElementModel( self, "identityBadge.xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( 0, 0, 183, 303 )
	rankMP:setTopBottom( 0, 0, 468, 640 )
	rankMP.GameMode:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.level:setRGB( SetToParagonColorIfPrestigeMasterByPLevel( "mp", 148, 162, 165, modelValue ) )
		end
	end )
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
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.prestige.prestige:setAlpha( modelValue )
		end
	end )
	rankMP:linkToElementModel( self, "mpPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.prestige.prestige:setText( GetPrestigeTitleForPLevelAndMode( "mp", modelValue ) )
		end
	end )
	self:addElement( rankMP )
	self.rankMP = rankMP
	
	local rankZM = CoD.Social_Rank.new( menu, controller )
	rankZM:setLeftRight( 0, 0, 364, 484 )
	rankZM:setTopBottom( 0, 0, 468, 640 )
	rankZM.GameMode:setText( Engine.Localize( "MENU_ZOMBIE_MODE_CAPS" ) )
	rankZM:linkToElementModel( self, "zmPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.level:setRGB( SetToParagonColorIfPrestigeMasterByPLevel( "zm", 148, 162, 165, modelValue ) )
		end
	end )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.level:setText( Engine.Localize( SetValueIfStringEqualTo( "0", "-", modelValue ) ) )
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
			rankZM.prestige.prestige:setAlpha( modelValue )
		end
	end )
	rankZM:linkToElementModel( self, "zmPrestige", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.prestige.prestige:setText( GetPrestigeTitleForPLevelAndMode( "zm", modelValue ) )
		end
	end )
	self:addElement( rankZM )
	self.rankZM = rankZM
	
	local party = CoD.Social_InfoPane_Party.new( menu, controller )
	party:setLeftRight( 0, 0, 530.5, 977.5 )
	party:setTopBottom( 0, 0, 288, 719 )
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
	
	local pixel1 = LUI.UIImage.new()
	pixel1:setLeftRight( 1, 1, -1185, -1172 )
	pixel1:setTopBottom( 0, 0, -5, 8 )
	pixel1:setAlpha( 0.15 )
	pixel1:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel1 )
	self.pixel1 = pixel1
	
	local pixel00 = LUI.UIImage.new()
	pixel00:setLeftRight( 1, 1, -1185, -1172 )
	pixel00:setTopBottom( 1, 1, -452, -439 )
	pixel00:setAlpha( 0.15 )
	pixel00:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel00 )
	self.pixel00 = pixel00
	
	local pixel10 = LUI.UIImage.new()
	pixel10:setLeftRight( 1, 1, -701, -688 )
	pixel10:setTopBottom( 0, 0, -5, 8 )
	pixel10:setAlpha( 0.15 )
	pixel10:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel10 )
	self.pixel10 = pixel10
	
	local pixel000 = LUI.UIImage.new()
	pixel000:setLeftRight( 1, 1, -701, -688 )
	pixel000:setTopBottom( 1, 1, -452, -439 )
	pixel000:setAlpha( 0.15 )
	pixel000:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel000 )
	self.pixel000 = pixel000
	
	callingCard.navigation = {
		right = party
	}
	party.navigation = {
		left = callingCard
	}
	self.resetProperties = function ()
		notInTitle:completeAnimation()
		Socialbackground0:completeAnimation()
		presence:completeAnimation()
		friendship:completeAnimation()
		callingCard:completeAnimation()
		emblem:completeAnimation()
		rankCP:completeAnimation()
		rankZM:completeAnimation()
		rankMP:completeAnimation()
		primaryGroup:completeAnimation()
		party:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		StartMenuframenoBG00:completeAnimation()
		notInTitle:setLeftRight( 0, 0, 531, 978 )
		notInTitle:setTopBottom( 0, 0, -3, 105 )
		notInTitle:setAlpha( 0 )
		Socialbackground0:setLeftRight( 0, 0, 0, 486 )
		Socialbackground0:setTopBottom( 0, 0, -1, 285 )
		Socialbackground0:setScale( 1 )
		presence:setLeftRight( 0, 0, 531, 978 )
		presence:setTopBottom( 0, 0, -5, 283 )
		presence:setAlpha( 1 )
		friendship:setLeftRight( 0, 0, 0, 230 )
		friendship:setTopBottom( 0, 0, 421, 454 )
		callingCard:setLeftRight( 0, 0, 21, 475 )
		callingCard:setTopBottom( 0, 0, 300, 419 )
		callingCard:setScale( 1.07 )
		emblem:setLeftRight( 0, 0, 0, 486 )
		emblem:setTopBottom( 0, 0, -1, 285 )
		emblem:setScale( 1 )
		rankCP:setLeftRight( 0, 0, -1, 119 )
		rankCP:setTopBottom( 0, 0, 468, 640 )
		rankZM:setLeftRight( 0, 0, 364, 484 )
		rankZM:setTopBottom( 0, 0, 468, 640 )
		rankMP:setLeftRight( 0, 0, 183, 303 )
		rankMP:setTopBottom( 0, 0, 468, 640 )
		primaryGroup:setLeftRight( 0, 0, 1, 370 )
		primaryGroup:setTopBottom( 0, 0, 410, 443 )
		party:setLeftRight( 0, 0, 530.5, 977.5 )
		party:setTopBottom( 0, 0, 288, 719 )
		StartMenuframenoBG0:setLeftRight( 0, 0, 528, 981 )
		StartMenuframenoBG0:setTopBottom( 0, 0, 288, 675 )
		StartMenuframenoBG0:setAlpha( 0.8 )
		StartMenuframenoBG00:setLeftRight( 0, 0, 529, 979 )
		StartMenuframenoBG00:setTopBottom( 0, 0, 55, 288 )
		StartMenuframenoBG00:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PlayerDetails = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( 0, 0, -31, 708 )
				self.StartMenuframenoBG0:setTopBottom( 0, 0, 214.5, 532.5 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( 0, 0, 727.5, 1180.5 )
				self.StartMenuframenoBG00:setTopBottom( 0, 0, 214.5, 532.5 )
				self.clipFinished( StartMenuframenoBG00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( 0, 0, -44.5, 248.5 )
				self.Socialbackground0:setTopBottom( 0, 0, -4, 170 )
				self.Socialbackground0:setScale( 0.9 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( 0, 0, -28, 705 )
				self.notInTitle:setTopBottom( 0, 0, 214.5, 529.5 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( 0, 0, -31.5, 704.5 )
				self.presence:setTopBottom( 0, 0, 215, 435 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 244.5, 473.5 )
				self.friendship:setTopBottom( 0, 0, 115, 148 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 308, 677 )
				self.primaryGroup:setTopBottom( 0, 0, 103, 136 )
				self.clipFinished( primaryGroup, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 249.5, 706.5 )
				self.callingCard:setTopBottom( 0, 0, 0, 111 )
				self.callingCard:setScale( 1 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, 729, 849 )
				self.rankCP:setTopBottom( 0, 0, -1, 171 )
				self.clipFinished( rankCP, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, -44.5, 248.5 )
				self.emblem:setTopBottom( 0, 0, -8.5, 166.5 )
				self.emblem:setScale( 0.9 )
				self.clipFinished( emblem, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 893, 1013 )
				self.rankMP:setTopBottom( 0, 0, -1, 171 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 1057.5, 1176.5 )
				self.rankZM:setTopBottom( 0, 0, -1, 171 )
				self.clipFinished( rankZM, {} )
				party:completeAnimation()
				self.party:setLeftRight( 0, 0, 730, 1180 )
				self.party:setTopBottom( 0, 0, 214.5, 646.5 )
				self.clipFinished( party, {} )
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( 0, 0, -31, 708 )
				self.StartMenuframenoBG0:setTopBottom( 0, 0, 214.5, 532.5 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( 0, 0, 725.5, 1178.5 )
				self.StartMenuframenoBG00:setTopBottom( 0, 0, 214.5, 532.5 )
				self.clipFinished( StartMenuframenoBG00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( 0, 0, -31, 235 )
				self.Socialbackground0:setTopBottom( 0, 0, 0, 160 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( 0, 0, -31.5, 704.5 )
				self.notInTitle:setTopBottom( 0, 0, 215, 533 )
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setLeftRight( 0, 0, -28.5, 707.5 )
				self.presence:setTopBottom( 0, 0, 215, 435 )
				self.presence:setAlpha( 0 )
				self.clipFinished( presence, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 244.5, 473.5 )
				self.friendship:setTopBottom( 0, 0, 115, 148 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 308, 677 )
				self.primaryGroup:setTopBottom( 0, 0, 103, 136 )
				self.clipFinished( primaryGroup, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 246.5, 703.5 )
				self.callingCard:setTopBottom( 0, 0, 1, 112 )
				self.callingCard:setScale( 1 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, 729, 849 )
				self.rankCP:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankCP, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, -44.5, 248.5 )
				self.emblem:setTopBottom( 0, 0, -7.5, 167.5 )
				self.emblem:setScale( 0.9 )
				self.clipFinished( emblem, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 893, 1013 )
				self.rankMP:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 1057.5, 1176.5 )
				self.rankZM:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankZM, {} )
				party:completeAnimation()
				self.party:setLeftRight( 0, 0, 729, 1185 )
				self.party:setTopBottom( 0, 0, 214.5, 646.5 )
				self.clipFinished( party, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( 0, 0, 528, 981 )
				self.StartMenuframenoBG0:setTopBottom( 0, 0, 55.5, 675.5 )
				self.StartMenuframenoBG0:setAlpha( 0.65 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( 0, 0, 0, 486 )
				self.Socialbackground0:setTopBottom( 0, 0, 0, 286 )
				self.clipFinished( Socialbackground0, {} )
				notInTitle:completeAnimation()
				self.notInTitle:setLeftRight( 0, 0, 531, 984 )
				self.notInTitle:setTopBottom( 0, 0, 301.5, 106.5 )
				self.clipFinished( notInTitle, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 6, 375 )
				self.primaryGroup:setTopBottom( 0, 0, 416, 449 )
				self.clipFinished( primaryGroup, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 23.5, 510.5 )
				self.callingCard:setTopBottom( 0, 0, 301, 420 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, -1, 119 )
				self.rankCP:setTopBottom( 0, 0, 470, 642 )
				self.clipFinished( rankCP, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, 0, 486 )
				self.emblem:setTopBottom( 0, 0, -0.5, 286.5 )
				self.clipFinished( emblem, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 182, 302 )
				self.rankMP:setTopBottom( 0, 0, 470, 642 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 364, 484 )
				self.rankZM:setTopBottom( 0, 0, 470, 642 )
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
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG00:close()
		self.Socialbackground0:close()
		self.notInTitle:close()
		self.presence:close()
		self.friendship:close()
		self.callingCard:close()
		self.rankCP:close()
		self.rankMP:close()
		self.rankZM:close()
		self.party:close()
		self.emblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

