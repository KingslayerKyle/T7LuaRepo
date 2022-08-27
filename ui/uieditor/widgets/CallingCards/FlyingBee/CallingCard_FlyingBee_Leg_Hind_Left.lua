-- cb01999a49c0ff52bc638067e6826dda
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_FlyingBee_Leg_Hind_Left = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Leg_Hind_Left.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Leg_Hind_Left )
	self.id = "CallingCard_FlyingBee_Leg_Hind_Left"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 53.33 )
	Image:setTopBottom( true, false, -21.34, 85.34 )
	Image:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_leg_bf" ) )
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

