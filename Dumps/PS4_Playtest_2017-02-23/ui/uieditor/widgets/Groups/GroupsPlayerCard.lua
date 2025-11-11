require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
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
	self:setLeftRight( 0, 0, 0, 487 )
	self:setTopBottom( 0, 0, 0, 727 )
	self.anyChildUsesUpdateState = true
	
	local Socialbackground0 = CoD.Social_background.new( menu, controller )
	Socialbackground0:setLeftRight( 0, 0, 0, 486 )
	Socialbackground0:setTopBottom( 0, 0, 0, 286 )
	self:addElement( Socialbackground0 )
	self.Socialbackground0 = Socialbackground0
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( 0, 0, 0, 230 )
	friendship:setTopBottom( 0, 0, 435, 468 )
	friendship:setAlpha( 0.5 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( 0, 0, 1, 370 )
	primaryGroup:setTopBottom( 0, 0, 425, 458 )
	primaryGroup:setAlpha( 0 )
	primaryGroup:setText( Engine.Localize( "MENU_PRIMARY_GROUP_COLON" ) )
	primaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 0, 486 )
	emblem:setTopBottom( 0, 0, 0, 286 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( 0, 0, 19, 504 )
	callingCard:setTopBottom( 0, 0, 314, 432 )
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
	rankCP:setLeftRight( 0, 0, -1, 119 )
	rankCP:setTopBottom( 0, 0, 485, 657 )
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
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( 0, 0, 183, 303 )
	rankMP:setTopBottom( 0, 0, 485, 657 )
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
	rankZM:setTopBottom( 0, 0, 485, 657 )
	rankZM.GameMode:setText( Engine.Localize( "MENU_ZOMBIE_MODE_CAPS" ) )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.level:setText( Engine.Localize( RankToLevelNumber( "zm", SetValueIfStringEqualTo( "0", "-", modelValue ) ) ) )
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
	
	self.resetProperties = function ()
		callingCard:completeAnimation()
		rankCP:completeAnimation()
		rankMP:completeAnimation()
		rankZM:completeAnimation()
		emblem:completeAnimation()
		Socialbackground0:completeAnimation()
		friendship:completeAnimation()
		primaryGroup:completeAnimation()
		callingCard:setLeftRight( 0, 0, 19, 504 )
		callingCard:setTopBottom( 0, 0, 314, 432 )
		rankCP:setLeftRight( 0, 0, -1, 119 )
		rankCP:setTopBottom( 0, 0, 485, 657 )
		rankMP:setLeftRight( 0, 0, 183, 303 )
		rankMP:setTopBottom( 0, 0, 485, 657 )
		rankZM:setLeftRight( 0, 0, 364, 484 )
		rankZM:setTopBottom( 0, 0, 485, 657 )
		emblem:setLeftRight( 0, 0, 0, 486 )
		emblem:setTopBottom( 0, 0, 0, 286 )
		Socialbackground0:setLeftRight( 0, 0, 0, 486 )
		Socialbackground0:setTopBottom( 0, 0, 0, 286 )
		friendship:setLeftRight( 0, 0, 0, 230 )
		friendship:setTopBottom( 0, 0, 435, 468 )
		primaryGroup:setLeftRight( 0, 0, 1, 370 )
		primaryGroup:setTopBottom( 0, 0, 425, 458 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, 0, 486 )
				self.emblem:setTopBottom( 0, 0, -0.5, 286.5 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 0.5, 492.5 )
				self.callingCard:setTopBottom( 0, 0, 293.5, 412.5 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, -1, 119 )
				self.rankCP:setTopBottom( 0, 0, 470, 642 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 182, 302 )
				self.rankMP:setTopBottom( 0, 0, 470, 642 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 364, 484 )
				self.rankZM:setTopBottom( 0, 0, 470, 642 )
				self.clipFinished( rankZM, {} )
			end
		},
		PlayerDetails = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( 0, 0, 0.5, 293.5 )
				self.Socialbackground0:setTopBottom( 0, 0, 0, 174 )
				self.clipFinished( Socialbackground0, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 305, 535 )
				self.friendship:setTopBottom( 0, 0, 136, 169 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 308, 677 )
				self.primaryGroup:setTopBottom( 0, 0, 103, 136 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, 0.5, 293.5 )
				self.emblem:setTopBottom( 0, 0, 0, 174 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 301, 690 )
				self.callingCard:setTopBottom( 0, 0, 5.5, 100.5 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, 729, 849 )
				self.rankCP:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 893, 1013 )
				self.rankMP:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 1057.5, 1176.5 )
				self.rankZM:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankZM, {} )
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				Socialbackground0:completeAnimation()
				self.Socialbackground0:setLeftRight( 0, 0, 0.5, 293.5 )
				self.Socialbackground0:setTopBottom( 0, 0, 0, 174 )
				self.clipFinished( Socialbackground0, {} )
				friendship:completeAnimation()
				self.friendship:setLeftRight( 0, 0, 305, 535 )
				self.friendship:setTopBottom( 0, 0, 136, 169 )
				self.clipFinished( friendship, {} )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 308, 677 )
				self.primaryGroup:setTopBottom( 0, 0, 103, 136 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, 0.5, 293.5 )
				self.emblem:setTopBottom( 0, 0, 0, 174 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 301, 690 )
				self.callingCard:setTopBottom( 0, 0, 5.5, 100.5 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, 729, 849 )
				self.rankCP:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankCP, {} )
				rankMP:completeAnimation()
				self.rankMP:setLeftRight( 0, 0, 893, 1013 )
				self.rankMP:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankMP, {} )
				rankZM:completeAnimation()
				self.rankZM:setLeftRight( 0, 0, 1057.5, 1176.5 )
				self.rankZM:setTopBottom( 0, 0, 2, 174 )
				self.clipFinished( rankZM, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( 0, 0, 6, 375 )
				self.primaryGroup:setTopBottom( 0, 0, 416, 449 )
				self.clipFinished( primaryGroup, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, 0, 486 )
				self.emblem:setTopBottom( 0, 0, -0.5, 286.5 )
				self.clipFinished( emblem, {} )
				callingCard:completeAnimation()
				self.callingCard:setLeftRight( 0, 0, 0.5, 492.5 )
				self.callingCard:setTopBottom( 0, 0, 293.5, 412.5 )
				self.clipFinished( callingCard, {} )
				rankCP:completeAnimation()
				self.rankCP:setLeftRight( 0, 0, -1, 119 )
				self.rankCP:setTopBottom( 0, 0, 470, 642 )
				self.clipFinished( rankCP, {} )
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
	callingCard.id = "callingCard"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Socialbackground0:close()
		self.friendship:close()
		self.callingCard:close()
		self.rankCP:close()
		self.rankMP:close()
		self.rankZM:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

