-- 9c25615e74d639c9feb16bbd94e36570
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_FlyingBee_Leg_Mid = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Leg_Mid.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Leg_Mid )
	self.id = "CallingCard_FlyingBee_Leg_Mid"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 9, 35.67 )
	Image:setTopBottom( true, false, -6.67, 46.67 )
	Image:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_leg_mid" ) )
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

