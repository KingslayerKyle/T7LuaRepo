CoD.CPTrainingSim_TimeBonusBox = InheritFrom( LUI.UIElement )
CoD.CPTrainingSim_TimeBonusBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPTrainingSim_TimeBonusBox )
	self.id = "CPTrainingSim_TimeBonusBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 30 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 480, -480 )
	BlackBox:setTopBottom( true, false, 0, 30 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.5 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local txtRoundComplete = LUI.UIText.new()
	txtRoundComplete:setLeftRight( true, true, 0, 0 )
	txtRoundComplete:setTopBottom( true, false, 2, 26 )
	txtRoundComplete:setText( Engine.Localize( "CP_SH_CAIRO_TIME_BONUS" ) )
	txtRoundComplete:setTTF( "fonts/escom.ttf" )
	txtRoundComplete:setLetterSpacing( 4 )
	txtRoundComplete:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtRoundComplete:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtRoundComplete )
	self.txtRoundComplete = txtRoundComplete
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			round_complete = function ()
				self:setupElementClipCounter( 1 )
				local f3_local0 = function ( f4_arg0, f4_arg1 )
					local f4_local0 = function ( f5_arg0, f5_arg1 )
						local f5_local0 = function ( f6_arg0, f6_arg1 )
							if not f6_arg1.interrupted then
								f6_arg0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							f6_arg0:setAlpha( 0 )
							if f6_arg1.interrupted then
								self.clipFinished( f6_arg0, f6_arg1 )
							else
								f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f5_arg1.interrupted then
							f5_local0( f5_arg0, f5_arg1 )
							return 
						else
							f5_arg0:beginAnimation( "keyframe", 1710, false, false, CoD.TweenType.Linear )
							f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
						end
					end
					
					if f4_arg1.interrupted then
						f4_local0( f4_arg0, f4_arg1 )
						return 
					else
						f4_arg0:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
						f4_arg0:setAlpha( 1 )
						f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
					end
				end
				
				txtRoundComplete:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
				txtRoundComplete:setAlpha( 0 )
				txtRoundComplete:registerEventHandler( "transition_complete_keyframe", f3_local0 )
			end,
			immersion_complete = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

