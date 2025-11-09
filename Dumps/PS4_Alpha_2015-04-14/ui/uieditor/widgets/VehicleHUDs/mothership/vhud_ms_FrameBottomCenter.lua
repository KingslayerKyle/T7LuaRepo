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
	msBottomFrameCenter:setLeftRight( false, false, -259.53, 259.53 )
	msBottomFrameCenter:setTopBottom( false, false, -31.94, 31.94 )
	msBottomFrameCenter:setRGB( 0.74, 0.94, 0.99 )
	msBottomFrameCenter:setAlpha( 0.6 )
	msBottomFrameCenter:setXRot( 180 )
	msBottomFrameCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframecenter" ) )
	msBottomFrameCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBottomFrameCenter )
	self.msBottomFrameCenter = msBottomFrameCenter
	
	local msBottomFrameCenterDepth = LUI.UIImage.new()
	msBottomFrameCenterDepth:setLeftRight( false, false, -259.53, 259.53 )
	msBottomFrameCenterDepth:setTopBottom( false, false, -31.94, 31.94 )
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

