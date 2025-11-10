CoD.CodCasterBombTimerWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterBombTimerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterBombTimerWidget )
	self.id = "CodCasterBombTimerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 56 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( false, false, -15, 15 )
	bg:setTopBottom( true, false, 0, 30 )
	bg:setImage( RegisterImage( "uie_hud_icon_bomb_a" ) )
	self:addElement( bg )
	self.bg = bg
	
	local timer = LUI.UITightText.new()
	timer:setLeftRight( false, false, -27, 27 )
	timer:setTopBottom( true, false, 35, 55 )
	timer:setTTF( "fonts/default.ttf" )
	timer:setupBombTimer( 0 )
	self:addElement( timer )
	self.timer = timer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				timer:completeAnimation()
				self.timer:setAlpha( 0 )
				self.clipFinished( timer, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
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

