-- bc7b97605ef4608a6687b1dbf818f5d7
-- This hash is used for caching, delete to decompile the file again

CoD.BM_CommonRare_Hover = InheritFrom( LUI.UIElement )
CoD.BM_CommonRare_Hover.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_CommonRare_Hover )
	self.id = "BM_CommonRare_Hover"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 137 )
	self:setTopBottom( true, false, 0, 136 )
	
	local glow0 = LUI.UIImage.new()
	glow0:setLeftRight( false, false, -68.4, 68.4 )
	glow0:setTopBottom( true, false, 0, 136 )
	glow0:setScale( 0.9 )
	glow0:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow0 )
	self.glow0 = glow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

