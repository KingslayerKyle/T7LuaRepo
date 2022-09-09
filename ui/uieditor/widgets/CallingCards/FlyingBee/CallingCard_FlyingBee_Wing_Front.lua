-- 3ec12f95bd7dd95e308c10dac3c25c5d
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_FlyingBee_Wing_Front = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Wing_Front.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Wing_Front )
	self.id = "CallingCard_FlyingBee_Wing_Front"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 106.67 )
	Image:setTopBottom( true, false, -21.33, 32 )
	Image:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_wing_front" ) )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
