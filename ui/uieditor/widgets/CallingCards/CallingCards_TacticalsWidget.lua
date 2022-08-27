-- 58126b2472fcffa5f8a94a32018b58ca
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local flipbook = LUI.UIImage.new()
	flipbook:setLeftRight( true, false, 0, 480 )
	flipbook:setTopBottom( true, false, 0, 120 )
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

