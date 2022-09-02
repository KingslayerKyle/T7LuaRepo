-- db9d887960a33602428c76b851b2c135
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 20 )
	
	local txtConnWarning = LUI.UIText.new()
	txtConnWarning:setLeftRight( true, false, 0, 374 )
	txtConnWarning:setTopBottom( true, false, 0, 20 )
	txtConnWarning:setAlpha( 0.75 )
	txtConnWarning:setText( Engine.Localize( "XBOXLIVE_PLAYING_LOCAL" ) )
	txtConnWarning:setTTF( "fonts/default.ttf" )
	txtConnWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtConnWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtConnWarning )
	self.txtConnWarning = txtConnWarning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		PlayingLive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				txtConnWarning:completeAnimation()
				self.txtConnWarning:setAlpha( 0 )
				self.clipFinished( txtConnWarning, {} )
			end
		},
		PlayingLocal = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				txtConnWarning:completeAnimation()
				self.txtConnWarning:setAlpha( 0.75 )
				self.txtConnWarning:setText( Engine.Localize( "XBOXLIVE_PLAYING_LOCAL" ) )
				self.clipFinished( txtConnWarning, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

