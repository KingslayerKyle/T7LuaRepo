-- 796f698474e59313d1a03dac58c46b5b
-- This hash is used for caching, delete to decompile the file again

CoD.WeaponLevelUpNotification_LineFade = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification_LineFade.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification_LineFade )
	self.id = "WeaponLevelUpNotification_LineFade"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 8 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 170 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_weaponlevel_line_left" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 170, -170 )
	Image1:setTopBottom( true, true, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_hud_weaponlevel_line_stretch" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -170, 0 )
	Image2:setTopBottom( true, true, 0, 0 )
	Image2:setImage( RegisterImage( "uie_t7_hud_weaponlevel_line_right" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
