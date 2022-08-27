-- 3575386080bbe78aa5cbb912d4cd329a
-- This hash is used for caching, delete to decompile the file again

CoD.WeaponLevelUpNotification_TopBacking = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification_TopBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification_TopBacking )
	self.id = "WeaponLevelUpNotification_TopBacking"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 80 )
	
	local TopLeft = LUI.UIImage.new()
	TopLeft:setLeftRight( false, false, -204, -4 )
	TopLeft:setTopBottom( true, false, 0, 80 )
	TopLeft:setRGB( 0, 0, 0 )
	TopLeft:setAlpha( 0.6 )
	TopLeft:setImage( RegisterImage( "uie_t7_hud_weaponlevel_top_left" ) )
	TopLeft:setupUIStreamedImage( 0 )
	self:addElement( TopLeft )
	self.TopLeft = TopLeft
	
	local TopRight = LUI.UIImage.new()
	TopRight:setLeftRight( false, false, 4, 204 )
	TopRight:setTopBottom( true, false, 0, 80 )
	TopRight:setRGB( 0, 0, 0 )
	TopRight:setAlpha( 0.6 )
	TopRight:setYRot( 180 )
	TopRight:setImage( RegisterImage( "uie_t7_hud_weaponlevel_top_left" ) )
	TopRight:setupUIStreamedImage( 0 )
	self:addElement( TopRight )
	self.TopRight = TopRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TopLeft:completeAnimation()
				self.TopLeft:setLeftRight( false, false, -204, -4 )
				self.TopLeft:setTopBottom( true, false, 0, 80 )
				self.TopLeft:setAlpha( 0.6 )
				self.TopLeft:setScale( 1 )
				self.clipFinished( TopLeft, {} )
				TopRight:completeAnimation()
				self.TopRight:setLeftRight( false, false, 4, 204 )
				self.TopRight:setTopBottom( true, false, 0, 80 )
				self.TopRight:setAlpha( 0.6 )
				self.TopRight:setScale( 1 )
				self.clipFinished( TopRight, {} )
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

