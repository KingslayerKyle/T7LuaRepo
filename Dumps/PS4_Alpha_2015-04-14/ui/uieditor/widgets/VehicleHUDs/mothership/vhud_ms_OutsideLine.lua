CoD.vhud_ms_OutsideLine = InheritFrom( LUI.UIElement )
CoD.vhud_ms_OutsideLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_OutsideLine )
	self.id = "vhud_ms_OutsideLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 44 )
	self:setTopBottom( true, false, 0, 15 )
	
	local msOuterLineR = LUI.UIImage.new()
	msOuterLineR:setLeftRight( false, false, -22.11, 22.11 )
	msOuterLineR:setTopBottom( false, false, -7.37, 7.37 )
	msOuterLineR:setRGB( 0.74, 0.94, 0.99 )
	msOuterLineR:setAlpha( 0.3 )
	msOuterLineR:setZoom( 50 )
	msOuterLineR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_outerline" ) )
	msOuterLineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msOuterLineR )
	self.msOuterLineR = msOuterLineR
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -22, 22.21 )
	Image0:setTopBottom( false, false, -7.37, 7.37 )
	Image0:setRGB( 0.74, 0.94, 0.99 )
	Image0:setAlpha( 0.1 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_outerline" ) )
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

