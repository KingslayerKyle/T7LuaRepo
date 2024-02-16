-- 5021f5cf4e6d886f2af035c20d748be1
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_FrameTopRightxml = InheritFrom( LUI.UIElement )
CoD.vhud_ms_FrameTopRightxml.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_FrameTopRightxml )
	self.id = "vhud_ms_FrameTopRightxml"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 481 )
	self:setTopBottom( true, false, 0, 145 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0.74, 0.94, 0.99 )
	Image0:setAlpha( 0.06 )
	Image0:setZoom( -40 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframeside" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local msTopFrameRight = LUI.UIImage.new()
	msTopFrameRight:setLeftRight( true, true, 0.21, 0 )
	msTopFrameRight:setTopBottom( true, true, 0, 0 )
	msTopFrameRight:setRGB( 0.74, 0.94, 0.99 )
	msTopFrameRight:setAlpha( 0.5 )
	msTopFrameRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframeside2" ) )
	msTopFrameRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msTopFrameRight )
	self.msTopFrameRight = msTopFrameRight
	
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
