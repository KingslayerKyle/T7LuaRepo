-- 5c94754f15a46980bb20fd2d7541f670
-- This hash is used for caching, delete to decompile the file again

CoD.BM_TriangleMask = InheritFrom( LUI.UIElement )
CoD.BM_TriangleMask.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_TriangleMask )
	self.id = "BM_TriangleMask"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 608 )
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( true, false, 0, 312 )
	Mask:setTopBottom( true, false, 208, 400 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setImage( RegisterImage( "uie_t7_blackmarket_trianglemask" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 0, 312 )
	black:setTopBottom( true, false, -215, 208 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local black0 = LUI.UIImage.new()
	black0:setLeftRight( true, false, 0, 312 )
	black0:setTopBottom( true, false, 400, 783 )
	black0:setRGB( 0, 0, 0 )
	self:addElement( black0 )
	self.black0 = black0
	
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

