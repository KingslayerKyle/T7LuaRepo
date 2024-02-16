CoD.FadingSkipPrompt = InheritFrom( LUI.UIElement )
CoD.FadingSkipPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FadingSkipPrompt )
	self.id = "FadingSkipPrompt"
	self.soundSet = "Omnipedia"
	self:setLeftRight( true, false, 0, 341 )
	self:setTopBottom( true, false, 0, 25 )
	
	local pressXtext = LUI.UIText.new()
	pressXtext:setLeftRight( true, false, 0, 341 )
	pressXtext:setTopBottom( true, false, 0, 25 )
	pressXtext:setText( Engine.Localize( "PLATFORM_SKIP" ) )
	pressXtext:setTTF( "fonts/default.ttf" )
	pressXtext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	pressXtext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( pressXtext )
	self.pressXtext = pressXtext
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				pressXtext:completeAnimation()
				self.pressXtext:setAlpha( 0 )
				self.clipFinished( pressXtext, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 1 )
				local pressXtextFrame2 = function ( pressXtext, event )
					local pressXtextFrame3 = function ( pressXtext, event )
						if not event.interrupted then
							pressXtext:beginAnimation( "keyframe", 1670, false, false, CoD.TweenType.Linear )
						end
						pressXtext:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pressXtext, event )
						else
							pressXtext:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pressXtextFrame3( pressXtext, event )
						return 
					else
						pressXtext:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						pressXtext:setAlpha( 1 )
						pressXtext:registerEventHandler( "transition_complete_keyframe", pressXtextFrame3 )
					end
				end
				
				pressXtext:completeAnimation()
				self.pressXtext:setAlpha( 0 )
				pressXtextFrame2( pressXtext, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

