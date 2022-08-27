-- 63e0daa264b2c1105ecb3b2562519951
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.timerframeblur" )
require( "ui.uieditor.widgets.HUD.Outcome.Outcome_title_PnlLine" )
require( "ui.uieditor.widgets.Freerun.FR_NewBestTime" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if not f1_arg0.totalPenalty then
		f1_arg0.totalPenalty = 0
	end
	if f1_arg0.totalPenalty == 0 then
		f1_arg0.totalPenalty = f1_arg0.totalPenalty + f1_arg3
		PlayClip( f1_arg0, "PenaltyStart", f1_arg1 )
		f1_arg0:registerEventHandler( "clip_over", function ( element, event )
			element:registerEventHandler( "clip_over", CoD.NullFunction )
			PlayClip( element, "PenaltyDuration", f1_arg1 )
			element:registerEventHandler( "clip_over", function ( element, event )
				element:registerEventHandler( "clip_over", CoD.NullFunction )
				element.bulletPenaltyStarted = false
				PlayClip( element, "PenaltyEnd", f1_arg1 )
			end )
		end )
	else
		f1_arg0.totalPenalty = f1_arg0.totalPenalty + f1_arg3
		PlayClip( f1_arg0, "PenaltyDuration", f1_arg1 )
		f1_arg0:registerEventHandler( "clip_over", function ( element, event )
			element:registerEventHandler( "clip_over", CoD.NullFunction )
			PlayClip( element, "PenaltyEnd", f1_arg1 )
			element:registerEventHandler( "clip_over", function ( element, event )
				element:registerEventHandler( "clip_over", CoD.NullFunction )
				element.totalPenalty = 0
			end )
		end )
	end
	f1_arg0.PenaltyText:setText( Engine.Localize( "MENU_PENALTY_TIME", tostring( f1_arg0.totalPenalty ) ) )
end

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToGlobalModel( controller, "FreeRun", "freeRunInfo.retries", function ( model )
		if Engine.GetModelValue( model ) > 0 then
			f0_local0( self, controller, menu, 5 )
		end
	end )
	self:subscribeToGlobalModel( controller, "FreeRun", "freeRunInfo.bulletPenalty", function ( model )
		if Engine.GetModelValue( model ) > 0 then
			f0_local0( self, controller, menu, 1 )
		end
	end )
end

CoD.FR_TimerWidget = InheritFrom( LUI.UIElement )
CoD.FR_TimerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FR_TimerWidget )
	self.id = "FR_TimerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 151 )
	self.anyChildUsesUpdateState = true
	
	local timerframeblur = CoD.timerframeblur.new( menu, controller )
	timerframeblur:setLeftRight( true, false, 0, 234.75 )
	timerframeblur:setTopBottom( true, false, 3.83, 66.43 )
	timerframeblur:setRGB( 0.73, 0.73, 0.73 )
	self:addElement( timerframeblur )
	self.timerframeblur = timerframeblur
	
	local TimerTextBox = LUI.UIText.new()
	TimerTextBox:setLeftRight( true, false, 49, 186 )
	TimerTextBox:setTopBottom( true, false, 11.81, 58.44 )
	TimerTextBox:setRGB( 1, 0.86, 0 )
	TimerTextBox:setTTF( "fonts/escom.ttf" )
	TimerTextBox:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TimerTextBox:setShaderVector( 0, 0, 0, 0, 0 )
	TimerTextBox:setShaderVector( 1, 0, 0, 0, 0 )
	TimerTextBox:setShaderVector( 2, 1, 0, 0, 0 )
	TimerTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TimerTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TimerTextBox:linkToElementModel( self, "currentTime", true, function ( model )
		local currentTime = Engine.GetModelValue( model )
		if currentTime then
			TimerTextBox:setText( Engine.Localize( NumberAsTime( currentTime ) ) )
		end
	end )
	self:addElement( TimerTextBox )
	self.TimerTextBox = TimerTextBox
	
	local PenaltyBox = LUI.UIImage.new()
	PenaltyBox:setLeftRight( true, false, -8, 246.5 )
	PenaltyBox:setTopBottom( true, false, 63.88, 122.55 )
	PenaltyBox:setRGB( 1, 0, 0 )
	PenaltyBox:setAlpha( 0 )
	PenaltyBox:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_02" ) )
	self:addElement( PenaltyBox )
	self.PenaltyBox = PenaltyBox
	
	local PenaltyText = LUI.UIText.new()
	PenaltyText:setLeftRight( true, false, 0, 234.75 )
	PenaltyText:setTopBottom( true, false, 67.43, 88.21 )
	PenaltyText:setAlpha( 0 )
	PenaltyText:setText( Engine.Localize( "PENALTY +1 SEC" ) )
	PenaltyText:setTTF( "fonts/escom.ttf" )
	PenaltyText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	PenaltyText:setShaderVector( 0, 0, 0, 0, 0 )
	PenaltyText:setShaderVector( 1, 0, 0, 0, 0 )
	PenaltyText:setShaderVector( 2, 1, 0, 0, 0 )
	PenaltyText:setLetterSpacing( 1 )
	PenaltyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PenaltyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PenaltyText )
	self.PenaltyText = PenaltyText
	
	local FaultText = LUI.UIText.new()
	FaultText:setLeftRight( true, false, 51, 184 )
	FaultText:setTopBottom( true, false, 60.88, 85.88 )
	FaultText:setRGB( 1, 0, 0 )
	FaultText:setAlpha( 0 )
	FaultText:setText( Engine.Localize( "+00:05:000" ) )
	FaultText:setTTF( "fonts/escom.ttf" )
	FaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FaultText )
	self.FaultText = FaultText
	
	local OutcometitlePnlLineRight = CoD.Outcome_title_PnlLine.new( menu, controller )
	OutcometitlePnlLineRight:setLeftRight( false, true, 0, 23 )
	OutcometitlePnlLineRight:setTopBottom( true, false, 0.43, 69.88 )
	OutcometitlePnlLineRight:setRGB( 0.73, 0.73, 0.73 )
	OutcometitlePnlLineRight:setScale( 1.1 )
	self:addElement( OutcometitlePnlLineRight )
	self.OutcometitlePnlLineRight = OutcometitlePnlLineRight
	
	local OutcometitlePnlLine0 = CoD.Outcome_title_PnlLine.new( menu, controller )
	OutcometitlePnlLine0:setLeftRight( false, true, -258, -235 )
	OutcometitlePnlLine0:setTopBottom( true, false, 0.43, 69.88 )
	OutcometitlePnlLine0:setRGB( 0.73, 0.73, 0.73 )
	OutcometitlePnlLine0:setScale( 1.1 )
	self:addElement( OutcometitlePnlLine0 )
	self.OutcometitlePnlLine0 = OutcometitlePnlLine0
	
	local FRNewBestTime = CoD.FR_NewBestTime.new( menu, controller )
	FRNewBestTime:setLeftRight( true, false, 16, 220 )
	FRNewBestTime:setTopBottom( true, false, 63.43, 134 )
	self:addElement( FRNewBestTime )
	self.FRNewBestTime = FRNewBestTime
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Penalty = function ()
				self:setupElementClipCounter( 2 )
				local TimerTextBoxFrame2 = function ( TimerTextBox, event )
					local TimerTextBoxFrame3 = function ( TimerTextBox, event )
						local TimerTextBoxFrame4 = function ( TimerTextBox, event )
							if not event.interrupted then
								TimerTextBox:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							TimerTextBox:setRGB( 1, 0.86, 0 )
							if event.interrupted then
								self.clipFinished( TimerTextBox, event )
							else
								TimerTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TimerTextBoxFrame4( TimerTextBox, event )
							return 
						else
							TimerTextBox:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
							TimerTextBox:registerEventHandler( "transition_complete_keyframe", TimerTextBoxFrame4 )
						end
					end
					
					if event.interrupted then
						TimerTextBoxFrame3( TimerTextBox, event )
						return 
					else
						TimerTextBox:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TimerTextBox:setRGB( 1, 0, 0 )
						TimerTextBox:registerEventHandler( "transition_complete_keyframe", TimerTextBoxFrame3 )
					end
				end
				
				TimerTextBox:completeAnimation()
				self.TimerTextBox:setRGB( 1, 0.86, 0 )
				TimerTextBoxFrame2( TimerTextBox, {} )
				local FaultTextFrame2 = function ( FaultText, event )
					local FaultTextFrame3 = function ( FaultText, event )
						local FaultTextFrame4 = function ( FaultText, event )
							if not event.interrupted then
								FaultText:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							FaultText:setRGB( 1, 0, 0 )
							FaultText:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FaultText, event )
							else
								FaultText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FaultTextFrame4( FaultText, event )
							return 
						else
							FaultText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							FaultText:registerEventHandler( "transition_complete_keyframe", FaultTextFrame4 )
						end
					end
					
					if event.interrupted then
						FaultTextFrame3( FaultText, event )
						return 
					else
						FaultText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						FaultText:setAlpha( 1 )
						FaultText:registerEventHandler( "transition_complete_keyframe", FaultTextFrame3 )
					end
				end
				
				FaultText:completeAnimation()
				self.FaultText:setRGB( 1, 0, 0 )
				self.FaultText:setAlpha( 0 )
				FaultTextFrame2( FaultText, {} )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			RetryAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			SetCheckpointDelta = function ()
				self:setupElementClipCounter( 0 )
			end,
			Less = function ()
				self:setupElementClipCounter( 0 )
			end,
			More = function ()
				self:setupElementClipCounter( 0 )
			end,
			PenaltyStart = function ()
				self:setupElementClipCounter( 3 )
				local TimerTextBoxFrame2 = function ( TimerTextBox, event )
					if not event.interrupted then
						TimerTextBox:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
					end
					TimerTextBox:setRGB( 1, 0, 0 )
					if event.interrupted then
						self.clipFinished( TimerTextBox, event )
					else
						TimerTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TimerTextBox:completeAnimation()
				self.TimerTextBox:setRGB( 1, 0.86, 0 )
				TimerTextBoxFrame2( TimerTextBox, {} )
				local PenaltyBoxFrame2 = function ( PenaltyBox, event )
					if not event.interrupted then
						PenaltyBox:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
					end
					PenaltyBox:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PenaltyBox, event )
					else
						PenaltyBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PenaltyBox:completeAnimation()
				self.PenaltyBox:setAlpha( 0 )
				PenaltyBoxFrame2( PenaltyBox, {} )
				local PenaltyTextFrame2 = function ( PenaltyText, event )
					if not event.interrupted then
						PenaltyText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
					end
					PenaltyText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PenaltyText, event )
					else
						PenaltyText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PenaltyText:completeAnimation()
				self.PenaltyText:setAlpha( 0 )
				PenaltyTextFrame2( PenaltyText, {} )
			end,
			PenaltyDuration = function ()
				self:setupElementClipCounter( 3 )
				local TimerTextBoxFrame2 = function ( TimerTextBox, event )
					if not event.interrupted then
						TimerTextBox:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					TimerTextBox:setRGB( 1, 0, 0 )
					if event.interrupted then
						self.clipFinished( TimerTextBox, event )
					else
						TimerTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TimerTextBox:completeAnimation()
				self.TimerTextBox:setRGB( 1, 0, 0 )
				TimerTextBoxFrame2( TimerTextBox, {} )
				local PenaltyBoxFrame2 = function ( PenaltyBox, event )
					if not event.interrupted then
						PenaltyBox:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					PenaltyBox:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PenaltyBox, event )
					else
						PenaltyBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PenaltyBox:completeAnimation()
				self.PenaltyBox:setAlpha( 1 )
				PenaltyBoxFrame2( PenaltyBox, {} )
				local PenaltyTextFrame2 = function ( PenaltyText, event )
					if not event.interrupted then
						PenaltyText:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					PenaltyText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PenaltyText, event )
					else
						PenaltyText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PenaltyText:completeAnimation()
				self.PenaltyText:setAlpha( 1 )
				PenaltyTextFrame2( PenaltyText, {} )
			end,
			PenaltyEnd = function ()
				self:setupElementClipCounter( 3 )
				local TimerTextBoxFrame2 = function ( TimerTextBox, event )
					if not event.interrupted then
						TimerTextBox:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
					end
					TimerTextBox:setRGB( 1, 0.86, 0 )
					if event.interrupted then
						self.clipFinished( TimerTextBox, event )
					else
						TimerTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TimerTextBox:completeAnimation()
				self.TimerTextBox:setRGB( 1, 0, 0 )
				TimerTextBoxFrame2( TimerTextBox, {} )
				local PenaltyBoxFrame2 = function ( PenaltyBox, event )
					if not event.interrupted then
						PenaltyBox:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
					end
					PenaltyBox:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PenaltyBox, event )
					else
						PenaltyBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PenaltyBox:completeAnimation()
				self.PenaltyBox:setAlpha( 1 )
				PenaltyBoxFrame2( PenaltyBox, {} )
				local PenaltyTextFrame2 = function ( PenaltyText, event )
					if not event.interrupted then
						PenaltyText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
					end
					PenaltyText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PenaltyText, event )
					else
						PenaltyText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PenaltyText:completeAnimation()
				self.PenaltyText:setAlpha( 1 )
				PenaltyTextFrame2( PenaltyText, {} )
			end,
			NotRunning = function ()
				self:setupElementClipCounter( 2 )
				PenaltyBox:completeAnimation()
				self.PenaltyBox:setAlpha( 0 )
				self.clipFinished( PenaltyBox, {} )
				PenaltyText:completeAnimation()
				self.PenaltyText:setAlpha( 0 )
				self.clipFinished( PenaltyText, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "FreeRun.timer.timeAdjustment", function ( model )
		local f38_local0 = self
		if IsModelValueGreaterThanOrEqualTo( controller, "FreeRun.timer.timeAdjustment", 0 ) and IsModelValueEqualTo( controller, "FreeRun.timer.timeAdjustmentNegative", 0 ) and ShouldShowFreerunTimeClips( controller ) then
			PlayClip( self, "More", controller )
		elseif IsModelValueGreaterThanOrEqualTo( controller, "FreeRun.timer.timeAdjustment", 0 ) and not IsModelValueEqualTo( controller, "FreeRun.timer.timeAdjustmentNegative", 0 ) and ShouldShowFreerunTimeClips( controller ) then
			PlayClip( self, "Less", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "PerController", "FreeRun.runState", function ( model )
		local f39_local0 = self
		if not IsModelValueEqualTo( controller, "FreeRun.runState", 1 ) then
			PlayClip( self, "NotRunning", controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.timerframeblur:close()
		element.OutcometitlePnlLineRight:close()
		element.OutcometitlePnlLine0:close()
		element.FRNewBestTime:close()
		element.TimerTextBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

