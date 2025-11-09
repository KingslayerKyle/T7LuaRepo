require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.playercard.CallingCard" )

CoD.SelfIdentityBadge = InheritFrom( LUI.UIElement )
CoD.SelfIdentityBadge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelfIdentityBadge )
	self.id = "SelfIdentityBadge"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 345 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardBG = CoD.Social_background.new( menu, controller )
	CallingCardBG:setLeftRight( false, false, -70, 172.25 )
	CallingCardBG:setTopBottom( false, false, -30, 30 )
	self:addElement( CallingCardBG )
	self.CallingCardBG = CallingCardBG
	
	local emblemBG = CoD.Social_background.new( menu, controller )
	emblemBG:setLeftRight( false, false, -172, -70 )
	emblemBG:setTopBottom( false, false, -30, 30 )
	self:addElement( emblemBG )
	self.emblemBG = emblemBG
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( false, false, -172, -70 )
	emblem:setTopBottom( false, false, -30, 30 )
	emblem:subscribeToGlobalModel( controller, "PerController", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local CallingCard = CoD.CallingCard.new( menu, controller )
	CallingCard:setLeftRight( true, false, 102.5, 345 )
	CallingCard:setTopBottom( true, false, 0, 60 )
	CallingCard:subscribeToGlobalModel( controller, "PerController", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			CallingCard.backing:setImage( RegisterImage( GetRandomPlayercardForPlayer( xuid ) ) )
		end
	end )
	CallingCard:subscribeToGlobalModel( controller, "PerController", "gamertag", function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			CallingCard.SocialCallingCardTitle.Label0:setText( Engine.Localize( gamertag ) )
		end
	end )
	CallingCard:subscribeToGlobalModel( controller, "PerController", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			CallingCard.SocialCallingCardSubTitle.Label0:setText( Engine.Localize( clanTag ) )
		end
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CallingCardBG:completeAnimation()
				self.CallingCardBG:setAlpha( 1 )
				self.clipFinished( CallingCardBG, {} )
				emblemBG:completeAnimation()
				self.emblemBG:setAlpha( 1 )
				self.clipFinished( emblemBG, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 1 )
				self.clipFinished( emblem, {} )
				CallingCard:completeAnimation()
				CallingCard.backing:completeAnimation()
				self.CallingCard:setAlpha( 1 )
				self.CallingCard.backing:setAlpha( 1 )
				self.clipFinished( CallingCard, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardBG:close()
		element.emblemBG:close()
		element.CallingCard:close()
		element.emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

