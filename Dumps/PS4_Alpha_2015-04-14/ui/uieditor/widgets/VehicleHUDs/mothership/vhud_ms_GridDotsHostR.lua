CoD.vhud_ms_GridDotsHostR = InheritFrom( LUI.UIElement )
CoD.vhud_ms_GridDotsHostR.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_GridDotsHostR )
	self.id = "vhud_ms_GridDotsHostR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 119 )
	self:setTopBottom( true, false, 0, 119 )
	
	local msGridDotsHostR = LUI.UIImage.new()
	msGridDotsHostR:setLeftRight( false, false, -59.63, 59.63 )
	msGridDotsHostR:setTopBottom( false, false, -59.63, 59.63 )
	msGridDotsHostR:setRGB( 1, 1, 1 )
	msGridDotsHostR:setAlpha( 0.4 )
	msGridDotsHostR:setZoom( 40 )
	msGridDotsHostR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_sidedotsgridhost" ) )
	msGridDotsHostR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msGridDotsHostR )
	self.msGridDotsHostR = msGridDotsHostR
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -59.5, 59.76 )
	Image0:setTopBottom( false, false, -59.63, 59.63 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0.1 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_sidedotsgridhost" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
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

