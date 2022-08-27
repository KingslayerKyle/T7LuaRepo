-- a0f58198a6e41916971b3600f53b38d9
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_Clover_Rainbow = InheritFrom( LUI.UIElement )
CoD.CallingCard_Clover_Rainbow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_Clover_Rainbow )
	self.id = "CallingCard_Clover_Rainbow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1043 )
	self:setTopBottom( true, false, 0, 140 )
	
	local TileRainbow = LUI.UIImage.new()
	TileRainbow:setLeftRight( true, false, 0, 1043 )
	TileRainbow:setTopBottom( true, false, 0, 140.1 )
	TileRainbow:setImage( RegisterImage( "uie_t7_callingcard_mp_clover_rainbow" ) )
	TileRainbow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	TileRainbow:setShaderVector( 0, 1, 1, 0, 0 )
	TileRainbow:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( TileRainbow )
	self.TileRainbow = TileRainbow
	
	local blk = LUI.UIImage.new()
	blk:setLeftRight( true, false, 644, 1212 )
	blk:setTopBottom( true, false, -1.95, 140 )
	blk:setImage( RegisterImage( "uie_t7_callingcard_mp_clover_fade" ) )
	self:addElement( blk )
	self.blk = blk
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TileRainbow:completeAnimation()
				self.TileRainbow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
				self.TileRainbow:setShaderVector( 0, 1.3, 1, 0, 0 )
				self.TileRainbow:setShaderVector( 1, 0, 0, 0, 0 )
				self.clipFinished( TileRainbow, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

