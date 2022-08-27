-- 1be7780d6c22b8f1508177469abb5b69
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_NotificationSeatingTop = InheritFrom( LUI.UIElement )
CoD.vhud_ms_NotificationSeatingTop.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_NotificationSeatingTop )
	self.id = "vhud_ms_NotificationSeatingTop"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 19 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -9.5, 9.5 )
	Image1:setTopBottom( true, false, 18.75, 28.25 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_damagepassenger" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -17, -2 )
	Image2:setTopBottom( false, false, -14.13, 0.88 )
	Image2:setZRot( 90 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingarrow" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

