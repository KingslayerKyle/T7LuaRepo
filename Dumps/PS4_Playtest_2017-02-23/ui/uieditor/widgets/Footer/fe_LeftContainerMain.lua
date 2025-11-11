CoD.fe_LeftContainerMain = InheritFrom( LUI.UIElement )
CoD.fe_LeftContainerMain.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_LeftContainerMain )
	self.id = "fe_LeftContainerMain"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 501 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local lblPressToPlay = LUI.UIText.new()
	lblPressToPlay:setLeftRight( 0, 1, 0, 0 )
	lblPressToPlay:setTopBottom( 1, 1, -27, 0 )
	lblPressToPlay:setRGB( 0.85, 0.88, 0.91 )
	lblPressToPlay:setAlpha( 0.45 )
	lblPressToPlay:setText( Engine.Localize( "PLATFORM_PRESS_START" ) )
	lblPressToPlay:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	lblPressToPlay:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblPressToPlay:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lblPressToPlay )
	self.lblPressToPlay = lblPressToPlay
	
	self.resetProperties = function ()
		lblPressToPlay:completeAnimation()
		lblPressToPlay:setAlpha( 0.45 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local lblPressToPlayFrame2 = function ( lblPressToPlay, event )
					local lblPressToPlayFrame3 = function ( lblPressToPlay, event )
						local lblPressToPlayFrame4 = function ( lblPressToPlay, event )
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
							lblPressToPlayFrame4( lblPressToPlay, event )
							return 
						else
							lblPressToPlay:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
							lblPressToPlay:setAlpha( 0.45 )
							lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame4 )
						end
					end
					
					if event.interrupted then
						lblPressToPlayFrame3( lblPressToPlay, event )
						return 
					else
						lblPressToPlay:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						lblPressToPlay:setAlpha( 1 )
						lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame3 )
					end
				end
				
				lblPressToPlay:completeAnimation()
				self.lblPressToPlay:setAlpha( 0.45 )
				lblPressToPlayFrame2( lblPressToPlay, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

