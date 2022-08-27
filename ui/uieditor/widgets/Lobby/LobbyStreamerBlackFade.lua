-- 41231a2ff8d4300c1487b71731f6711f
-- This hash is used for caching, delete to decompile the file again

CoD.LobbyStreamerBlackFade = InheritFrom( LUI.UIElement )
CoD.LobbyStreamerBlackFade.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyStreamerBlackFade )
	self.id = "LobbyStreamerBlackFade"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0, 0 )
	Black:setTopBottom( true, true, 0, 0 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0 )
	self:addElement( Black )
	self.Black = Black
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Black:completeAnimation()
				self.Black:setAlpha( 1 )
				self.clipFinished( Black, {} )
			end,
			Transparent = function ()
				self:setupElementClipCounter( 1 )
				local BlackFrame2 = function ( Black, event )
					if not event.interrupted then
						Black:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Black:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Black, event )
					else
						Black:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Black:completeAnimation()
				self.Black:setAlpha( 1 )
				BlackFrame2( Black, {} )
			end
		},
		Transparent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Black:completeAnimation()
				self.Black:setAlpha( 0 )
				self.clipFinished( Black, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

