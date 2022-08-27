-- 0866125db1524c8580b5ac96a358b793
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_FrameBottomCenter = InheritFrom( LUI.UIElement )
CoD.vhud_ms_FrameBottomCenter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_FrameBottomCenter )
	self.id = "vhud_ms_FrameBottomCenter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 519 )
	self:setTopBottom( true, false, 0, 64 )
	
	local msBottomFrameCenter = LUI.UIImage.new()
	msBottomFrameCenter:setLeftRight( true, true, 0, 0 )
	msBottomFrameCenter:setTopBottom( true, true, 0, 0 )
	msBottomFrameCenter:setRGB( 0.74, 0.94, 0.99 )
	msBottomFrameCenter:setAlpha( 0.6 )
	msBottomFrameCenter:setXRot( 180 )
	msBottomFrameCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframecenter" ) )
	msBottomFrameCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBottomFrameCenter )
	self.msBottomFrameCenter = msBottomFrameCenter
	
	local msBottomFrameCenterDepth = LUI.UIImage.new()
	msBottomFrameCenterDepth:setLeftRight( true, true, 0, 0 )
	msBottomFrameCenterDepth:setTopBottom( true, true, 0, 0 )
	msBottomFrameCenterDepth:setRGB( 0.74, 0.94, 0.99 )
	msBottomFrameCenterDepth:setAlpha( 0.1 )
	msBottomFrameCenterDepth:setXRot( 180 )
	msBottomFrameCenterDepth:setZoom( -50 )
	msBottomFrameCenterDepth:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframecenter" ) )
	msBottomFrameCenterDepth:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBottomFrameCenterDepth )
	self.msBottomFrameCenterDepth = msBottomFrameCenterDepth
	
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

