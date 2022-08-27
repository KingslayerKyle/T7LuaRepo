-- 8b17a1f4100e5318b44e9426f51ddb4a
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_cwl_worldmap_widget = InheritFrom( LUI.UIElement )
CoD.CallingCards_cwl_worldmap_widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_cwl_worldmap_widget )
	self.id = "CallingCards_cwl_worldmap_widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local MAP = LUI.UIImage.new()
	MAP:setLeftRight( true, false, 176, 480 )
	MAP:setTopBottom( true, false, -7.56, 127.56 )
	MAP:setAlpha( 0.3 )
	MAP:setImage( RegisterImage( "uie_callingcards_cwl_worldmap" ) )
	MAP:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	MAP:setShaderVector( 0, 1, 1, 0, 0 )
	MAP:setShaderVector( 1, 0.1, 0, 0, 0 )
	self:addElement( MAP )
	self.MAP = MAP
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, -0.46, 119.54 )
	Image0:setImage( RegisterImage( "uie_callingcards_cwl_worldmap_mask" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

