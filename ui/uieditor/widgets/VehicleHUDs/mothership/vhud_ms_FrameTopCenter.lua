-- 0bd17c349a1211c429ce27820e3a1385
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_FrameTopCenter = InheritFrom( LUI.UIElement )
CoD.vhud_ms_FrameTopCenter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_FrameTopCenter )
	self.id = "vhud_ms_FrameTopCenter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 519 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0.74, 0.94, 0.99 )
	Image0:setAlpha( 0.1 )
	Image0:setZoom( -50 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframecenter" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local msTopFrameCenter = LUI.UIImage.new()
	msTopFrameCenter:setLeftRight( true, true, 0, 0 )
	msTopFrameCenter:setTopBottom( true, true, 0, 0 )
	msTopFrameCenter:setRGB( 0.74, 0.94, 0.99 )
	msTopFrameCenter:setAlpha( 0.6 )
	msTopFrameCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframecenter" ) )
	msTopFrameCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msTopFrameCenter )
	self.msTopFrameCenter = msTopFrameCenter
	
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
