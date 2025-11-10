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
	self:setLeftRight( true, false, 0, 323 )
	self:setTopBottom( true, false, 0, 450 )
	self.anyChildUsesUpdateState = true
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( true, false, 8.44, 254.44 )
	primaryGroup:setTopBottom( true, false, 281.33, 303.33 )
	primaryGroup:setText( Engine.Localize( "Primary Group: Treyarch" ) )
	primaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0.44, 323.35 )
	emblem:setTopBottom( true, false, 0, 189.83 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( true, false, 0.34, 323.35 )
	callingCard:setTopBottom( true, false, 195.33, 274.93 )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local rankCP = CoD.Social_Rank.new( menu, controller )
	rankCP:setLeftRight( true, false, 0, 80 )
	rankCP:setTopBottom( true, false, 335, 450 )
	rankCP:linkToElementModel( self, "cpRank", true, function ( model )
		local cpRank = Engine.GetModelValue( model )
		if cpRank then
			rankCP.level:setText( Engine.Localize( cpRank ) )
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
			rankCP.prestige:setText( Engine.Localize( cpPrestige ) )
		end
	end )
	self:addElement( rankCP )
	self.rankCP = rankCP
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( true, false, 121.85, 201.85 )
	rankMP:setTopBottom( true, false, 335, 450 )
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
			rankMP.prestige:setText( Engine.Localize( mpPrestige ) )
		end
	end )
	self:addElement( rankMP )
	self.rankMP = rankMP
	
	local rankZM = CoD.Social_Rank.new( menu, controller )
	rankZM:setLeftRight( true, false, 243.35, 323.35 )
	rankZM:setTopBottom( true, false, 335, 450 )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local zmRank = Engine.GetModelValue( model )
		if zmRank then
			rankZM.level:setText( Engine.Localize( zmRank ) )
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
			rankZM.prestige:setText( Engine.Localize( zmPrestige ) )
		end
	end )
	self:addElement( rankZM )
	self.rankZM = rankZM
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 8, 254 )
				self.primaryGroup:setTopBottom( true, false, 281.33, 303.33 )
				self.clipFinished( primaryGroup, {} )
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
			end
		},
		PlayerDetails = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 200.66, 446.66 )
				self.primaryGroup:setTopBottom( true, false, 71.61, 93.61 )
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
			end
		},
		PlayerDetails_NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 200.66, 446.66 )
				self.primaryGroup:setTopBottom( true, false, 71.61, 93.61 )
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
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				primaryGroup:completeAnimation()
				self.primaryGroup:setLeftRight( true, false, 8, 254 )
				self.primaryGroup:setTopBottom( true, false, 281.33, 303.33 )
				self.clipFinished( primaryGroup, {} )
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

