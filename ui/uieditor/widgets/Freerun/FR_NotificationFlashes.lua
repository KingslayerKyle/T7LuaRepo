-- fe7d1592fbe2de46133f3c74b4810a50
-- This hash is used for caching, delete to decompile the file again

CoD.FR_NotificationFlashes = InheritFrom( LUI.UIElement )
CoD.FR_NotificationFlashes.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.FR_NotificationFlashes )
	self.id = "FR_NotificationFlashes"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 675 )
	self:setTopBottom( true, false, 0, 107 )
	
	local NotificationCheckpoint = LUI.UIImage.new()
	NotificationCheckpoint:setLeftRight( true, true, 0, 0 )
	NotificationCheckpoint:setTopBottom( true, true, 0, 0 )
	NotificationCheckpoint:setAlpha( 0 )
	NotificationCheckpoint:setImage( RegisterImage( "uie_t7_freerun_hud_notification_checkpoint" ) )
	self:addElement( NotificationCheckpoint )
	self.NotificationCheckpoint = NotificationCheckpoint
	
	local NotificationRestart = LUI.UIImage.new()
	NotificationRestart:setLeftRight( true, true, 0, 0 )
	NotificationRestart:setTopBottom( true, true, 0, 0 )
	NotificationRestart:setAlpha( 0 )
	NotificationRestart:setImage( RegisterImage( "uie_t7_freerun_hud_notification_restart" ) )
	self:addElement( NotificationRestart )
	self.NotificationRestart = NotificationRestart
	
	local CheckpointText = LUI.UIText.new()
	CheckpointText:setLeftRight( true, false, 222, 496 )
	CheckpointText:setTopBottom( true, false, 33.54, 81.54 )
	CheckpointText:setRGB( 0, 0, 0 )
	CheckpointText:setAlpha( 0 )
	CheckpointText:setText( Engine.Localize( "CHECKPOINT" ) )
	CheckpointText:setTTF( "fonts/escom.ttf" )
	CheckpointText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CheckpointText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( CheckpointText )
	self.CheckpointText = CheckpointText
	
	local RestartText = LUI.UIText.new()
	RestartText:setLeftRight( true, false, 256.49, 530.49 )
	RestartText:setTopBottom( true, false, 33.54, 81.54 )
	RestartText:setRGB( 0, 0, 0 )
	RestartText:setAlpha( 0 )
	RestartText:setText( Engine.Localize( "RESTART" ) )
	RestartText:setTTF( "fonts/escom.ttf" )
	RestartText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RestartText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( RestartText )
	self.RestartText = RestartText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )

				local NotificationCheckpointFrame2 = function ( NotificationCheckpoint, event )
					local NotificationCheckpointFrame3 = function ( NotificationCheckpoint, event )
						local NotificationCheckpointFrame4 = function ( NotificationCheckpoint, event )
							local NotificationCheckpointFrame5 = function ( NotificationCheckpoint, event )
								if not event.interrupted then
									NotificationCheckpoint:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
								end
								NotificationCheckpoint:setLeftRight( true, true, 0, 0 )
								NotificationCheckpoint:setTopBottom( true, true, 0, 0 )
								NotificationCheckpoint:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( NotificationCheckpoint, event )
								else
									NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotificationCheckpointFrame5( NotificationCheckpoint, event )
								return 
							else
								NotificationCheckpoint:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								NotificationCheckpoint:setLeftRight( true, true, 0, 0 )
								NotificationCheckpoint:setTopBottom( true, true, 0, 0 )
								NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame5 )
							end
						end
						
						if event.interrupted then
							NotificationCheckpointFrame4( NotificationCheckpoint, event )
							return 
						else
							NotificationCheckpoint:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							NotificationCheckpoint:setLeftRight( true, true, 53, -60.33 )
							NotificationCheckpoint:setTopBottom( true, true, 15.83, -15.83 )
							NotificationCheckpoint:setAlpha( 1 )
							NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationCheckpointFrame3( NotificationCheckpoint, event )
						return 
					else
						NotificationCheckpoint:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						NotificationCheckpoint:setAlpha( 0.7 )
						NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame3 )
					end
				end
				
				NotificationCheckpoint:completeAnimation()
				self.NotificationCheckpoint:setLeftRight( true, true, 159, -181 )
				self.NotificationCheckpoint:setTopBottom( true, true, 47.5, -47.5 )
				self.NotificationCheckpoint:setAlpha( 0 )
				NotificationCheckpointFrame2( NotificationCheckpoint, {} )
				local CheckpointTextFrame2 = function ( CheckpointText, event )
					if not event.interrupted then
						CheckpointText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CheckpointText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CheckpointText, event )
					else
						CheckpointText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CheckpointText:completeAnimation()
				self.CheckpointText:setAlpha( 0 )
				CheckpointTextFrame2( CheckpointText, {} )
			end,
			Outro = function ()
				self:setupElementClipCounter( 2 )

				local NotificationCheckpointFrame2 = function ( NotificationCheckpoint, event )
					local NotificationCheckpointFrame3 = function ( NotificationCheckpoint, event )
						if not event.interrupted then
							NotificationCheckpoint:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						NotificationCheckpoint:setLeftRight( true, true, 159, -181 )
						NotificationCheckpoint:setTopBottom( true, true, 47.5, -47.5 )
						NotificationCheckpoint:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( NotificationCheckpoint, event )
						else
							NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NotificationCheckpointFrame3( NotificationCheckpoint, event )
						return 
					else
						NotificationCheckpoint:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						NotificationCheckpoint:setAlpha( 0.5 )
						NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame3 )
					end
				end
				
				NotificationCheckpoint:completeAnimation()
				self.NotificationCheckpoint:setLeftRight( true, true, 0, 0 )
				self.NotificationCheckpoint:setTopBottom( true, true, 0, 0 )
				self.NotificationCheckpoint:setAlpha( 1 )
				NotificationCheckpointFrame2( NotificationCheckpoint, {} )
				local CheckpointTextFrame2 = function ( CheckpointText, event )
					if not event.interrupted then
						CheckpointText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CheckpointText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CheckpointText, event )
					else
						CheckpointText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CheckpointText:completeAnimation()
				self.CheckpointText:setAlpha( 1 )
				CheckpointTextFrame2( CheckpointText, {} )
			end
		},
		Checkpoint = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )

				local NotificationCheckpointFrame2 = function ( NotificationCheckpoint, event )
					local NotificationCheckpointFrame3 = function ( NotificationCheckpoint, event )
						local NotificationCheckpointFrame4 = function ( NotificationCheckpoint, event )
							local NotificationCheckpointFrame5 = function ( NotificationCheckpoint, event )
								if not event.interrupted then
									NotificationCheckpoint:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
								end
								NotificationCheckpoint:setLeftRight( true, true, 0, 0 )
								NotificationCheckpoint:setTopBottom( true, true, 0, 0 )
								NotificationCheckpoint:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( NotificationCheckpoint, event )
								else
									NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotificationCheckpointFrame5( NotificationCheckpoint, event )
								return 
							else
								NotificationCheckpoint:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								NotificationCheckpoint:setLeftRight( true, true, 0, 0 )
								NotificationCheckpoint:setTopBottom( true, true, 0, 0 )
								NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame5 )
							end
						end
						
						if event.interrupted then
							NotificationCheckpointFrame4( NotificationCheckpoint, event )
							return 
						else
							NotificationCheckpoint:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							NotificationCheckpoint:setLeftRight( true, true, 53, -60.33 )
							NotificationCheckpoint:setTopBottom( true, true, 15.83, -15.83 )
							NotificationCheckpoint:setAlpha( 1 )
							NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationCheckpointFrame3( NotificationCheckpoint, event )
						return 
					else
						NotificationCheckpoint:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						NotificationCheckpoint:setAlpha( 0.7 )
						NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame3 )
					end
				end
				
				NotificationCheckpoint:completeAnimation()
				self.NotificationCheckpoint:setLeftRight( true, true, 159, -181 )
				self.NotificationCheckpoint:setTopBottom( true, true, 47.5, -47.5 )
				self.NotificationCheckpoint:setAlpha( 0 )
				NotificationCheckpointFrame2( NotificationCheckpoint, {} )

				NotificationRestart:completeAnimation()
				self.NotificationRestart:setAlpha( 0 )
				self.clipFinished( NotificationRestart, {} )
				local CheckpointTextFrame2 = function ( CheckpointText, event )
					if not event.interrupted then
						CheckpointText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CheckpointText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CheckpointText, event )
					else
						CheckpointText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CheckpointText:completeAnimation()
				self.CheckpointText:setAlpha( 0 )
				CheckpointTextFrame2( CheckpointText, {} )

				RestartText:completeAnimation()
				self.RestartText:setAlpha( 0 )
				self.clipFinished( RestartText, {} )
			end,
			Outro = function ()
				self:setupElementClipCounter( 2 )

				local NotificationCheckpointFrame2 = function ( NotificationCheckpoint, event )
					local NotificationCheckpointFrame3 = function ( NotificationCheckpoint, event )
						if not event.interrupted then
							NotificationCheckpoint:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						NotificationCheckpoint:setLeftRight( true, true, 159, -181 )
						NotificationCheckpoint:setTopBottom( true, true, 47.5, -47.5 )
						NotificationCheckpoint:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( NotificationCheckpoint, event )
						else
							NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NotificationCheckpointFrame3( NotificationCheckpoint, event )
						return 
					else
						NotificationCheckpoint:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						NotificationCheckpoint:setAlpha( 0.5 )
						NotificationCheckpoint:registerEventHandler( "transition_complete_keyframe", NotificationCheckpointFrame3 )
					end
				end
				
				NotificationCheckpoint:completeAnimation()
				self.NotificationCheckpoint:setLeftRight( true, true, 0, 0 )
				self.NotificationCheckpoint:setTopBottom( true, true, 0, 0 )
				self.NotificationCheckpoint:setAlpha( 1 )
				NotificationCheckpointFrame2( NotificationCheckpoint, {} )
				local CheckpointTextFrame2 = function ( CheckpointText, event )
					if not event.interrupted then
						CheckpointText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CheckpointText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CheckpointText, event )
					else
						CheckpointText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CheckpointText:completeAnimation()
				self.CheckpointText:setAlpha( 1 )
				CheckpointTextFrame2( CheckpointText, {} )
			end
		},
		Retry = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )

				NotificationCheckpoint:completeAnimation()
				self.NotificationCheckpoint:setAlpha( 0 )
				self.clipFinished( NotificationCheckpoint, {} )
				local NotificationRestartFrame2 = function ( NotificationRestart, event )
					local NotificationRestartFrame3 = function ( NotificationRestart, event )
						local NotificationRestartFrame4 = function ( NotificationRestart, event )
							local NotificationRestartFrame5 = function ( NotificationRestart, event )
								if not event.interrupted then
									NotificationRestart:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
								end
								NotificationRestart:setLeftRight( true, true, 0, 0 )
								NotificationRestart:setTopBottom( true, true, 0, 0 )
								NotificationRestart:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( NotificationRestart, event )
								else
									NotificationRestart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotificationRestartFrame5( NotificationRestart, event )
								return 
							else
								NotificationRestart:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								NotificationRestart:setLeftRight( true, true, 0, 0 )
								NotificationRestart:setTopBottom( true, true, 0, 0 )
								NotificationRestart:registerEventHandler( "transition_complete_keyframe", NotificationRestartFrame5 )
							end
						end
						
						if event.interrupted then
							NotificationRestartFrame4( NotificationRestart, event )
							return 
						else
							NotificationRestart:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							NotificationRestart:setLeftRight( true, true, 53, -48.17 )
							NotificationRestart:setTopBottom( true, true, 15.83, -15.83 )
							NotificationRestart:setAlpha( 1 )
							NotificationRestart:registerEventHandler( "transition_complete_keyframe", NotificationRestartFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationRestartFrame3( NotificationRestart, event )
						return 
					else
						NotificationRestart:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						NotificationRestart:setAlpha( 0.7 )
						NotificationRestart:registerEventHandler( "transition_complete_keyframe", NotificationRestartFrame3 )
					end
				end
				
				NotificationRestart:completeAnimation()
				self.NotificationRestart:setLeftRight( true, true, 159, -144.51 )
				self.NotificationRestart:setTopBottom( true, true, 47.5, -47.5 )
				self.NotificationRestart:setAlpha( 0 )
				NotificationRestartFrame2( NotificationRestart, {} )

				CheckpointText:completeAnimation()
				self.CheckpointText:setAlpha( 0 )
				self.clipFinished( CheckpointText, {} )
				local RestartTextFrame2 = function ( RestartText, event )
					if not event.interrupted then
						RestartText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RestartText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RestartText, event )
					else
						RestartText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RestartText:completeAnimation()
				self.RestartText:setAlpha( 0 )
				RestartTextFrame2( RestartText, {} )
			end,
			Outro = function ()
				self:setupElementClipCounter( 4 )

				NotificationCheckpoint:completeAnimation()
				self.NotificationCheckpoint:setAlpha( 0 )
				self.clipFinished( NotificationCheckpoint, {} )
				local NotificationRestartFrame2 = function ( NotificationRestart, event )
					local NotificationRestartFrame3 = function ( NotificationRestart, event )
						if not event.interrupted then
							NotificationRestart:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						NotificationRestart:setLeftRight( true, true, 256.49, -144.51 )
						NotificationRestart:setTopBottom( true, true, 33.54, -25.46 )
						NotificationRestart:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( NotificationRestart, event )
						else
							NotificationRestart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NotificationRestartFrame3( NotificationRestart, event )
						return 
					else
						NotificationRestart:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						NotificationRestart:setAlpha( 0.5 )
						NotificationRestart:registerEventHandler( "transition_complete_keyframe", NotificationRestartFrame3 )
					end
				end
				
				NotificationRestart:completeAnimation()
				self.NotificationRestart:setLeftRight( true, true, 0, 0 )
				self.NotificationRestart:setTopBottom( true, true, 0, 0 )
				self.NotificationRestart:setAlpha( 1 )
				NotificationRestartFrame2( NotificationRestart, {} )

				CheckpointText:completeAnimation()
				self.CheckpointText:setAlpha( 0 )
				self.clipFinished( CheckpointText, {} )
				local RestartTextFrame2 = function ( RestartText, event )
					if not event.interrupted then
						RestartText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RestartText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RestartText, event )
					else
						RestartText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RestartText:completeAnimation()
				self.RestartText:setAlpha( 1 )
				RestartTextFrame2( RestartText, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				NotificationCheckpoint:completeAnimation()
				self.NotificationCheckpoint:setAlpha( 0 )
				self.clipFinished( NotificationCheckpoint, {} )

				NotificationRestart:completeAnimation()
				self.NotificationRestart:setAlpha( 0 )
				self.clipFinished( NotificationRestart, {} )

				CheckpointText:completeAnimation()
				self.CheckpointText:setAlpha( 0 )
				self.clipFinished( CheckpointText, {} )

				RestartText:completeAnimation()
				self.RestartText:setAlpha( 0 )
				self.clipFinished( RestartText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Checkpoint",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Retry",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

