CoD.vhud_siegebot_directionalarrow = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_directionalarrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_directionalarrow )
	self.id = "vhud_siegebot_directionalarrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 106 )
	self:setTopBottom( true, false, 0, 106 )
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 25, 82.07 )
	Arrow:setTopBottom( true, false, 15, 43 )
	Arrow:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_circlelockedarrow2" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
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
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

