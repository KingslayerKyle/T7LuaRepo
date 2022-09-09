-- ab2f27e368945b197cfdafb0b5100868
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelTimerInternal" )

CoD.ScoreInfo_PanelTimer = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_PanelTimer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_PanelTimer )
	self.id = "ScoreInfo_PanelTimer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 40 )
	
	local ScoreInfoPanelTimerInternal0 = CoD.ScoreInfo_PanelTimerInternal.new( menu, controller )
	ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
	ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
	ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
	ScoreInfoPanelTimerInternal0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	ScoreInfoPanelTimerInternal0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( ScoreInfoPanelTimerInternal0 )
	self.ScoreInfoPanelTimerInternal0 = ScoreInfoPanelTimerInternal0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ScoreInfoPanelTimerInternal0:completeAnimation()
				self.ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
				self.ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 486, 526 )
				self.ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
				self.clipFinished( ScoreInfoPanelTimerInternal0, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )

				local ScoreInfoPanelTimerInternal0Frame2 = function ( ScoreInfoPanelTimerInternal0, event )
					if not event.interrupted then
						ScoreInfoPanelTimerInternal0:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
					ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
					ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
					if event.interrupted then
						self.clipFinished( ScoreInfoPanelTimerInternal0, event )
					else
						ScoreInfoPanelTimerInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreInfoPanelTimerInternal0:completeAnimation()
				self.ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
				self.ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 486, 526 )
				self.ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
				ScoreInfoPanelTimerInternal0Frame2( ScoreInfoPanelTimerInternal0, {} )
			end,
			TimeLow = function ()
				self:setupElementClipCounter( 1 )

				local ScoreInfoPanelTimerInternal0Frame2 = function ( ScoreInfoPanelTimerInternal0, event )
					if not event.interrupted then
						ScoreInfoPanelTimerInternal0:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
					ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
					ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
					if event.interrupted then
						self.clipFinished( ScoreInfoPanelTimerInternal0, event )
					else
						ScoreInfoPanelTimerInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreInfoPanelTimerInternal0:completeAnimation()
				self.ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
				self.ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 486, 526 )
				self.ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
				ScoreInfoPanelTimerInternal0Frame2( ScoreInfoPanelTimerInternal0, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ScoreInfoPanelTimerInternal0:completeAnimation()
				self.ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
				self.ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
				self.ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
				self.clipFinished( ScoreInfoPanelTimerInternal0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local ScoreInfoPanelTimerInternal0Frame2 = function ( ScoreInfoPanelTimerInternal0, event )
					if not event.interrupted then
						ScoreInfoPanelTimerInternal0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
					ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 486, 526 )
					ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
					if event.interrupted then
						self.clipFinished( ScoreInfoPanelTimerInternal0, event )
					else
						ScoreInfoPanelTimerInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreInfoPanelTimerInternal0:completeAnimation()
				self.ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
				self.ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
				self.ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
				ScoreInfoPanelTimerInternal0Frame2( ScoreInfoPanelTimerInternal0, {} )
			end
		},
		TimeLow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ScoreInfoPanelTimerInternal0Frame2 = function ( ScoreInfoPanelTimerInternal0, event )
					local ScoreInfoPanelTimerInternal0Frame3 = function ( ScoreInfoPanelTimerInternal0, event )
						local ScoreInfoPanelTimerInternal0Frame4 = function ( ScoreInfoPanelTimerInternal0, event )
							if not event.interrupted then
								ScoreInfoPanelTimerInternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
							ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
							ScoreInfoPanelTimerInternal0:setRGB( 0.88, 0.46, 0.48 )
							if event.interrupted then
								self.clipFinished( ScoreInfoPanelTimerInternal0, event )
							else
								ScoreInfoPanelTimerInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ScoreInfoPanelTimerInternal0Frame4( ScoreInfoPanelTimerInternal0, event )
							return 
						else
							ScoreInfoPanelTimerInternal0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							ScoreInfoPanelTimerInternal0:setRGB( 0.88, 0.46, 0.48 )
							ScoreInfoPanelTimerInternal0:registerEventHandler( "transition_complete_keyframe", ScoreInfoPanelTimerInternal0Frame4 )
						end
					end
					
					if event.interrupted then
						ScoreInfoPanelTimerInternal0Frame3( ScoreInfoPanelTimerInternal0, event )
						return 
					else
						ScoreInfoPanelTimerInternal0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						ScoreInfoPanelTimerInternal0:registerEventHandler( "transition_complete_keyframe", ScoreInfoPanelTimerInternal0Frame3 )
					end
				end
				
				ScoreInfoPanelTimerInternal0:completeAnimation()
				self.ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
				self.ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
				self.ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
				ScoreInfoPanelTimerInternal0Frame2( ScoreInfoPanelTimerInternal0, {} )

				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local ScoreInfoPanelTimerInternal0Frame2 = function ( ScoreInfoPanelTimerInternal0, event )
					if not event.interrupted then
						ScoreInfoPanelTimerInternal0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
					ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 486, 526 )
					ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
					if event.interrupted then
						self.clipFinished( ScoreInfoPanelTimerInternal0, event )
					else
						ScoreInfoPanelTimerInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreInfoPanelTimerInternal0:completeAnimation()
				self.ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 0, 64 )
				self.ScoreInfoPanelTimerInternal0:setTopBottom( true, false, 0, 40 )
				self.ScoreInfoPanelTimerInternal0:setRGB( 0.55, 0.58, 0.6 )
				ScoreInfoPanelTimerInternal0Frame2( ScoreInfoPanelTimerInternal0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreInfoPanelTimerInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
