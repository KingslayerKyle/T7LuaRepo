-- b3bbbbc4db878166e884e08da67d25ea
-- This hash is used for caching, delete to decompile the file again

CoD.Challenges_XPIndicator = InheritFrom( LUI.UIElement )
CoD.Challenges_XPIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_XPIndicator )
	self.id = "Challenges_XPIndicator"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 91 )
	self:setTopBottom( true, false, 0, 32 )
	
	local XPIcon = LUI.UIImage.new()
	XPIcon:setLeftRight( true, false, 0, 32 )
	XPIcon:setTopBottom( true, false, 0, 32 )
	XPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XPIcon )
	self.XPIcon = XPIcon
	
	local XPText = LUI.UITightText.new()
	XPText:setLeftRight( true, false, 36, 91 )
	XPText:setTopBottom( true, false, 6, 26 )
	XPText:setText( Engine.Localize( "MENU_NEW" ) )
	XPText:setTTF( "fonts/default.ttf" )
	self:addElement( XPText )
	self.XPText = XPText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 1 )
				self.clipFinished( XPIcon, {} )
				XPText:completeAnimation()
				self.XPText:setAlpha( 1 )
				self.clipFinished( XPText, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )
				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

