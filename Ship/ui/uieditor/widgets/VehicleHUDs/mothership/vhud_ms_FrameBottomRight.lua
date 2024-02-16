-- 2a694303042cf2b989b85f8c46ab86ee
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_FrameBottomRight = InheritFrom( LUI.UIElement )
CoD.vhud_ms_FrameBottomRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_FrameBottomRight )
	self.id = "vhud_ms_FrameBottomRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 481 )
	self:setTopBottom( true, false, 0, 145 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0.74, 0.94, 0.99 )
	Image0:setAlpha( 0.06 )
	Image0:setXRot( 180 )
	Image0:setZoom( -40 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframeside" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local msBottomFrameRight = LUI.UIImage.new()
	msBottomFrameRight:setLeftRight( true, true, 0, 0 )
	msBottomFrameRight:setTopBottom( true, true, 0, 0 )
	msBottomFrameRight:setRGB( 0.74, 0.94, 0.99 )
	msBottomFrameRight:setAlpha( 0.5 )
	msBottomFrameRight:setXRot( 180 )
	msBottomFrameRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframeside" ) )
	msBottomFrameRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBottomFrameRight )
	self.msBottomFrameRight = msBottomFrameRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
