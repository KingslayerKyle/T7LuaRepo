CoD.BombTimerWidget = InheritFrom( LUI.UIElement )
CoD.BombTimerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BombTimerWidget )
	self.id = "BombTimerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local BombTimerBgImage = LUI.UIImage.new()
	BombTimerBgImage:setLeftRight( true, true, 0, 0 )
	BombTimerBgImage:setTopBottom( true, true, 0, 0 )
	BombTimerBgImage:setRGB( 1, 1, 1 )
	BombTimerBgImage:setImage( RegisterImage( "uie_hud_icon_bomb_a" ) )
	BombTimerBgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BombTimerBgImage )
	self.BombTimerBgImage = BombTimerBgImage
	
	local timer = LUI.UITightText.new()
	timer:setLeftRight( true, true, 12, -12 )
	timer:setTopBottom( true, true, 6, -17 )
	timer:setRGB( 1, 1, 1 )
	timer:setTTF( "fonts/default.ttf" )
	timer:setupBombTimer( 0 )
	self:addElement( timer )
	self.timer = timer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BombTimerBgImage:completeAnimation()
				self.BombTimerBgImage:setAlpha( 0 )
				self.clipFinished( BombTimerBgImage, {} )
				timer:completeAnimation()
				self.timer:setAlpha( 0 )
				self.clipFinished( timer, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BombTimerBgImage:completeAnimation()
				self.BombTimerBgImage:setAlpha( 1 )
				self.clipFinished( BombTimerBgImage, {} )
				timer:completeAnimation()
				self.timer:setAlpha( 1 )
				self.clipFinished( timer, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

