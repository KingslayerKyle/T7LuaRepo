CoD.T4Round = InheritFrom( LUI.UIElement )
CoD.T4Round.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4Round )
	self.id = "T4Round"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.Chalks1 = LUI.UIImage.new()
	self.Chalks1:setLeftRight( true, false, -8, 87 )
	self.Chalks1:setTopBottom( false, true, -95, 0 )
	self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_1" ) )
	self.Chalks1:setRGB( 0.41, 0, 0 )
	self:addElement( self.Chalks1 )

	self.Chalks2 = LUI.UIImage.new()
	self.Chalks2:setLeftRight( true, false, 0 + 95 - 8, 95 + 95 - 8 )
	self.Chalks2:setTopBottom( false, true, -95, 0 )
	self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
	self.Chalks2:setRGB( 0.41, 0, 0 )
	self:addElement( self.Chalks2 )

	self.RoundText = LUI.UIText.new()
	self.RoundText:setLeftRight( true, true, -2.5, 0 )
	self.RoundText:setTopBottom( false, true, -92.5, 0 )
	self.RoundText:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.RoundText:setText( Engine.Localize( "" ) )
	self.RoundText:setRGB( 0.41, 0, 0 )
	self.RoundText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.RoundText:linkToElementModel( self, "roundsPlayed", true, function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			self.RoundText:setText( Engine.Localize( roundsPlayed - 1 ) )
		end
	end )
	self:addElement( self.RoundText )

	self.RoundMiddleTextShadow = LUI.UIText.new()
	self.RoundMiddleTextShadow:setLeftRight( true, true, 0 + 0.5, 0 + 0.5 )
	self.RoundMiddleTextShadow:setTopBottom( true, false, 263.5 + 0.5, 323.5 + 0.5 )
	self.RoundMiddleTextShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.RoundMiddleTextShadow:setText( Engine.Localize( "Round" ) )
	self.RoundMiddleTextShadow:setRGB( 0, 0, 0 )
	self:addElement( self.RoundMiddleTextShadow )

	self.RoundMiddleText = LUI.UIText.new()
	self.RoundMiddleText:setLeftRight( true, true, 0, 0 )
	self.RoundMiddleText:setTopBottom( true, false, 263.5, 323.5 )
	self.RoundMiddleText:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.RoundMiddleText:setText( Engine.Localize( "Round" ) )
	self.RoundMiddleText:setRGB( 0.41, 0, 0 )
	self:addElement( self.RoundMiddleText )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 0 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd1 = function ()
				self:setupElementClipCounter( 3 )
			
				local TextAnimationStage2 = function ( element, event )
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
			
				local TextAnimationStage1 = function ( element, event )
					if event.interrupted then
						TextAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", TextAnimationStage2 )
					end
				end
			
				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				TextAnimationStage1( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				TextAnimationStage1( self.RoundMiddleText, {} )
			
				local ChalkAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
			
					element:setLeftRight( true, false, -8, 87 )
					element:setTopBottom( false, true, -95, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local ChalkAnimationStage1 = function ( element, event )
					if event.interrupted then
						ChalkAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", ChalkAnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setLeftRight( true, false, 634, 718 )
				self.Chalks1:setTopBottom( true, false, 325, 419 )
				self.Chalks1:setAlpha( 0 )
				ChalkAnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd2 = function ()
				self:setupElementClipCounter( 1 )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_2" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_2" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd3 = function ()
				self:setupElementClipCounter( 1 )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_3" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_3" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd4 = function ()
				self:setupElementClipCounter( 1 )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_4" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_4" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd5 = function ()
				self:setupElementClipCounter( 1 )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd6 = function ()
				self:setupElementClipCounter( 2 )
			
				local Chalks2AnimationStage5 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks2AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage5 )
					end
				end
			
				local Chalks2AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_1" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage4 )
					end
				end

				local Chalks2AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage3 )
					end
				end

				local Chalks2AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage2 )
					end
				end
			
				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				Chalks2AnimationStage1( self.Chalks2, {} )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd6 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_1" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd7 = function ()
				self:setupElementClipCounter( 2 )
			
				local Chalks2AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks2AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage9 )
					end
				end
			
				local Chalks2AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_2" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage8 )
					end
				end
			
				local Chalks2AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage7 )
					end
				end
			
				local Chalks2AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage6 )
					end
				end
			
				local Chalks2AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage5 )
					end
				end
			
				local Chalks2AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage4 )
					end
				end
			
				local Chalks2AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage3 )
					end
				end
			
				local Chalks2AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage2 )
					end
				end
			
				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				Chalks2AnimationStage1( self.Chalks2, {} )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd7 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_2" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd8 = function ()
				self:setupElementClipCounter( 2 )
			
				local Chalks2AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks2AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage9 )
					end
				end
			
				local Chalks2AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_3" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage8 )
					end
				end
			
				local Chalks2AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage7 )
					end
				end
			
				local Chalks2AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage6 )
					end
				end
			
				local Chalks2AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage5 )
					end
				end
			
				local Chalks2AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage4 )
					end
				end
			
				local Chalks2AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage3 )
					end
				end
			
				local Chalks2AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage2 )
					end
				end
			
				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				Chalks2AnimationStage1( self.Chalks2, {} )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd8 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_3" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd9 = function ()
				self:setupElementClipCounter( 2 )
			
				local Chalks2AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks2AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage9 )
					end
				end
			
				local Chalks2AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_4" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage8 )
					end
				end
			
				local Chalks2AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage7 )
					end
				end
			
				local Chalks2AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage6 )
					end
				end
			
				local Chalks2AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage5 )
					end
				end
			
				local Chalks2AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage4 )
					end
				end
			
				local Chalks2AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage3 )
					end
				end
			
				local Chalks2AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage2 )
					end
				end
			
				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				Chalks2AnimationStage1( self.Chalks2, {} )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd9 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_4" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Rnd10 = function ()
				self:setupElementClipCounter( 2 )
			
				local Chalks2AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks2AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage9 )
					end
				end
			
				local Chalks2AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage8 )
					end
				end
			
				local Chalks2AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage7 )
					end
				end
			
				local Chalks2AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage6 )
					end
				end
			
				local Chalks2AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage5 )
					end
				end
			
				local Chalks2AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage4 )
					end
				end
			
				local Chalks2AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage3 )
					end
				end
			
				local Chalks2AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage2 )
					end
				end
			
				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				Chalks2AnimationStage1( self.Chalks2, {} )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Rnd10 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			Digits = function ()
				self:setupElementClipCounter( 3 )

				local RoundTextAnimationStage4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local RoundTextAnimationStage3 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage4 )
					end
				end

				local RoundTextAnimationStage2 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage3 )
					end
				end

				local RoundTextAnimationStage1 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage2 )
					end
				end
			
				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.RoundText:setRGB( 0.41, 0, 0 )
				RoundTextAnimationStage1( self.RoundText, {} )

				local Chalks2AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks2AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage9 )
					end
				end
			
				local Chalks2AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage8 )
					end
				end
			
				local Chalks2AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage7 )
					end
				end
			
				local Chalks2AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage6 )
					end
				end
			
				local Chalks2AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage5 )
					end
				end
			
				local Chalks2AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage4 )
					end
				end
			
				local Chalks2AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage3 )
					end
				end
			
				local Chalks2AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks2AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks2AnimationStage2 )
					end
				end
			
				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 1 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				Chalks2AnimationStage1( self.Chalks2, {} )
			
				local Chalks1AnimationStage9 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local Chalks1AnimationStage8 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage9( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage9 )
					end
				end
			
				local Chalks1AnimationStage7 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
			
						element:setImage( RegisterImage( "t4_chalkmarks_5" ) )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage8 )
					end
				end
			
				local Chalks1AnimationStage6 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage7 )
					end
				end
			
				local Chalks1AnimationStage5 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage6 )
					end
				end
			
				local Chalks1AnimationStage4 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage5 )
					end
				end
			
				local Chalks1AnimationStage3 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage4 )
					end
				end
			
				local Chalks1AnimationStage2 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage3 )
					end
				end
			
				local Chalks1AnimationStage1 = function ( element, event )
					if event.interrupted then
						Chalks1AnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", Chalks1AnimationStage2 )
					end
				end
			
				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 1 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				Chalks1AnimationStage1( self.Chalks1, {} )
			end
		},
		Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.Chalks1:completeAnimation()
				self.Chalks1:setAlpha( 0 )
				self.Chalks1:setRGB( 0.41, 0, 0 )
				self.Chalks1:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks1, {} )

				self.Chalks2:completeAnimation()
				self.Chalks2:setAlpha( 0 )
				self.Chalks2:setRGB( 0.41, 0, 0 )
				self.Chalks2:setImage( RegisterImage( "t4_chalkmarks_5" ) )
				self.clipFinished( self.Chalks2, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 1 )
				self.clipFinished( self.RoundText, {} )

				self.RoundMiddleTextShadow:completeAnimation()
				self.RoundMiddleTextShadow:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleTextShadow, {} )

				self.RoundMiddleText:completeAnimation()
				self.RoundMiddleText:setAlpha( 0 )
				self.clipFinished( self.RoundMiddleText, {} )
			end,
			DigitsUpdate = function ()
				self:setupElementClipCounter( 1 )

				local RoundTextAnimationStage8 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
			
					element:setRGB( 0.41, 0, 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local RoundTextAnimationStage7 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage8( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage8 )
					end
				end
			
				local RoundTextAnimationStage6 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage7( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage7 )
					end
				end
			
				local RoundTextAnimationStage5 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage6( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage6 )
					end
				end
			
				local RoundTextAnimationStage4 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage5( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage5 )
					end
				end
			
				local RoundTextAnimationStage3 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage4( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage4 )
					end
				end
			
				local RoundTextAnimationStage2 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage3( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setAlpha( 0 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage3 )
					end
				end
			
				local RoundTextAnimationStage1 = function ( element, event )
					if event.interrupted then
						RoundTextAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
			
						element:setRGB( 1, 1, 1 )
			
						element:registerEventHandler( "transition_complete_keyframe", RoundTextAnimationStage2 )
					end
				end
			
				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 1 )
				self.RoundText:setRGB( 0.41, 0, 0 )
				RoundTextAnimationStage1( self.RoundText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Rnd1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 1 )
			end
		},
		{
			stateName = "Rnd2",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 2 )
			end
		},
		{
			stateName = "Rnd3",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 3 )
			end
		},
		{
			stateName = "Rnd4",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 4 )
			end
		},
		{
			stateName = "Rnd5",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 5 )
			end
		},
		{
			stateName = "Rnd6",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 6 )
			end
		},
		{
			stateName = "Rnd7",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 7 )
			end
		},
		{
			stateName = "Rnd8",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 8 )
			end
		},
		{
			stateName = "Rnd9",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 9 )
			end
		},
		{
			stateName = "Rnd10",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 10 )
			end
		},
		{
			stateName = "Digits",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 11 )
			end
		}
	} )
	self:linkToElementModel( self, "roundsPlayed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "roundsPlayed"
		} )

		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			local currentRound = roundsPlayed - 1

			if currentRound > 11 then
				PlayClip( self, "DigitsUpdate", controller )
			end
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Chalks1:close()
		element.Chalks2:close()
		element.RoundText:close()
		element.RoundMiddleTextShadow:close()
		element.RoundMiddleText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
