require( "ui.uieditor.widgets.buttonprompt_small" )

local GetTimerText = function ( milliseconds )
	local minutes = math.floor( milliseconds / 60000 )
	local seconds = math.floor( (milliseconds - minutes * 60000) / 1000 )
	local msText = milliseconds % 1000
	if seconds < 10 then
		seconds = "0" .. seconds
	end
	if msText < 10 then
		msText = "00" .. msText
	elseif msText < 100 then
		msText = "0" .. msText
	end
	return minutes .. ":" .. seconds .. "." .. msText
end

local ShowHighScores = function ( self, controller )
	local firstPlaceTime = Engine.GetModelValue( self:getModel( controller, "bestTime0" ) )
	local secondPlaceTime = Engine.GetModelValue( self:getModel( controller, "bestTime1" ) )
	local thirdPlaceTime = Engine.GetModelValue( self:getModel( controller, "bestTime2" ) )
	local finishTime = Engine.GetModelValue( self:getModel( controller, "finishTime" ) )
	if firstPlaceTime ~= nil and firstPlaceTime ~= 0 then
		self.HighScoresTextFirst:setAlpha( 1 )
		self.HighScoresTextFirst:setText( "1) " .. GetTimerText( firstPlaceTime ) )
	end
	if secondPlaceTime ~= nil and secondPlaceTime ~= 0 then
		self.HighScoresTextSecond:setAlpha( 1 )
		self.HighScoresTextSecond:setText( "2) " .. GetTimerText( secondPlaceTime ) )
	end
	if thirdPlaceTime ~= nil and thirdPlaceTime ~= 0 then
		self.HighScoresTextThird:setAlpha( 1 )
		self.HighScoresTextThird:setText( "3) " .. GetTimerText( thirdPlaceTime ) )
	end
	if finishTime ~= nil and finishTime ~= 0 then
		self.BestTimeDeltaText:setAlpha( 1 )
		if finishTime == firstPlaceTime then
			self.BestTimeDeltaText:setRGB( 1, 1, 1 )
			self.BestTimeDeltaText:setText( "+0:00:000" )
		else
			self.BestTimeDeltaText:setRGB( 1, 0, 0 )
			self.BestTimeDeltaText:setText( "+" .. GetTimerText( finishTime - firstPlaceTime ) )
		end
	end
end

local PostLoadFunc = function ( self, controller )
	self:addElement( LUI.UITimer.new( 1, "update_game_timer", false ) )
	self:registerEventHandler( "update_game_timer", function ( self, event )
		local startTimeModel = self.TimerTextBox:getModel( controller, "startTime" )
		local runStateModel = self.TimerTextBox:getModel( controller, "runState" )
		if startTimeModel and runStateModel then
			local startTime = Engine.GetModelValue( startTimeModel )
			local runState = Engine.GetModelValue( runStateModel )
			if startTime ~= nil and startTime ~= 0 then
				if runState == 1 then
					local currentTime = Engine.CurrentGameTime()
					local deltaTime = currentTime - startTime
					if deltaTime < 0 then
						deltaTime = 0
					end
					self.TimerTextBox:setText( GetTimerText( deltaTime ) )
				elseif runState == 2 then
					local finishTimeModel = self.TimerTextBox:getModel( controller, "finishTime" )
					if finishTimeModel then
						local finishTime = Engine.GetModelValue( finishTimeModel )
						self.TimerTextBox:setText( GetTimerText( finishTime ) )
					end
				end
			end
		end
	end )
	local bestTimeModel = self.BestTimeValueText:getModel( controller, "bestTime0" )
	if bestTimeModel then
		self:subscribeToModel( bestTimeModel, function ( model )
			local bestTime = Engine.GetModelValue( model )
			if bestTime ~= nil then
				if bestTime > 0 then
					self.BestTimeText:setAlpha( 1 )
					self.BestTimeValueText:setText( GetTimerText( bestTime ) )
					self.HighScoresTextFirst:setAlpha( 1 )
					self.HighScoresTextFirst:setText( "1) " .. GetTimerText( bestTime ) )
				else
					self.BestTimeValueText:setText( "" )
					self.BestTimeText:setAlpha( 0 )
					self.HighScoresTextFirst:setAlpha( 0 )
				end
			end
		end )
	end
	local secondBestTimeModel = self.BestTimeValueText:getModel( controller, "bestTime1" )
	if secondBestTimeModel then
		self:subscribeToModel( secondBestTimeModel, function ( model )
			local bestTime = Engine.GetModelValue( model )
			if bestTime ~= nil then
				if bestTime > 0 then
					self.HighScoresTextSecond:setAlpha( 1 )
					self.HighScoresTextSecond:setText( "2) " .. GetTimerText( bestTime ) )
				else
					self.HighScoresTextSecond:setText( "" )
					self.HighScoresTextSecond:setAlpha( 0 )
				end
			end
		end )
	end
	local thirdBestTimeModel = self.BestTimeValueText:getModel( controller, "bestTime2" )
	if thirdBestTimeModel then
		self:subscribeToModel( thirdBestTimeModel, function ( model )
			local bestTime = Engine.GetModelValue( model )
			if bestTime ~= nil then
				if bestTime > 0 then
					self.HighScoresTextThird:setAlpha( 1 )
					self.HighScoresTextThird:setText( "3) " .. GetTimerText( bestTime ) )
				else
					self.HighScoresTextThird:setText( "" )
					self.HighScoresTextThird:setAlpha( 0 )
				end
			end
		end )
	end
	local faultsModel = self.FaultsTextBox:getModel( controller, "numFaults" )
	if faultsModel then
		self:subscribeToModel( faultsModel, function ( model )
			local faults = Engine.GetModelValue( model )
			if faults ~= nil and faults > 0 then
				self:playClip( "FaultAnim" )
			end
		end )
	end
	local retryModel = self.FaultsTextBox:getModel( controller, "numRetries" )
	if retryModel then
		self:subscribeToModel( retryModel, function ( model )
			local faults = Engine.GetModelValue( model )
			if faults ~= nil and faults > 0 then
				self:playClip( "RetryAnim" )
			end
		end )
	end
	local runState = self:getModel( controller, "runState" )
	if runState then
		self:subscribeToModel( runState, function ( model )
			local state = Engine.GetModelValue( model )
			if state ~= nil then
				if state == 0 then
					self.HighScoresTextFirst:setAlpha( 0 )
					self.HighScoresTextSecond:setAlpha( 0 )
					self.HighScoresTextThird:setAlpha( 0 )
					self.BestTimeDeltaText:setAlpha( 0 )
					self.TimerTextBox:setText( "0:00.000" )
				elseif state == 1 then
					self.HighScoresTextFirst:setAlpha( 0 )
					self.HighScoresTextSecond:setAlpha( 0 )
					self.HighScoresTextThird:setAlpha( 0 )
					self.BestTimeDeltaText:setAlpha( 0 )
				elseif state == 2 then
					ShowHighScores( self, controller )
				end
			end
		end )
	end
	local bestTimeDeltaModel = self:getModel( controller, "bestTimeDelta" )
	if bestTimeDeltaModel then
		self:subscribeToModel( bestTimeDeltaModel, function ( model )
			local bestTimeDelta = Engine.GetModelValue( model )
			self.BestTimeDeltaText:setAlpha( 1 )
			self:playClip( "SetCheckpointDelta" )
			if bestTimeDelta == 0 then
				self.BestTimeDeltaText:setRGB( 1, 1, 1 )
				self.BestTimeDeltaText:setText( "+" .. GetTimerText( bestTimeDelta ) )
			elseif bestTimeDelta < 0 then
				bestTimeDelta = bestTimeDelta * -1
				self.BestTimeDeltaText:setRGB( 0, 1, 0 )
				self.BestTimeDeltaText:setText( "-" .. GetTimerText( bestTimeDelta ) )
			else
				self.BestTimeDeltaText:setRGB( 1, 0, 0 )
				self.BestTimeDeltaText:setText( "+" .. GetTimerText( bestTimeDelta ) )
			end
		end )
	end
	local leaderboardData = Engine.GetLeaderboardData( controller )
	if leaderboardData == nil or #leaderboardData == 0 then
		DebugPrint( "lui: leaderboardviewlist.lua, no leaderboard data" )
	end
	Engine.LoadLeaderboard( "LB_MP_GM_FR_TRACK_B", Enum.LbTrackType.LB_TRK_ALLTIME )
	Engine.RequestLeaderboardData( controller, CoD.LB_FILTER_NONE )
end

LUI.createMenu.T7Hud_FR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_FR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local TimerTextBox = LUI.UIText.new()
	TimerTextBox:setLeftRight( true, false, 512, 768 )
	TimerTextBox:setTopBottom( true, false, 74.5, 131.5 )
	TimerTextBox:setRGB( 1, 1, 1 )
	TimerTextBox:setText( Engine.Localize( "0:00.000" ) )
	TimerTextBox:setTTF( "fonts/default.ttf" )
	TimerTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimerTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimerTextBox )
	self.TimerTextBox = TimerTextBox
	
	local FaultsTextBox = LUI.UIText.new()
	FaultsTextBox:setLeftRight( true, false, 64, 640 )
	FaultsTextBox:setTopBottom( true, false, 244.15, 270.65 )
	FaultsTextBox:setRGB( 1, 1, 1 )
	FaultsTextBox:setText( Engine.Localize( "OBJECTIVES_FR_FAULTS" ) )
	FaultsTextBox:setTTF( "fonts/default.ttf" )
	FaultsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FaultsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( FaultsTextBox )
	self.FaultsTextBox = FaultsTextBox
	
	local RetriesTextBox = LUI.UIText.new()
	RetriesTextBox:setLeftRight( true, false, 64, 542 )
	RetriesTextBox:setTopBottom( true, false, 270.65, 297.15 )
	RetriesTextBox:setRGB( 1, 1, 1 )
	RetriesTextBox:setText( Engine.Localize( "OBJECTIVES_FR_RETRIES" ) )
	RetriesTextBox:setTTF( "fonts/default.ttf" )
	RetriesTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RetriesTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( RetriesTextBox )
	self.RetriesTextBox = RetriesTextBox
	
	local BestTimeValueText = LUI.UIText.new()
	BestTimeValueText:setLeftRight( true, false, 137, 245 )
	BestTimeValueText:setTopBottom( true, false, 217.65, 244.15 )
	BestTimeValueText:setRGB( 1, 1, 1 )
	BestTimeValueText:setText( Engine.Localize( "0:00.000" ) )
	BestTimeValueText:setTTF( "fonts/default.ttf" )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTimeValueText )
	self.BestTimeValueText = BestTimeValueText
	
	local BestTimeText = LUI.UIText.new()
	BestTimeText:setLeftRight( true, false, 64, 137 )
	BestTimeText:setTopBottom( true, false, 217.65, 244.15 )
	BestTimeText:setRGB( 1, 1, 1 )
	BestTimeText:setText( Engine.Localize( "OBJECTIVES_FR_BEST" ) )
	BestTimeText:setTTF( "fonts/default.ttf" )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( BestTimeText )
	self.BestTimeText = BestTimeText
	
	local HighScoresTextFirst = LUI.UIText.new()
	HighScoresTextFirst:setLeftRight( true, false, 532, 748 )
	HighScoresTextFirst:setTopBottom( true, false, 378.7, 428.7 )
	HighScoresTextFirst:setRGB( 1, 1, 1 )
	HighScoresTextFirst:setText( Engine.Localize( "1. 0:00.000" ) )
	HighScoresTextFirst:setTTF( "fonts/default.ttf" )
	HighScoresTextFirst:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HighScoresTextFirst:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HighScoresTextFirst )
	self.HighScoresTextFirst = HighScoresTextFirst
	
	local HighScoresTextSecond = LUI.UIText.new()
	HighScoresTextSecond:setLeftRight( true, false, 532, 748 )
	HighScoresTextSecond:setTopBottom( true, false, 428.7, 478.7 )
	HighScoresTextSecond:setRGB( 1, 1, 1 )
	HighScoresTextSecond:setText( Engine.Localize( "2. 0:00.000" ) )
	HighScoresTextSecond:setTTF( "fonts/default.ttf" )
	HighScoresTextSecond:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HighScoresTextSecond:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HighScoresTextSecond )
	self.HighScoresTextSecond = HighScoresTextSecond
	
	local HighScoresTextThird = LUI.UIText.new()
	HighScoresTextThird:setLeftRight( true, false, 532, 748 )
	HighScoresTextThird:setTopBottom( true, false, 478.7, 528.7 )
	HighScoresTextThird:setRGB( 1, 1, 1 )
	HighScoresTextThird:setText( Engine.Localize( "3. 0:00.000" ) )
	HighScoresTextThird:setTTF( "fonts/default.ttf" )
	HighScoresTextThird:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HighScoresTextThird:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HighScoresTextThird )
	self.HighScoresTextThird = HighScoresTextThird
	
	local BestTimeDeltaText = LUI.UIText.new()
	BestTimeDeltaText:setLeftRight( true, false, 735, 868 )
	BestTimeDeltaText:setTopBottom( true, false, 103, 128.12 )
	BestTimeDeltaText:setRGB( 1, 1, 1 )
	BestTimeDeltaText:setText( Engine.Localize( "00:00.000" ) )
	BestTimeDeltaText:setTTF( "fonts/default.ttf" )
	BestTimeDeltaText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestTimeDeltaText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTimeDeltaText )
	self.BestTimeDeltaText = BestTimeDeltaText
	
	local RestartTrackButtonPrompt = CoD.buttonprompt_small.new( self, controller )
	RestartTrackButtonPrompt:setLeftRight( true, false, 303, 517 )
	RestartTrackButtonPrompt:setTopBottom( true, false, 587.5, 618.5 )
	RestartTrackButtonPrompt:setRGB( 1, 1, 1 )
	RestartTrackButtonPrompt.label:setText( Engine.Localize( "MP_FR_RESTART_TRACK" ) )
	RestartTrackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "dpad_up_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RestartTrackButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RestartTrackButtonPrompt )
	self.RestartTrackButtonPrompt = RestartTrackButtonPrompt
	
	local ChangeTrackButtonPrompt = CoD.buttonprompt_small.new( self, controller )
	ChangeTrackButtonPrompt:setLeftRight( true, false, 303, 517 )
	ChangeTrackButtonPrompt:setTopBottom( true, false, 622, 653 )
	ChangeTrackButtonPrompt:setRGB( 1, 1, 1 )
	ChangeTrackButtonPrompt.label:setText( Engine.Localize( "MP_FR_CHANGE_TRACK" ) )
	ChangeTrackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "dpad_lr_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChangeTrackButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ChangeTrackButtonPrompt )
	self.ChangeTrackButtonPrompt = ChangeTrackButtonPrompt
	
	local RespawnButtonPrompt = CoD.buttonprompt_small.new( self, controller )
	RespawnButtonPrompt:setLeftRight( true, false, 303, 517 )
	RespawnButtonPrompt:setTopBottom( true, false, 653, 684 )
	RespawnButtonPrompt:setRGB( 1, 1, 1 )
	RespawnButtonPrompt.label:setText( Engine.Localize( "MP_FR_RESPAWN_CP" ) )
	RespawnButtonPrompt:subscribeToGlobalModel( controller, "Controller", "dpad_down_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RespawnButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RespawnButtonPrompt )
	self.RespawnButtonPrompt = RespawnButtonPrompt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Penalty = function ()
				self:setupElementClipCounter( 1 )
				local TimerTextBoxFrame2 = function ( TimerTextBox, event )
					local TimerTextBoxFrame3 = function ( TimerTextBox, event )
						if not event.interrupted then
							TimerTextBox:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						TimerTextBox:setLeftRight( true, false, 460, 820 )
						TimerTextBox:setTopBottom( true, false, 56.5, 161.5 )
						TimerTextBox:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( TimerTextBox, event )
						else
							TimerTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TimerTextBoxFrame3( TimerTextBox, event )
						return 
					else
						TimerTextBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						TimerTextBox:setLeftRight( true, false, 446, 834 )
						TimerTextBox:setTopBottom( true, false, 39.5, 178.5 )
						TimerTextBox:registerEventHandler( "transition_complete_keyframe", TimerTextBoxFrame3 )
					end
				end
				
				TimerTextBox:completeAnimation()
				self.TimerTextBox:setLeftRight( true, false, 460, 820 )
				self.TimerTextBox:setTopBottom( true, false, 56.5, 161.5 )
				self.TimerTextBox:setRGB( 1, 0, 0 )
				TimerTextBoxFrame2( TimerTextBox, {} )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 1 )
				local FaultsTextBoxFrame2 = function ( FaultsTextBox, event )
					local FaultsTextBoxFrame3 = function ( FaultsTextBox, event )
						local FaultsTextBoxFrame4 = function ( FaultsTextBox, event )
							if not event.interrupted then
								FaultsTextBox:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							FaultsTextBox:setLeftRight( true, false, 64, 323 )
							FaultsTextBox:setTopBottom( true, false, 244, 270.65 )
							FaultsTextBox:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( FaultsTextBox, event )
							else
								FaultsTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FaultsTextBoxFrame4( FaultsTextBox, event )
							return 
						else
							FaultsTextBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							FaultsTextBox:setLeftRight( true, false, 64, 323 )
							FaultsTextBox:setTopBottom( true, false, 244, 270.65 )
							FaultsTextBox:setRGB( 1, 0.6, 0.6 )
							FaultsTextBox:registerEventHandler( "transition_complete_keyframe", FaultsTextBoxFrame4 )
						end
					end
					
					if event.interrupted then
						FaultsTextBoxFrame3( FaultsTextBox, event )
						return 
					else
						FaultsTextBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FaultsTextBox:setTopBottom( true, false, 240, 274.65 )
						FaultsTextBox:setRGB( 1, 0.2, 0.2 )
						FaultsTextBox:registerEventHandler( "transition_complete_keyframe", FaultsTextBoxFrame3 )
					end
				end
				
				FaultsTextBox:completeAnimation()
				self.FaultsTextBox:setLeftRight( true, false, 64, 640 )
				self.FaultsTextBox:setTopBottom( true, false, 244.15, 270.65 )
				self.FaultsTextBox:setRGB( 1, 0, 0 )
				FaultsTextBoxFrame2( FaultsTextBox, {} )
			end,
			RetryAnim = function ()
				self:setupElementClipCounter( 1 )
				local RetriesTextBoxFrame2 = function ( RetriesTextBox, event )
					local RetriesTextBoxFrame3 = function ( RetriesTextBox, event )
						local RetriesTextBoxFrame4 = function ( RetriesTextBox, event )
							if not event.interrupted then
								RetriesTextBox:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							RetriesTextBox:setLeftRight( true, false, 64, 542 )
							RetriesTextBox:setTopBottom( true, false, 270.65, 297.15 )
							RetriesTextBox:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( RetriesTextBox, event )
							else
								RetriesTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RetriesTextBoxFrame4( RetriesTextBox, event )
							return 
						else
							RetriesTextBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							RetriesTextBox:setTopBottom( true, false, 270.65, 297.15 )
							RetriesTextBox:setRGB( 1, 0.6, 0.6 )
							RetriesTextBox:registerEventHandler( "transition_complete_keyframe", RetriesTextBoxFrame4 )
						end
					end
					
					if event.interrupted then
						RetriesTextBoxFrame3( RetriesTextBox, event )
						return 
					else
						RetriesTextBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						RetriesTextBox:setTopBottom( true, false, 266.65, 301.15 )
						RetriesTextBox:setRGB( 1, 0.2, 0.2 )
						RetriesTextBox:registerEventHandler( "transition_complete_keyframe", RetriesTextBoxFrame3 )
					end
				end
				
				RetriesTextBox:completeAnimation()
				self.RetriesTextBox:setLeftRight( true, false, 64, 542 )
				self.RetriesTextBox:setTopBottom( true, false, 270.65, 297.15 )
				self.RetriesTextBox:setRGB( 1, 0, 0 )
				RetriesTextBoxFrame2( RetriesTextBox, {} )
			end,
			SetCheckpointDelta = function ()
				self:setupElementClipCounter( 1 )
				local BestTimeDeltaTextFrame2 = function ( BestTimeDeltaText, event )
					local BestTimeDeltaTextFrame3 = function ( BestTimeDeltaText, event )
						local BestTimeDeltaTextFrame4 = function ( BestTimeDeltaText, event )
							local BestTimeDeltaTextFrame5 = function ( BestTimeDeltaText, event )
								if not event.interrupted then
									BestTimeDeltaText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								BestTimeDeltaText:setLeftRight( true, false, 735, 868 )
								BestTimeDeltaText:setTopBottom( true, false, 103, 128.12 )
								BestTimeDeltaText:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( BestTimeDeltaText, event )
								else
									BestTimeDeltaText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BestTimeDeltaTextFrame5( BestTimeDeltaText, event )
								return 
							else
								BestTimeDeltaText:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
								BestTimeDeltaText:registerEventHandler( "transition_complete_keyframe", BestTimeDeltaTextFrame5 )
							end
						end
						
						if event.interrupted then
							BestTimeDeltaTextFrame4( BestTimeDeltaText, event )
							return 
						else
							BestTimeDeltaText:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Bounce )
							BestTimeDeltaText:setLeftRight( true, false, 735, 868 )
							BestTimeDeltaText:setTopBottom( true, false, 103, 128.12 )
							BestTimeDeltaText:registerEventHandler( "transition_complete_keyframe", BestTimeDeltaTextFrame4 )
						end
					end
					
					if event.interrupted then
						BestTimeDeltaTextFrame3( BestTimeDeltaText, event )
						return 
					else
						BestTimeDeltaText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						BestTimeDeltaText:setLeftRight( true, false, 729, 874 )
						BestTimeDeltaText:setTopBottom( true, false, 99.62, 131.5 )
						BestTimeDeltaText:registerEventHandler( "transition_complete_keyframe", BestTimeDeltaTextFrame3 )
					end
				end
				
				BestTimeDeltaText:completeAnimation()
				self.BestTimeDeltaText:setLeftRight( true, false, 735, 868 )
				self.BestTimeDeltaText:setTopBottom( true, false, 103, 128.12 )
				self.BestTimeDeltaText:setAlpha( 1 )
				BestTimeDeltaTextFrame2( BestTimeDeltaText, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.RestartTrackButtonPrompt:close()
		self.ChangeTrackButtonPrompt:close()
		self.RespawnButtonPrompt:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

