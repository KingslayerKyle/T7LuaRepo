-- fca7f0e9c8a014b9295735b175d32692
-- This hash is used for caching, delete to decompile the file again

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
	msGridDotsHostR:setLeftRight( true, true, 0, 0 )
	msGridDotsHostR:setTopBottom( true, true, 0, 0 )
	msGridDotsHostR:setAlpha( 0.4 )
	msGridDotsHostR:setZoom( 40 )
	msGridDotsHostR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_sidedotsgridhost" ) )
	msGridDotsHostR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msGridDotsHostR )
	self.msGridDotsHostR = msGridDotsHostR
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
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
