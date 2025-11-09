require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.playercard.CallingCard" )

CoD.IdentityBadge = InheritFrom( LUI.UIElement )
CoD.IdentityBadge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IdentityBadge )
	self.id = "IdentityBadge"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 345 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardBG = CoD.Social_background.new( menu, controller )
	CallingCardBG:setLeftRight( false, true, -244, 0 )
	CallingCardBG:setTopBottom( true, false, 0, 60 )
	self:addElement( CallingCardBG )
	self.CallingCardBG = CallingCardBG
	
	local emblemBG = CoD.Social_background.new( menu, controller )
	emblemBG:setLeftRight( false, true, -342, -244 )
	emblemBG:setTopBottom( true, false, 0, 60 )
	self:addElement( emblemBG )
	self.emblemBG = emblemBG
	
	local CallingCard = CoD.CallingCard.new( menu, controller )
	CallingCard:setLeftRight( false, true, -244, 0 )
	CallingCard:setTopBottom( true, false, 0, 60 )
	CallingCard:linkToElementModel( self, nil, false, function ( model )
		CallingCard:setModel( model, controller )
	end )
	CallingCard:linkToElementModel( self, "clantag", true, function ( model )
		local clantag = Engine.GetModelValue( model )
		if clantag then
			CallingCard.SocialCallingCardSubTitle.FEListSubHeaderPanel0:setAlpha( HideIfEmptyString( clantag ) )
		end
	end )
	CallingCard:subscribeToGlobalModel( controller, "PerController", "CallingCardsIdentity.GetPublicProfileComplete", function ( model )
		CallingCards_EmblemGetProfile( menu, CallingCard, controller )
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( false, true, -342, -244 )
	emblem:setTopBottom( true, false, 0, 60 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
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

