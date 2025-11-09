CoD.vhud_ms_FrameBottomLeft = InheritFrom( LUI.UIElement )
CoD.vhud_ms_FrameBottomLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_FrameBottomLeft )
	self.id = "vhud_ms_FrameBottomLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 481 )
	self:setTopBottom( true, false, 0, 145 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -240.39, 240.39 )
	Image0:setTopBottom( false, false, -72.5, 72.5 )
	Image0:setRGB( 0.74, 0.94, 0.99 )
	Image0:setAlpha( 0.06 )
	Image0:setXRot( 180 )
	Image0:setYRot( -180 )
	Image0:setZoom( -40 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframeside" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local msBottomFrameLeft = LUI.UIImage.new()
	msBottomFrameLeft:setLeftRight( false, false, -240.39, 240.39 )
	msBottomFrameLeft:setTopBottom( false, false, -72.5, 72.5 )
	msBottomFrameLeft:setRGB( 0.74, 0.94, 0.99 )
	msBottomFrameLeft:setAlpha( 0.5 )
	msBottomFrameLeft:setXRot( 180 )
	msBottomFrameLeft:setYRot( -180 )
	msBottomFrameLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_topframeside" ) )
	msBottomFrameLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBottomFrameLeft )
	self.msBottomFrameLeft = msBottomFrameLeft
	
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

