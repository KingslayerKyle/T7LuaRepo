CoD.vhud_ms_Seating = InheritFrom( LUI.UIElement )
CoD.vhud_ms_Seating.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_Seating )
	self.id = "vhud_ms_Seating"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 101 )
	self:setTopBottom( true, false, 0, 106 )
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, true, 3.5, -2.5 )
	Image6:setTopBottom( true, true, 10.75, -0.25 )
	Image6:setRGB( 1, 1, 1 )
	Image6:setAlpha( 0.2 )
	Image6:setZoom( -50 )
	Image6:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seating" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local msSeating = LUI.UIImage.new()
	msSeating:setLeftRight( true, true, 4, -2 )
	msSeating:setTopBottom( true, true, 10.75, -0.25 )
	msSeating:setRGB( 1, 1, 1 )
	msSeating:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seating" ) )
	msSeating:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msSeating )
	self.msSeating = msSeating
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -19, 0 )
	Image0:setTopBottom( false, false, -24.75, -5.75 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingarrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -38, -21 )
	Image1:setTopBottom( false, false, -22.75, -5.75 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 19 )
	Image2:setTopBottom( false, false, -24.75, -5.75 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingarrow" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 19, 36 )
	Image3:setTopBottom( false, false, -22.75, -5.75 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, false, -10, 9 )
	Image4:setTopBottom( true, false, -1.75, 17.25 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 90 )
	Image4:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingarrow" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, false, -8, 9 )
	Image5:setTopBottom( true, false, 13.75, 30.75 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_seatingline" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
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

