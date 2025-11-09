CoD.vhud_ms_LockArrow = InheritFrom( LUI.UIElement )
CoD.vhud_ms_LockArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_LockArrow )
	self.id = "vhud_ms_LockArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -12, 11 )
	Image0:setTopBottom( false, false, -12, 11 )
	Image0:setRGB( 1, 0.03, 0 )
	Image0:setAlpha( 0.7 )
	Image0:setZRot( 90 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_lockarrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0.06 )
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

