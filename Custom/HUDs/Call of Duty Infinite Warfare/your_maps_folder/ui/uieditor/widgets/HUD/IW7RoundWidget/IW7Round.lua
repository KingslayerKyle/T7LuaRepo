local PostLoadFunc = function ( self, controller )
	if CoD.UsermapName then
		self.ClapboardBaseMiddleText:setText( Engine.Localize( string.upper( CoD.UsermapName ) ) )
	end
end

CoD.IW7Round = InheritFrom( LUI.UIElement )
CoD.IW7Round.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7Round )
	self.id = "IW7Round"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ClapboardTopRight = LUI.UIImage.new()
	self.ClapboardTopRight:setLeftRight( false, true, -133, 22 )
	self.ClapboardTopRight:setTopBottom( true, false, 11, 137 )
	self.ClapboardTopRight:setImage( RegisterImage( "clapboard_condensed" ) )
	self:addElement( self.ClapboardTopRight )

	self.SceneTextTopRight = LUI.UIText.new()
	self.SceneTextTopRight:setLeftRight( false, true, -72.5, -62.5 )
	self.SceneTextTopRight:setTopBottom( true, false, 79, 91 )
	self.SceneTextTopRight:setText( Engine.Localize( "SCENE" ) )
	self.SceneTextTopRight:setTTF( "fonts/blender_pro_bold.ttf" )
	self:addElement( self.SceneTextTopRight )

	self.RoundsTextTopRight = LUI.UIText.new()
	self.RoundsTextTopRight:setLeftRight( false, true, -60, -15 )
	self.RoundsTextTopRight:setTopBottom( true, false, 70, 100 )
	self.RoundsTextTopRight:setText( Engine.Localize( "" ) )
	self.RoundsTextTopRight:setTTF( "fonts/blender_pro_bold.ttf" )
	self.RoundsTextTopRight:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.RoundsTextTopRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			self.RoundsTextTopRight:setText( Engine.Localize( roundsPlayed - 1 ) )
		end
	end )
	self:addElement( self.RoundsTextTopRight )

	self.ClapboardArmMiddle = LUI.UIImage.new()
	self.ClapboardArmMiddle:setLeftRight( true, false, 418, 733 )
	self.ClapboardArmMiddle:setTopBottom( true, false, 111, 127 )
	self.ClapboardArmMiddle:setImage( RegisterImage( "clapboard_arm" ) )
	self:addElement( self.ClapboardArmMiddle )

	self.ClapboardBaseMiddle = LUI.UIImage.new()
	self.ClapboardBaseMiddle:setLeftRight( false, false, -80, 80 )
	self.ClapboardBaseMiddle:setTopBottom( true, false, 80, 240 )
	self.ClapboardBaseMiddle:setImage( RegisterImage( "clapboard_base" ) )
	self:addElement( self.ClapboardBaseMiddle )

	self.ClapboardBaseMiddleText = LUI.UIText.new()
	self.ClapboardBaseMiddleText:setLeftRight( false, false, -80, 80 )
	self.ClapboardBaseMiddleText:setTopBottom( true, false, 80 + 100, 95 + 100 )
	self.ClapboardBaseMiddleText:setText( Engine.Localize( "" ) )
	self.ClapboardBaseMiddleText:setTTF( "fonts/zm_clean.ttf" )
	self.ClapboardBaseMiddleText:setRGB( 0.85, 0.16, 0.47 )
	self.ClapboardBaseMiddleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.ClapboardBaseMiddleText )

	self.SceneTextMiddle = LUI.UIText.new()
	self.SceneTextMiddle:setLeftRight( false, false, -75, 0 )
	self.SceneTextMiddle:setTopBottom( true, false, 75, 235 )
	self.SceneTextMiddle:setText( Engine.Localize( "Scene" ) )
	self.SceneTextMiddle:setTTF( "fonts/blender_pro_medium.ttf" )
	self.SceneTextMiddle:setScale( 0.15 )
	self:addElement( self.SceneTextMiddle )

	self.RoundsTextMiddle = LUI.UIText.new()
	self.RoundsTextMiddle:setLeftRight( false, false, -80, 148 )
	self.RoundsTextMiddle:setTopBottom( true, false, 75, 235 )
	self.RoundsTextMiddle:setText( Engine.Localize( "" ) )
	self.RoundsTextMiddle:setTTF( "fonts/blender_pro_medium.ttf" )
	self.RoundsTextMiddle:setScale( 0.33 )
	self.RoundsTextMiddle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.RoundsTextMiddle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			self.RoundsTextMiddle:setText( Engine.Localize( roundsPlayed - 1 ) )
		end
	end )
	self:addElement( self.RoundsTextMiddle )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				self.ClapboardTopRight:completeAnimation()
				self.ClapboardTopRight:setAlpha( 1 )
				self.clipFinished( self.ClapboardTopRight, {} )

				self.SceneTextTopRight:completeAnimation()
				self.SceneTextTopRight:setAlpha( 1 )
				self.clipFinished( self.SceneTextTopRight, {} )

				self.RoundsTextTopRight:completeAnimation()
				self.RoundsTextTopRight:setAlpha( 1 )
				self.clipFinished( self.RoundsTextTopRight, {} )

				self.ClapboardArmMiddle:completeAnimation()
				self.ClapboardArmMiddle:setAlpha( 0 )
				self.clipFinished( self.ClapboardArmMiddle, {} )

				self.ClapboardBaseMiddle:completeAnimation()
				self.ClapboardBaseMiddle:setAlpha( 0 )
				self.clipFinished( self.ClapboardBaseMiddle, {} )

				self.ClapboardBaseMiddleText:completeAnimation()
				self.ClapboardBaseMiddleText:setAlpha( 0 )
				self.clipFinished( self.ClapboardBaseMiddleText, {} )

				self.SceneTextMiddle:completeAnimation()
				self.SceneTextMiddle:setAlpha( 0 )
				self.clipFinished( self.SceneTextMiddle, {} )

				self.RoundsTextMiddle:completeAnimation()
				self.RoundsTextMiddle:setAlpha( 0 )
				self.clipFinished( self.RoundsTextMiddle, {} )
			end,
			Invisible = function ()
				self:setupElementClipCounter( 3 )

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

				self.ClapboardTopRight:completeAnimation()
				self.ClapboardTopRight:setAlpha( 1 )
				InvisibleStateTransition( self.ClapboardTopRight, {} )

				self.SceneTextTopRight:completeAnimation()
				self.SceneTextTopRight:setAlpha( 1 )
				InvisibleStateTransition( self.SceneTextTopRight, {} )

				self.RoundsTextTopRight:completeAnimation()
				self.RoundsTextTopRight:setAlpha( 1 )
				InvisibleStateTransition( self.RoundsTextTopRight, {} )
			end,
			RoundAnim = function ()
				self:setupElementClipCounter( 8 )

				local HideClapboardRoundAnimationStage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local HideClapboardRoundAnimationStage2 = function ( element, event )
					if event.interrupted then
						HideClapboardRoundAnimationStage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0 )

						element:registerEventHandler( "transition_complete_keyframe", HideClapboardRoundAnimationStage3 )
					end
				end

				local HideClapboardRoundAnimationStage1 = function ( element, event )
					if event.interrupted then
						HideClapboardRoundAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0 )

						element:registerEventHandler( "transition_complete_keyframe", HideClapboardRoundAnimationStage2 )
					end
				end

				self.ClapboardTopRight:completeAnimation()
				self.ClapboardTopRight:setAlpha( 1 )
				HideClapboardRoundAnimationStage1( self.ClapboardTopRight, {} )

				self.SceneTextTopRight:completeAnimation()
				self.SceneTextTopRight:setAlpha( 1 )
				HideClapboardRoundAnimationStage1( self.SceneTextTopRight, {} )

				self.RoundsTextTopRight:completeAnimation()
				self.RoundsTextTopRight:setAlpha( 1 )
				HideClapboardRoundAnimationStage1( self.RoundsTextTopRight, {} )

				local ClapboardRoundAnimationStage4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local ClapboardRoundAnimationStage3 = function ( element, event )
					if event.interrupted then
						ClapboardRoundAnimationStage4( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setZRot( 0 )

						element:registerEventHandler( "transition_complete_keyframe", ClapboardRoundAnimationStage4 )
					end
				end

				local ClapboardRoundAnimationStage2 = function ( element, event )
					if event.interrupted then
						ClapboardRoundAnimationStage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setZRot( 45 )

						element:registerEventHandler( "transition_complete_keyframe", ClapboardRoundAnimationStage3 )
					end
				end

				local ClapboardRoundAnimationStage1 = function ( element, event )
					if event.interrupted then
						ClapboardRoundAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", ClapboardRoundAnimationStage2 )
					end
				end

				self.ClapboardArmMiddle:completeAnimation()
				self.ClapboardArmMiddle:setAlpha( 0 )
				self.ClapboardArmMiddle:setZRot( 0 )
				ClapboardRoundAnimationStage1( self.ClapboardArmMiddle, {} )

				local RoundAnimationStage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local RoundAnimationStage2 = function ( element, event )
					if event.interrupted then
						RoundAnimationStage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", RoundAnimationStage3 )
					end
				end

				local RoundAnimationStage1 = function ( element, event )
					if event.interrupted then
						RoundAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", RoundAnimationStage2 )
					end
				end

				self.ClapboardBaseMiddle:completeAnimation()
				self.ClapboardBaseMiddle:setAlpha( 0 )
				RoundAnimationStage1( self.ClapboardBaseMiddle, {} )

				self.ClapboardBaseMiddleText:completeAnimation()
				self.ClapboardBaseMiddleText:setAlpha( 0 )
				RoundAnimationStage1( self.ClapboardBaseMiddleText, {} )

				self.SceneTextMiddle:completeAnimation()
				self.SceneTextMiddle:setAlpha( 0 )
				RoundAnimationStage1( self.SceneTextMiddle, {} )

				self.RoundsTextMiddle:completeAnimation()
				self.RoundsTextMiddle:setAlpha( 0 )
				RoundAnimationStage1( self.RoundsTextMiddle, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				self.ClapboardTopRight:completeAnimation()
				self.ClapboardTopRight:setAlpha( 0 )
				self.clipFinished( self.ClapboardTopRight, {} )

				self.SceneTextTopRight:completeAnimation()
				self.SceneTextTopRight:setAlpha( 0 )
				self.clipFinished( self.SceneTextTopRight, {} )

				self.RoundsTextTopRight:completeAnimation()
				self.RoundsTextTopRight:setAlpha( 0 )
				self.clipFinished( self.RoundsTextTopRight, {} )

				self.ClapboardArmMiddle:completeAnimation()
				self.ClapboardArmMiddle:setAlpha( 0 )
				self.clipFinished( self.ClapboardArmMiddle, {} )

				self.ClapboardBaseMiddle:completeAnimation()
				self.ClapboardBaseMiddle:setAlpha( 0 )
				self.clipFinished( self.ClapboardBaseMiddle, {} )

				self.ClapboardBaseMiddleText:completeAnimation()
				self.ClapboardBaseMiddleText:setAlpha( 0 )
				self.clipFinished( self.ClapboardBaseMiddleText, {} )

				self.SceneTextMiddle:completeAnimation()
				self.SceneTextMiddle:setAlpha( 0 )
				self.clipFinished( self.SceneTextMiddle, {} )

				self.RoundsTextMiddle:completeAnimation()
				self.RoundsTextMiddle:setAlpha( 0 )
				self.clipFinished( self.RoundsTextMiddle, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

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

				self.ClapboardTopRight:completeAnimation()
				self.ClapboardTopRight:setAlpha( 0 )
				DefaultStateTransition( self.ClapboardTopRight, {} )

				self.SceneTextTopRight:completeAnimation()
				self.SceneTextTopRight:setAlpha( 0 )
				DefaultStateTransition( self.SceneTextTopRight, {} )

				self.RoundsTextTopRight:completeAnimation()
				self.RoundsTextTopRight:setAlpha( 0 )
				DefaultStateTransition( self.RoundsTextTopRight, {} )
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
		PlayClip( self, "RoundAnim", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ClapboardTopRight:close()
		element.SceneTextTopRight:close()
		element.RoundsTextTopRight:close()
		element.ClapboardArmMiddle:close()
		element.ClapboardBaseMiddle:close()
		element.ClapboardBaseMiddleText:close()
		element.SceneTextMiddle:close()
		element.RoundsTextMiddle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
