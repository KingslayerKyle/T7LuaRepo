-- 7bb11e9336ce283746c6e73af3d72184
-- This hash is used for caching, delete to decompile the file again

CoD.ConsoleText = InheritFrom( LUI.UIElement )
CoD.ConsoleText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ConsoleText )
	self.id = "ConsoleText"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 330 )
	self:setTopBottom( true, false, 0, 14 )
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( true, false, 0, 330 )
	Text:setTopBottom( true, false, 0, 14 )
	Text:setAlpha( 0 )
	Text:setText( Engine.Localize( "[CLAN]XXXXXXXXXXXXXXXX" ) )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Text:setShaderVector( 0, 0, 0, 0, 0 )
	Text:setShaderVector( 1, 0.5, 0, 0, 0 )
	Text:setShaderVector( 2, 0, 0, 0, 0 )
	Text:setShaderVector( 3, 0, 0, 0, 0 )
	Text:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 1 )

				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				TextFrame2( Text, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )

				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				TextFrame2( Text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
