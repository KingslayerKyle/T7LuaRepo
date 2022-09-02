-- 20d064609726fa8c3daee6c9195cb5ad
-- This hash is used for caching, delete to decompile the file again

CoD.WeaponLevelUpNotification_TitleBacking = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification_TitleBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification_TitleBacking )
	self.id = "WeaponLevelUpNotification_TitleBacking"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 152 )
	Image0:setTopBottom( true, false, 0, 40 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_weaponlevel_bottom_left" ) )
	Image0:setupUIStreamedImage( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -152, 0 )
	Image1:setTopBottom( true, false, 0, 40 )
	Image1:setRGB( 0, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_hud_weaponlevel_bottom_right" ) )
	Image1:setupUIStreamedImage( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 152, -152 )
	Image2:setTopBottom( true, false, 0, 40 )
	Image2:setRGB( 0, 0, 0 )
	Image2:setImage( RegisterImage( "uie_t7_hud_weaponlevel_bottom_stretch" ) )
	Image2:setupUIStreamedImage( 0 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

