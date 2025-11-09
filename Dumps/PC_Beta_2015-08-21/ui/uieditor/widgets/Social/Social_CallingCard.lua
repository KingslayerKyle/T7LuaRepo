require( "ui.uieditor.widgets.Social.Social_CallingCardTitle" )
require( "ui.uieditor.widgets.Social.Social_CallingCardSubTitle" )

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
	self:setLeftRight( true, false, 0, 304 )
	self:setTopBottom( true, false, 0, 75 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setImage( RegisterImage( "uie_img_t7_menu_partyeaseslide_gamercard1dummy" ) )
	self:addElement( backing )
	self.backing = backing
	
	local SocialCallingCardTitle = CoD.Social_CallingCardTitle.new( menu, controller )
	SocialCallingCardTitle:setLeftRight( true, false, 0, 66 )
	SocialCallingCardTitle:setTopBottom( true, false, 7, 32 )
	SocialCallingCardTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SocialCallingCardTitle:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			SocialCallingCardTitle.Label0:setText( Engine.Localize( gamertag ) )
		end
	end )
	self:addElement( SocialCallingCardTitle )
	self.SocialCallingCardTitle = SocialCallingCardTitle
	
	local SocialCallingCardSubTitle = CoD.Social_CallingCardSubTitle.new( menu, controller )
	SocialCallingCardSubTitle:setLeftRight( true, false, 0, 48 )
	SocialCallingCardSubTitle:setTopBottom( true, false, 33, 53 )
	SocialCallingCardSubTitle:setAlpha( 0 )
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
		element.SocialCallingCardTitle:close()
		element.SocialCallingCardSubTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

