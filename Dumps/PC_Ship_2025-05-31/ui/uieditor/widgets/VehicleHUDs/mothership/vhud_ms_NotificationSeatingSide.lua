CoD.vhud_ms_NotificationSeatingSide = InheritFrom( LUI.UIElement )
CoD.vhud_ms_NotificationSeatingSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_NotificationSeatingSide )
	self.id = "vhud_ms_NotificationSeatingSide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 33 )
	self:setTopBottom( true, false, 0, 15 )
	
	local msSeatingBoxL = LUI.UIImage.new()
	msSeatingBoxL:setLeftRight( false, false, -16.5, 2.5 )
	msSeatingBoxL:setTopBottom( true, false, 2.75, 12.25 )
	msSeatingBoxL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_damagepassenger" ) )
	msSeatingBoxL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msSeatingBoxL )
	self.msSeatingBoxL = msSeatingBoxL
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -15, 0 )
	Image0:setTopBottom( false, false, -7.5, 7.5 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingarrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				msSeatingBoxL:completeAnimation()
				self.msSeatingBoxL:setAlpha( 0 )
				self.clipFinished( msSeatingBoxL, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

