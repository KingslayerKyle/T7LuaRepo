CoD.LoadingScreenSkipPrompt = InheritFrom( LUI.UIElement )
CoD.LoadingScreenSkipPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenSkipPrompt )
	self.id = "LoadingScreenSkipPrompt"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local label = LUI.UIText.new()
	label:setLeftRight( 1, 1, -781, 0 )
	label:setTopBottom( 1, 1, -37, 0 )
	label:setText( Engine.Localize( "PLATFORM_SKIP" ) )
	label:setTTF( "fonts/default.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	label:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( label )
	self.label = label
	
	self.resetProperties = function ()
		label:completeAnimation()
		label:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end,
			ShowAndHideContinue = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local labelFrame2 = function ( label, event )
					local labelFrame3 = function ( label, event )
						local labelFrame4 = function ( label, event )
							if not event.interrupted then
								label:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							label:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( label, event )
							else
								label:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							labelFrame4( label, event )
							return 
						else
							label:beginAnimation( "keyframe", 4000, false, false, CoD.TweenType.Linear )
							label:registerEventHandler( "transition_complete_keyframe", labelFrame4 )
						end
					end
					
					if event.interrupted then
						labelFrame3( label, event )
						return 
					else
						label:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						label:setAlpha( 1 )
						label:registerEventHandler( "transition_complete_keyframe", labelFrame3 )
					end
				end
				
				label:completeAnimation()
				self.label:setAlpha( 0 )
				labelFrame2( label, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	SizeToSafeArea( element, controller )
	return self
end

