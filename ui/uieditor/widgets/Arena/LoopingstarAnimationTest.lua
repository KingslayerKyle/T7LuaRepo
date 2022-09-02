-- be6f22687c5eebd390ba83f70d3b8d03
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.arena.ArenaStarAnimation3" )

CoD.LoopingstarAnimationTest = InheritFrom( LUI.UIElement )
CoD.LoopingstarAnimationTest.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.LoopingstarAnimationTest )
	self.id = "LoopingstarAnimationTest"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 270 )
	self:setTopBottom( true, false, 0, 250 )
	
	local ArenaStarAnimation1 = CoD.ArenaStarAnimation3.new( menu, controller )
	ArenaStarAnimation1:setLeftRight( false, false, -95, 95 )
	ArenaStarAnimation1:setTopBottom( false, false, -324, -134 )
	self:addElement( ArenaStarAnimation1 )
	self.ArenaStarAnimation1 = ArenaStarAnimation1
	
	local ArenaStarAnimation2 = CoD.ArenaStarAnimation3.new( menu, controller )
	ArenaStarAnimation2:setLeftRight( false, false, -95, 95 )
	ArenaStarAnimation2:setTopBottom( false, false, -514, -324 )
	self:addElement( ArenaStarAnimation2 )
	self.ArenaStarAnimation2 = ArenaStarAnimation2
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( false, false, -111, 111 )
	backing:setTopBottom( false, false, -25.5, 54 )
	backing:setRGB( 0, 0, 0 )
	backing:setAlpha( 0.42 )
	self:addElement( backing )
	self.backing = backing
	
	local highlight00 = LUI.UIImage.new()
	highlight00:setLeftRight( false, false, -58.5, 58.5 )
	highlight00:setTopBottom( false, false, -109.88, 3.13 )
	highlight00:setRGB( 0.62, 0.49, 0.05 )
	highlight00:setAlpha( 0 )
	highlight00:setZRot( 221 )
	highlight00:setScale( 1.89 )
	highlight00:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight00 )
	self.highlight00 = highlight00
	
	local Glicth = LUI.UIImage.new()
	Glicth:setLeftRight( false, false, -111, 111 )
	Glicth:setTopBottom( false, false, -125, -48 )
	Glicth:setAlpha( 0 )
	Glicth:setImage( RegisterImage( "uie_t7_effect_glitches_menu9lblur" ) )
	Glicth:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glicth )
	self.Glicth = Glicth
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( false, false, -95, 65.49 )
	highlight:setTopBottom( false, false, -77.5, 77.5 )
	highlight:setAlpha( 0.3 )
	highlight:setZRot( 108 )
	highlight:setScale( 2.66 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Glicth:completeAnimation()
				self.Glicth:setAlpha( 0 )
				self.clipFinished( Glicth, {} )
			end
		},
		StarLoop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local ArenaStarAnimation1Frame2 = function ( ArenaStarAnimation1, event )
					if not event.interrupted then
						ArenaStarAnimation1:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					ArenaStarAnimation1:setLeftRight( false, false, -95, 95 )
					ArenaStarAnimation1:setTopBottom( false, false, 135, 325 )
					ArenaStarAnimation1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaStarAnimation1, event )
					else
						ArenaStarAnimation1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaStarAnimation1:completeAnimation()
				self.ArenaStarAnimation1:setLeftRight( false, false, -95, 95 )
				self.ArenaStarAnimation1:setTopBottom( false, false, -95, 95 )
				self.ArenaStarAnimation1:setAlpha( 1 )
				ArenaStarAnimation1Frame2( ArenaStarAnimation1, {} )
				local ArenaStarAnimation2Frame2 = function ( ArenaStarAnimation2, event )
					local ArenaStarAnimation2Frame3 = function ( ArenaStarAnimation2, event )
						if not event.interrupted then
							ArenaStarAnimation2:beginAnimation( "keyframe", 280, true, false, CoD.TweenType.Linear )
						end
						ArenaStarAnimation2:setLeftRight( false, false, -95, 95 )
						ArenaStarAnimation2:setTopBottom( false, false, -95, 95 )
						ArenaStarAnimation2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ArenaStarAnimation2, event )
						else
							ArenaStarAnimation2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ArenaStarAnimation2Frame3( ArenaStarAnimation2, event )
						return 
					else
						ArenaStarAnimation2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ArenaStarAnimation2:setAlpha( 0.01 )
						ArenaStarAnimation2:registerEventHandler( "transition_complete_keyframe", ArenaStarAnimation2Frame3 )
					end
				end
				
				ArenaStarAnimation2:completeAnimation()
				self.ArenaStarAnimation2:setLeftRight( false, false, -95, 95 )
				self.ArenaStarAnimation2:setTopBottom( false, false, -325, -135 )
				self.ArenaStarAnimation2:setAlpha( 0 )
				ArenaStarAnimation2Frame2( ArenaStarAnimation2, {} )

				backing:completeAnimation()
				self.backing:setAlpha( 0.42 )
				self.clipFinished( backing, {} )
				local GlicthFrame2 = function ( Glicth, event )
					local GlicthFrame3 = function ( Glicth, event )
						if not event.interrupted then
							Glicth:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						end
						Glicth:setLeftRight( false, false, -111, 111 )
						Glicth:setTopBottom( false, false, -202, -125 )
						Glicth:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glicth, event )
						else
							Glicth:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlicthFrame3( Glicth, event )
						return 
					else
						Glicth:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						Glicth:setTopBottom( false, false, 125, 202 )
						Glicth:registerEventHandler( "transition_complete_keyframe", GlicthFrame3 )
					end
				end
				
				Glicth:completeAnimation()
				self.Glicth:setLeftRight( false, false, -111, 111 )
				self.Glicth:setTopBottom( false, false, -125, -48 )
				self.Glicth:setAlpha( 0 )
				GlicthFrame2( Glicth, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						if not event.interrupted then
							highlight:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						highlight:setLeftRight( false, false, -95, 65.49 )
						highlight:setTopBottom( false, false, -77.5, 77.5 )
						highlight:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( highlight, event )
						else
							highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						highlight:setAlpha( 0 )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setLeftRight( false, false, -95, 65.49 )
				self.highlight:setTopBottom( false, false, -77.5, 77.5 )
				self.highlight:setAlpha( 0.2 )
				highlightFrame2( highlight, {} )

				self.nextClip = "DefaultClip"
			end
		},
		StopAnimation = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local ArenaStarAnimation1Frame2 = function ( ArenaStarAnimation1, event )
					if not event.interrupted then
						ArenaStarAnimation1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArenaStarAnimation1:setLeftRight( false, false, -95, 95 )
					ArenaStarAnimation1:setTopBottom( false, false, 135, 325 )
					ArenaStarAnimation1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArenaStarAnimation1, event )
					else
						ArenaStarAnimation1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArenaStarAnimation1:completeAnimation()
				self.ArenaStarAnimation1:setLeftRight( false, false, -95, 95 )
				self.ArenaStarAnimation1:setTopBottom( false, false, -95, 95 )
				self.ArenaStarAnimation1:setAlpha( 1 )
				ArenaStarAnimation1Frame2( ArenaStarAnimation1, {} )
				local ArenaStarAnimation2Frame2 = function ( ArenaStarAnimation2, event )
					local ArenaStarAnimation2Frame3 = function ( ArenaStarAnimation2, event )
						if not event.interrupted then
							ArenaStarAnimation2:beginAnimation( "keyframe", 419, false, true, CoD.TweenType.Linear )
						end
						ArenaStarAnimation2:setLeftRight( false, false, -95, 95 )
						ArenaStarAnimation2:setTopBottom( false, false, -95, 95 )
						ArenaStarAnimation2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ArenaStarAnimation2, event )
						else
							ArenaStarAnimation2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ArenaStarAnimation2Frame3( ArenaStarAnimation2, event )
						return 
					else
						ArenaStarAnimation2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ArenaStarAnimation2:setAlpha( 0.13 )
						ArenaStarAnimation2:registerEventHandler( "transition_complete_keyframe", ArenaStarAnimation2Frame3 )
					end
				end
				
				ArenaStarAnimation2:completeAnimation()
				self.ArenaStarAnimation2:setLeftRight( false, false, -95, 95 )
				self.ArenaStarAnimation2:setTopBottom( false, false, -325, -135 )
				self.ArenaStarAnimation2:setAlpha( 0 )
				ArenaStarAnimation2Frame2( ArenaStarAnimation2, {} )

				backing:completeAnimation()
				self.backing:setLeftRight( false, false, -111, 111 )
				self.backing:setTopBottom( false, false, -25.5, 54 )
				self.backing:setAlpha( 0.42 )
				self.clipFinished( backing, {} )
				local GlicthFrame2 = function ( Glicth, event )
					local GlicthFrame3 = function ( Glicth, event )
						if not event.interrupted then
							Glicth:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						Glicth:setLeftRight( false, false, -111, 111 )
						Glicth:setTopBottom( false, false, -202, -125 )
						Glicth:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glicth, event )
						else
							Glicth:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlicthFrame3( Glicth, event )
						return 
					else
						Glicth:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						Glicth:setTopBottom( false, false, 125, 202 )
						Glicth:registerEventHandler( "transition_complete_keyframe", GlicthFrame3 )
					end
				end
				
				Glicth:completeAnimation()
				self.Glicth:setLeftRight( false, false, -111, 111 )
				self.Glicth:setTopBottom( false, false, -125, -48 )
				self.Glicth:setAlpha( 0 )
				GlicthFrame2( Glicth, {} )

				highlight:completeAnimation()
				self.highlight:setAlpha( 0.2 )
				self.clipFinished( highlight, {} )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 4 )

				local backingFrame2 = function ( backing, event )
					if not event.interrupted then
						backing:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					backing:setLeftRight( false, false, -111, 111 )
					backing:setTopBottom( false, false, -25.5, 54 )
					backing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( backing, event )
					else
						backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backing:completeAnimation()
				self.backing:setLeftRight( false, false, -111, 111 )
				self.backing:setTopBottom( false, false, -25.5, 54 )
				self.backing:setAlpha( 0.42 )
				backingFrame2( backing, {} )
				local highlight00Frame2 = function ( highlight00, event )
					local highlight00Frame3 = function ( highlight00, event )
						local highlight00Frame4 = function ( highlight00, event )
							if not event.interrupted then
								highlight00:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							highlight00:setLeftRight( false, false, -68.5, 68.5 )
							highlight00:setTopBottom( false, false, -51.91, 80.41 )
							highlight00:setAlpha( 0 )
							highlight00:setZRot( 443 )
							if event.interrupted then
								self.clipFinished( highlight00, event )
							else
								highlight00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							highlight00Frame4( highlight00, event )
							return 
						else
							highlight00:beginAnimation( "keyframe", 220, true, false, CoD.TweenType.Linear )
							highlight00:setLeftRight( false, false, -68.5, 68.5 )
							highlight00:setTopBottom( false, false, -51.91, 80.41 )
							highlight00:setAlpha( 0.48 )
							highlight00:setZRot( 443 )
							highlight00:registerEventHandler( "transition_complete_keyframe", highlight00Frame4 )
						end
					end
					
					if event.interrupted then
						highlight00Frame3( highlight00, event )
						return 
					else
						highlight00:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						highlight00:setLeftRight( false, false, -60.15, 60.15 )
						highlight00:setTopBottom( false, false, -43.85, 72.35 )
						highlight00:registerEventHandler( "transition_complete_keyframe", highlight00Frame3 )
					end
				end
				
				highlight00:completeAnimation()
				self.highlight00:setLeftRight( false, false, -58.5, 58.5 )
				self.highlight00:setTopBottom( false, false, -42.25, 70.75 )
				self.highlight00:setAlpha( 1 )
				self.highlight00:setZRot( 278 )
				highlight00Frame2( highlight00, {} )

				Glicth:completeAnimation()
				self.Glicth:setAlpha( 0 )
				self.clipFinished( Glicth, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							local highlightFrame5 = function ( highlight, event )
								if not event.interrupted then
									highlight:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								end
								highlight:setLeftRight( false, false, -95, 65.49 )
								highlight:setTopBottom( false, false, -77.5, 77.5 )
								highlight:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( highlight, event )
								else
									highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlightFrame5( highlight, event )
								return 
							else
								highlight:beginAnimation( "keyframe", 209, true, true, CoD.TweenType.Linear )
								highlight:setAlpha( 0.2 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							highlight:setAlpha( 0.3 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						highlight:setAlpha( 0 )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setLeftRight( false, false, -95, 65.49 )
				self.highlight:setTopBottom( false, false, -77.5, 77.5 )
				self.highlight:setAlpha( 0.2 )
				highlightFrame2( highlight, {} )
			end
		},
		StarIntro = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local ArenaStarAnimation1Frame2 = function ( ArenaStarAnimation1, event )
					local ArenaStarAnimation1Frame3 = function ( ArenaStarAnimation1, event )
						if not event.interrupted then
							ArenaStarAnimation1:beginAnimation( "keyframe", 280, true, false, CoD.TweenType.Linear )
						end
						ArenaStarAnimation1:setLeftRight( false, false, -95, 95 )
						ArenaStarAnimation1:setTopBottom( false, false, -95, 95 )
						ArenaStarAnimation1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ArenaStarAnimation1, event )
						else
							ArenaStarAnimation1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ArenaStarAnimation1Frame3( ArenaStarAnimation1, event )
						return 
					else
						ArenaStarAnimation1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ArenaStarAnimation1:setTopBottom( false, false, -325, -135 )
						ArenaStarAnimation1:setAlpha( 0.01 )
						ArenaStarAnimation1:registerEventHandler( "transition_complete_keyframe", ArenaStarAnimation1Frame3 )
					end
				end
				
				ArenaStarAnimation1:completeAnimation()
				self.ArenaStarAnimation1:setLeftRight( false, false, -95, 95 )
				self.ArenaStarAnimation1:setTopBottom( false, false, -324, -134 )
				self.ArenaStarAnimation1:setAlpha( 0 )
				ArenaStarAnimation1Frame2( ArenaStarAnimation1, {} )

				ArenaStarAnimation2:completeAnimation()
				self.ArenaStarAnimation2:setLeftRight( false, false, -95, 95 )
				self.ArenaStarAnimation2:setTopBottom( false, false, -514, -324 )
				self.clipFinished( ArenaStarAnimation2, {} )

				backing:completeAnimation()
				self.backing:setAlpha( 0.42 )
				self.clipFinished( backing, {} )
				local GlicthFrame2 = function ( Glicth, event )
					local GlicthFrame3 = function ( Glicth, event )
						if not event.interrupted then
							Glicth:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						end
						Glicth:setLeftRight( false, false, -111, 111 )
						Glicth:setTopBottom( false, false, -202, -125 )
						Glicth:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glicth, event )
						else
							Glicth:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlicthFrame3( Glicth, event )
						return 
					else
						Glicth:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						Glicth:setTopBottom( false, false, 125, 202 )
						Glicth:registerEventHandler( "transition_complete_keyframe", GlicthFrame3 )
					end
				end
				
				Glicth:completeAnimation()
				self.Glicth:setLeftRight( false, false, -111, 111 )
				self.Glicth:setTopBottom( false, false, -125, -48 )
				self.Glicth:setAlpha( 0 )
				GlicthFrame2( Glicth, {} )

				highlight:completeAnimation()
				self.highlight:setAlpha( 0.2 )
				self.highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( highlight, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ArenaStarAnimation1:close()
		element.ArenaStarAnimation2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

