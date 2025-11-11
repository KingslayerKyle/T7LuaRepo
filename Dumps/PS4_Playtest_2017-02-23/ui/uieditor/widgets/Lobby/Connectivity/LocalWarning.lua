CoD.LocalWarning = InheritFrom( LUI.UIElement )
CoD.LocalWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LocalWarning )
	self.id = "LocalWarning"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local txtConnWarning = LUI.UIText.new()
	txtConnWarning:setLeftRight( 0, 0, 0, 561 )
	txtConnWarning:setTopBottom( 0, 0, 0, 30 )
	txtConnWarning:setAlpha( 0.75 )
	txtConnWarning:setText( Engine.Localize( "MENU_PLAYING_LOCAL" ) )
	txtConnWarning:setTTF( "fonts/default.ttf" )
	txtConnWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtConnWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtConnWarning )
	self.txtConnWarning = txtConnWarning
	
	self.resetProperties = function ()
		txtConnWarning:completeAnimation()
		txtConnWarning:setAlpha( 0.75 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PlayingLive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				txtConnWarning:completeAnimation()
				self.txtConnWarning:setAlpha( 0 )
				self.clipFinished( txtConnWarning, {} )
			end
		},
		PlayingLocal = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

