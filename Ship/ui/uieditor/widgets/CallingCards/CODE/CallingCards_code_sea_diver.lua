-- 507f871a73115f177d336f90d42dc2a3
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_code_sea_diver = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_sea_diver.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_code_sea_diver )
	self.id = "CallingCards_code_sea_diver"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bubbles = LUI.UIImage.new()
	bubbles:setLeftRight( true, false, 42, 112.84 )
	bubbles:setTopBottom( true, false, 0, 54 )
	bubbles:setImage( RegisterImage( "uie_t7_callingcards_sea_bubbles" ) )
	bubbles:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bubbles:setShaderVector( 0, 1, 1, 0, 0 )
	bubbles:setShaderVector( 1, 0, 0.39, 0, 0 )
	self:addElement( bubbles )
	self.bubbles = bubbles
	
	local diver1 = LUI.UIImage.new()
	diver1:setLeftRight( true, false, 0, 180 )
	diver1:setTopBottom( true, false, 0, 120 )
	diver1:setImage( RegisterImage( "uie_t7_callingcards_sea_diver1" ) )
	self:addElement( diver1 )
	self.diver1 = diver1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
