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
	self:setLeftRight( true, false, 0, 304 )
	self:setTopBottom( true, false, 0, 75 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setImage( RegisterImage( "uie_img_t7_menu_partyeaseslide_gamercard1dummy" ) )
	self:addElement( backing )
	self.backing = backing
	
	local SocialCallingCardTitle = CoD.Social_CallingCardTitle.new( menu, controller )
	SocialCallingCardTitle:setLeftRight( true, false, 0, 88 )
	SocialCallingCardTitle:setTopBottom( true, false, 7, 32 )
	SocialCallingCardTitle.Label0:setText( Engine.Localize( "FEXTWOLF" ) )
	SocialCallingCardTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( SocialCallingCardTitle )
	self.SocialCallingCardTitle = SocialCallingCardTitle
	
	local SocialCallingCardSubTitle = CoD.Social_CallingCardSubTitle.new( menu, controller )
	SocialCallingCardSubTitle:setLeftRight( true, false, 0, 48 )
	SocialCallingCardSubTitle:setTopBottom( true, false, 33, 53 )
	SocialCallingCardSubTitle.FEListSubHeaderPanel0:setAlpha( 0 )
	SocialCallingCardSubTitle.Label0:setText( Engine.Localize( StringAsClanTag( "" ) ) )
	SocialCallingCardSubTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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

