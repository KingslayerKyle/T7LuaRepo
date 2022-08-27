-- a5822d5746bae878a252487344381b34
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_FlyingBee_Leg_Hind_Right = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Leg_Hind_Right.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Leg_Hind_Right )
	self.id = "CallingCard_FlyingBee_Leg_Hind_Right"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 14, 40.67 )
	Image:setTopBottom( true, false, 11, 64.33 )
	Image:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_leg_bb" ) )
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

