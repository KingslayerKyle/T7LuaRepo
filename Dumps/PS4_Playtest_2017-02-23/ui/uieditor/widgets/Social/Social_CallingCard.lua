require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Social.Social_CallingCardSubTitle" )
require( "ui.uieditor.widgets.Social.Social_CallingCardTitle" )

CoD.Social_CallingCard = InheritFrom( LUI.UIElement )
CoD.Social_CallingCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_CallingCard )
	self.id = "Social_CallingCard"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 112 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( 0, 0, 450, 0 )
	CallingCardsFrameWidget:setTopBottom( 0, 0, -5, 117 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.63 )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local SocialCallingCardTitle = CoD.Social_CallingCardTitle.new( menu, controller )
	SocialCallingCardTitle:setLeftRight( 0, 0, 0, 447 )
	SocialCallingCardTitle:setTopBottom( 0, 0, 10, 48 )
	SocialCallingCardTitle.FEListSubHeaderPanel0:setAlpha( 0.65 )
	SocialCallingCardTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SocialCallingCardTitle:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SocialCallingCardTitle.Label0:setText( modelValue )
		end
	end )
	self:addElement( SocialCallingCardTitle )
	self.SocialCallingCardTitle = SocialCallingCardTitle
	
	local SocialCallingCardSubTitle = CoD.Social_CallingCardSubTitle.new( menu, controller )
	SocialCallingCardSubTitle:setLeftRight( 0, 0, 0, 447 )
	SocialCallingCardSubTitle:setTopBottom( 0, 0, 48, 78 )
	SocialCallingCardSubTitle.FEListSubHeaderPanel0:setAlpha( 0.65 )
	SocialCallingCardSubTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SocialCallingCardSubTitle:linkToElementModel( self, "clantag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SocialCallingCardSubTitle.Label0:setText( StringAsClanTag( modelValue ) )
		end
	end )
	self:addElement( SocialCallingCardSubTitle )
	self.SocialCallingCardSubTitle = SocialCallingCardSubTitle
	
	CallingCardsFrameWidget.id = "CallingCardsFrameWidget"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsFrameWidget:close()
		self.SocialCallingCardTitle:close()
		self.SocialCallingCardSubTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

