CoD.S2Round = InheritFrom( LUI.UIElement )
CoD.S2Round.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2Round )
	self.id = "S2Round"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.RoundsTextShadow = LUI.UIText.new()
	self.RoundsTextShadow:setLeftRight( true, false, -1.5, 98.5 )
	self.RoundsTextShadow:setTopBottom( true, false, 31.5, 101.5 )
	self.RoundsTextShadow:setTTF( "fonts/harbour_regular.ttf" )
	self.RoundsTextShadow:setText( Engine.Localize( "" ) )
	self.RoundsTextShadow:setRGB( 0.11, 0.11, 0.11 )
	self.RoundsTextShadow:setScale( 0.5 )
	self.RoundsTextShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.RoundsTextShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			self.RoundsTextShadow:setText( Engine.Localize( roundsPlayed - 1 ) )
		end
	end )
	self:addElement( self.RoundsTextShadow )

	self.RoundsText = LUI.UIText.new()
	self.RoundsText:setLeftRight( true, false, 0, 100 )
	self.RoundsText:setTopBottom( true, false, 30, 100 )
	self.RoundsText:setTTF( "fonts/harbour_regular.ttf" )
	self.RoundsText:setText( Engine.Localize( "" ) )
	self.RoundsText:setRGB( 0.89, 0.87, 0.76 )
	self.RoundsText:setScale( 0.5 )
	self.RoundsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.RoundsText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			self.RoundsText:setText( Engine.Localize( roundsPlayed - 1 ) )
		end
	end )
	self:addElement( self.RoundsText )

	self.WaveCompletedShadow = LUI.UIText.new()
	self.WaveCompletedShadow:setLeftRight( true, true, self.RoundsText:getTextWidth() - 321.5, 0 )
	self.WaveCompletedShadow:setTopBottom( true, false, 31.5, 101.5 )
	self.WaveCompletedShadow:setTTF( "fonts/harbour_regular.ttf" )
	self.WaveCompletedShadow:setText( "WAVE COMPLETED" )
	self.WaveCompletedShadow:setRGB( 0.11, 0.11, 0.11 )
	self.WaveCompletedShadow:setScale( 0.5 )
	self.WaveCompletedShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.WaveCompletedShadow )

	self.WaveCompleted = LUI.UIText.new()
	self.WaveCompleted:setLeftRight( true, true, self.RoundsText:getTextWidth() - 320, 0 )
	self.WaveCompleted:setTopBottom( true, false, 30, 100 )
	self.WaveCompleted:setTTF( "fonts/harbour_regular.ttf" )
	self.WaveCompleted:setText( "WAVE COMPLETED" )
	self.WaveCompleted:setRGB( 0.69, 0.06, 0.05 )
	self.WaveCompleted:setScale( 0.5 )
	self.WaveCompleted:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.WaveCompleted )

	self.NextWaveShadow = LUI.UIText.new()
	self.NextWaveShadow:setLeftRight( true, true, self.RoundsText:getTextWidth() - 320.5, 0 )
	self.NextWaveShadow:setTopBottom( true, false, 70.5, 105.5 )
	self.NextWaveShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.NextWaveShadow:setText( "Next wave in 10s" )
	self.NextWaveShadow:setRGB( 0.11, 0.11, 0.11 )
	self.NextWaveShadow:setScale( 0.5 )
	self.NextWaveShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.NextWaveShadow )
	
	self.NextWave = LUI.UIText.new()
	self.NextWave:setLeftRight( true, true, self.RoundsText:getTextWidth() - 320, 0 )
	self.NextWave:setTopBottom( true, false, 70, 105 )
	self.NextWave:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.NextWave:setText( "Next wave in 10s" )
	self.NextWave:setRGB( 0.69, 0.06, 0.05 )
	self.NextWave:setScale( 0.5 )
	self.NextWave:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.NextWave )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				self.RoundsTextShadow:completeAnimation()
				self.RoundsTextShadow:setAlpha( 1 )
				self.clipFinished( self.RoundsTextShadow, {} )

				self.RoundsText:completeAnimation()
				self.RoundsText:setAlpha( 1 )
				self.clipFinished( self.RoundsText, {} )

				self.WaveCompletedShadow:completeAnimation()
				self.WaveCompletedShadow:setAlpha( 0 )
				self.clipFinished( self.WaveCompletedShadow, {} )

				self.WaveCompleted:completeAnimation()
				self.WaveCompleted:setAlpha( 0 )
				self.clipFinished( self.WaveCompleted, {} )

				self.NextWaveShadow:completeAnimation()
				self.NextWaveShadow:setAlpha( 0 )
				self.clipFinished( self.NextWaveShadow, {} )

				self.NextWave:completeAnimation()
				self.NextWave:setAlpha( 0 )
				self.clipFinished( self.NextWave, {} )
			end,
			Invisible = function ()
				self:setupElementClipCounter( 2 )

				local InvisibleStateTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.RoundsTextShadow:completeAnimation()
				self.RoundsTextShadow:setAlpha( 1 )
				InvisibleStateTransition( self.RoundsTextShadow, {} )

				self.RoundsText:completeAnimation()
				self.RoundsText:setAlpha( 1 )
				InvisibleStateTransition( self.RoundsText, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 4 )

				local RoundsTransitionStage11 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end

					if string.find( element:getText(), "Next wave in" ) then
						element:setText( "Next wave in 0s" )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local RoundsTransitionStage10 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage11( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 1s" )
						end

						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage11 )
					end
				end

				local RoundsTransitionStage9 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage10( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 2s" )
						end

						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage10 )
					end
				end

				local RoundsTransitionStage8 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage9( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 3s" )
						end

						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage9 )
					end
				end

				local RoundsTransitionStage7 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage8( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 4s" )
						end

						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage8 )
					end
				end

				local RoundsTransitionStage6 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage7( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 5s" )
						end

						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage7 )
					end
				end

				local RoundsTransitionStage5 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage6( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 6s" )
						end
						
						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage6 )
					end
				end

				local RoundsTransitionStage4 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage5( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 7s" )
						end

						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage5 )
					end
				end

				local RoundsTransitionStage3 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage4( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 8s" )
						end

						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage4 )
					end
				end

				local RoundsTransitionStage2 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 9s" )
						end
						
						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage3 )
					end
				end

				local RoundsTransitionStage1 = function ( element, event )
					if event.interrupted then
						RoundsTransitionStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						if string.find( element:getText(), "Next wave in" ) then
							element:setText( "Next wave in 10s" )
						end
						
						element:setAlpha( 1 )
						
						element:registerEventHandler( "transition_complete_keyframe", RoundsTransitionStage2 )
					end
				end

				self.WaveCompletedShadow:completeAnimation()
				self.WaveCompletedShadow:setAlpha( 0 )
				RoundsTransitionStage1( self.WaveCompletedShadow, {} )

				self.WaveCompleted:completeAnimation()
				self.WaveCompleted:setAlpha( 0 )
				RoundsTransitionStage1( self.WaveCompleted, {} )

				self.NextWaveShadow:completeAnimation()
				self.NextWaveShadow:setAlpha( 0 )
				RoundsTransitionStage1( self.NextWaveShadow, {} )

				self.NextWave:completeAnimation()
				self.NextWave:setAlpha( 0 )
				RoundsTransitionStage1( self.NextWave, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				self.RoundsTextShadow:completeAnimation()
				self.RoundsTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundsTextShadow, {} )

				self.RoundsText:completeAnimation()
				self.RoundsText:setAlpha( 0 )
				self.clipFinished( self.RoundsText, {} )

				self.WaveCompletedShadow:completeAnimation()
				self.WaveCompletedShadow:setAlpha( 0 )
				self.clipFinished( self.WaveCompletedShadow, {} )

				self.WaveCompleted:completeAnimation()
				self.WaveCompleted:setAlpha( 0 )
				self.clipFinished( self.WaveCompleted, {} )

				self.NextWaveShadow:completeAnimation()
				self.NextWaveShadow:setAlpha( 0 )
				self.clipFinished( self.NextWaveShadow, {} )

				self.NextWave:completeAnimation()
				self.NextWave:setAlpha( 0 )
				self.clipFinished( self.NextWave, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )

				local DefaultStateTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.RoundsTextShadow:completeAnimation()
				self.RoundsTextShadow:setAlpha( 0 )
				DefaultStateTransition( self.RoundsTextShadow, {} )

				self.RoundsText:completeAnimation()
				self.RoundsText:setAlpha( 0 )
				DefaultStateTransition( self.RoundsText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				if IsModelValueTrue( controller, "hudItems.playerSpawned" ) then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
					and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						return false
					else
						return true
					end
				end
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )

	self:subscribeToGlobalModel( controller, "PerController", "gameScore.roundsPlayed", function ( model )
		PlayClip( self, "Update", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RoundsTextShadow:close()
		element.RoundsText:close()
		element.WaveCompletedShadow:close()
		element.WaveCompleted:close()
		element.NextWaveShadow:close()
		element.NextWave:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
