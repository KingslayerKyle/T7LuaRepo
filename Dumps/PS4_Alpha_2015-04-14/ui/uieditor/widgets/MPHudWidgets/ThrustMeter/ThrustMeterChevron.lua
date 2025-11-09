CoD.ThrustMeterChevron = InheritFrom( LUI.UIElement )
CoD.ThrustMeterChevron.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterChevron )
	self.id = "ThrustMeterChevron"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 229 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -4, 12 )
	Image0:setTopBottom( false, true, -12, 4 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_hud_boost_arrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, 3, 11 )
	Image00:setTopBottom( false, true, -12, 4 )
	Image00:setRGB( 1, 1, 1 )
	Image00:setImage( RegisterImage( "uie_t7_hud_boost_arrow2" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Drain = function ()
				self:setupElementClipCounter( 1 )
				Image00:completeAnimation()
				self.Image00:setLeftRight( false, false, 4, 12 )
				self.Image00:setTopBottom( false, true, -12, 4 )
				self.Image00:setAlpha( 1 )
				self.Image00:setYRot( 0 )
				self.clipFinished( Image00, {} )
			end,
			Fill = function ()
				self:setupElementClipCounter( 1 )
				Image00:completeAnimation()
				self.Image00:setLeftRight( false, false, 5, 13 )
				self.Image00:setTopBottom( false, true, -12, 4 )
				self.Image00:setAlpha( 1 )
				self.Image00:setYRot( 180 )
				self.clipFinished( Image00, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

