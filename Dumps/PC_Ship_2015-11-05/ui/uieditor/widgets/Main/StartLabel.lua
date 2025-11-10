CoD.StartLabel = InheritFrom( LUI.UIElement )
CoD.StartLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.StartLabel )
	self.id = "StartLabel"
	self.soundSet = "FrontendMain"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local lblPressToPlay = LUI.UIText.new()
	lblPressToPlay:setLeftRight( true, false, 64, 398 )
	lblPressToPlay:setTopBottom( false, true, -58, -36 )
	lblPressToPlay:setRGB( 0.85, 0.88, 0.91 )
	lblPressToPlay:setAlpha( 0 )
	lblPressToPlay:setText( Engine.Localize( "PLATFORM_PRESS_START" ) )
	lblPressToPlay:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	lblPressToPlay:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblPressToPlay:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lblPressToPlay )
	self.lblPressToPlay = lblPressToPlay
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local lblPressToPlayFrame2 = function ( lblPressToPlay, event )
					local lblPressToPlayFrame3 = function ( lblPressToPlay, event )
						local lblPressToPlayFrame4 = function ( lblPressToPlay, event )
							local lblPressToPlayFrame5 = function ( lblPressToPlay, event )
								if not event.interrupted then
									lblPressToPlay:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								end
								lblPressToPlay:setAlpha( 0.45 )
								if event.interrupted then
									self.clipFinished( lblPressToPlay, event )
								else
									lblPressToPlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								lblPressToPlayFrame5( lblPressToPlay, event )
								return 
							else
								lblPressToPlay:beginAnimation( "keyframe", 1000, true, false, CoD.TweenType.Linear )
								lblPressToPlay:setAlpha( 0.45 )
								lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame5 )
							end
						end
						
						if event.interrupted then
							lblPressToPlayFrame4( lblPressToPlay, event )
							return 
						else
							lblPressToPlay:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame4 )
						end
					end
					
					if event.interrupted then
						lblPressToPlayFrame3( lblPressToPlay, event )
						return 
					else
						lblPressToPlay:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Linear )
						lblPressToPlay:setAlpha( 1 )
						lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame3 )
					end
				end
				
				lblPressToPlay:completeAnimation()
				self.lblPressToPlay:setAlpha( 0.45 )
				lblPressToPlayFrame2( lblPressToPlay, {} )
				self.nextClip = "DefaultClip"
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local lblPressToPlayFrame2 = function ( lblPressToPlay, event )
					local lblPressToPlayFrame3 = function ( lblPressToPlay, event )
						local lblPressToPlayFrame4 = function ( lblPressToPlay, event )
							local lblPressToPlayFrame5 = function ( lblPressToPlay, event )
								if not event.interrupted then
									lblPressToPlay:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								end
								lblPressToPlay:setAlpha( 0.45 )
								if event.interrupted then
									self.clipFinished( lblPressToPlay, event )
								else
									lblPressToPlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								lblPressToPlayFrame5( lblPressToPlay, event )
								return 
							else
								lblPressToPlay:beginAnimation( "keyframe", 1000, true, false, CoD.TweenType.Linear )
								lblPressToPlay:setAlpha( 0.45 )
								lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame5 )
							end
						end
						
						if event.interrupted then
							lblPressToPlayFrame4( lblPressToPlay, event )
							return 
						else
							lblPressToPlay:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame4 )
						end
					end
					
					if event.interrupted then
						lblPressToPlayFrame3( lblPressToPlay, event )
						return 
					else
						lblPressToPlay:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Linear )
						lblPressToPlay:setAlpha( 1 )
						lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame3 )
					end
				end
				
				lblPressToPlay:completeAnimation()
				self.lblPressToPlay:setAlpha( 0.45 )
				lblPressToPlayFrame2( lblPressToPlay, {} )
				self.nextClip = "Focus"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

