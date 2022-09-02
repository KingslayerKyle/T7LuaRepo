-- 28e5391abb01b24879604eac5b5cce5e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Social.Social_CallingCardTitle" )
require( "ui.uieditor.widgets.Social.Social_CallingCardSubTitle" )

CoD.CallingCard = InheritFrom( LUI.UIElement )
CoD.CallingCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCard )
	self.id = "CallingCard"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 244 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( false, false, -4, 0 )
	CallingCardsFrameWidget:setTopBottom( false, false, 0, 0 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.5 )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local SocialCallingCardTitle = CoD.Social_CallingCardTitle.new( menu, controller )
	SocialCallingCardTitle:setLeftRight( true, false, 0, 233 )
	SocialCallingCardTitle:setTopBottom( true, false, 8, 28 )
	SocialCallingCardTitle.FEListSubHeaderPanel0:setAlpha( 0.65 )
	SocialCallingCardTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SocialCallingCardTitle:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			SocialCallingCardTitle.Label0:setText( gamertag )
		end
	end )
	self:addElement( SocialCallingCardTitle )
	self.SocialCallingCardTitle = SocialCallingCardTitle
	
	local SocialCallingCardSubTitle = CoD.Social_CallingCardSubTitle.new( menu, controller )
	SocialCallingCardSubTitle:setLeftRight( true, false, 0, 233 )
	SocialCallingCardSubTitle:setTopBottom( true, false, 28, 46 )
	SocialCallingCardSubTitle.FEListSubHeaderPanel0:setAlpha( 0.65 )
	SocialCallingCardSubTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SocialCallingCardSubTitle:linkToElementModel( self, "clantag", true, function ( model )
		local clantag = Engine.GetModelValue( model )
		if clantag then
			SocialCallingCardSubTitle.Label0:setText( StringAsClanTag( clantag ) )
		end
	end )
	self:addElement( SocialCallingCardSubTitle )
	self.SocialCallingCardSubTitle = SocialCallingCardSubTitle
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
		element.SocialCallingCardTitle:close()
		element.SocialCallingCardSubTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

