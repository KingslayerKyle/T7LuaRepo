-- 63a111af8666cbdca434bce6c03cd25a
-- This hash is used for caching, delete to decompile the file again

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
	Image0:setLeftRight( false, false, -5, 11 )
	Image0:setTopBottom( false, true, -12, 4 )
	Image0:setScale( 0.8 )
	Image0:setImage( RegisterImage( "uie_t7_hud_boost_arrow" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, 4, 12 )
	Image00:setTopBottom( false, true, -12, 4 )
	Image00:setScale( 1.2 )
	Image00:setImage( RegisterImage( "uie_t7_hud_boost_arrow2" ) )
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

