CoD.CallingCards_TacticalsWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_TacticalsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_TacticalsWidget )
	self.id = "CallingCards_TacticalsWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local flipbook = LUI.UIImage.new()
	flipbook:setLeftRight( 0, 0, 0, 720 )
	flipbook:setTopBottom( 0, 0, 0, 180 )
	flipbook:setImage( RegisterImage( "uie_t7_callingcard_tacticals_flipbook" ) )
	flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flipbook:setShaderVector( 0, 4, 0, 0, 0 )
	flipbook:setShaderVector( 1, 5, 0, 0, 0 )
	self:addElement( flipbook )
	self.flipbook = flipbook
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

