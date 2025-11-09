CoD.S2PerksListItem = InheritFrom( LUI.UIElement )
CoD.S2PerksListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2PerksListItem )
	self.id = "S2PerksListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 26 )
	self:setTopBottom( true, false, 0, 26 )
	
	self.GlowOblueOver = LUI.UIImage.new()
	self.GlowOblueOver:setLeftRight( true, false, -7.51 + 5, 43.51 - 5 )
	self.GlowOblueOver:setTopBottom( true, false, -36.85 + 5, 69.85 - 5 )
	self.GlowOblueOver:setRGB( 0, 0.61, 1 )
	self.GlowOblueOver:setZRot( 90 )
	self.GlowOblueOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self.GlowOblueOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( self.GlowOblueOver )
	
	self.GlowBlueOver0 = LUI.UIImage.new()
	self.GlowBlueOver0:setLeftRight( true, false, 11.49 + 5, 24.51 - 5 )
	self.GlowBlueOver0:setTopBottom( true, false, -36.85 + 5, 69.85 - 5 )
	self.GlowBlueOver0:setRGB( 0, 0.98, 1 )
	self.GlowBlueOver0:setAlpha( 0.62 )
	self.GlowBlueOver0:setZRot( 90 )
	self.GlowBlueOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self.GlowBlueOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( self.GlowBlueOver0 )
	
	self.PerkImage = LUI.UIImage.new()
	self.PerkImage:setLeftRight( true, false, 0, 36 - 10 )
	self.PerkImage:setTopBottom( false, true, -36 + 10, 0 )
	self.PerkImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )

		if image then
			self.PerkImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( self.PerkImage )
	
	self.GlowOrangeOver1 = LUI.UIImage.new()
	self.GlowOrangeOver1:setLeftRight( true, false, -7.51 + 5, 43.51 - 5 )
	self.GlowOrangeOver1:setTopBottom( true, false, -36.85 + 5, 69.85 - 5 )
	self.GlowOrangeOver1:setRGB( 1, 0.31, 0 )
	self.GlowOrangeOver1:setAlpha( 0.53 )
	self.GlowOrangeOver1:setZRot( 90 )
	self.GlowOrangeOver1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self.GlowOrangeOver1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( self.GlowOrangeOver1 )
	
	self.Lightning = LUI.UIImage.new()
	self.Lightning:setLeftRight( true, false, -57.5 + 5, 93.5 - 5 )
	self.Lightning:setTopBottom( true, false, -81 + 5, 63 - 5 )
	self.Lightning:setAlpha( 0 )
	self.Lightning:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	self.Lightning:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	self.Lightning:setShaderVector( 0, 28, 0, 0, 0 )
	self.Lightning:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( self.Lightning )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				self.clipFinished( self.GlowOblueOver, {} )

				self.GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.clipFinished( self.GlowBlueOver0, {} )

				self.PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 0 )
				self.clipFinished( self.PerkImage, {} )

				self.GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( self.GlowOrangeOver1, {} )

				self.Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( self.Lightning, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				self.clipFinished( self.GlowOblueOver, {} )

				self.GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.clipFinished( self.GlowBlueOver0, {} )

				self.PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 1 )
				self.clipFinished( self.PerkImage, {} )

				self.GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( self.GlowOrangeOver1, {} )

				self.Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( self.Lightning, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 5 )

				local GlowOblueOverIntroTransitionStage4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local GlowOblueOverIntroTransitionStage3 = function ( element, event )
					if event.interrupted then
						GlowOblueOverIntroTransitionStage4( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", GlowOblueOverIntroTransitionStage4 )
					end
				end

				local GlowOblueOverIntroTransitionStage2 = function ( element, event )
					if event.interrupted then
						GlowOblueOverIntroTransitionStage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.34 )

						element:registerEventHandler( "transition_complete_keyframe", GlowOblueOverIntroTransitionStage3 )
					end
				end

				local GlowOblueOverIntroTransitionStage1 = function ( element, event )
					if event.interrupted then
						GlowOblueOverIntroTransitionStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", GlowOblueOverIntroTransitionStage2 )
					end
				end
				
				self.GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				GlowOblueOverIntroTransitionStage1( self.GlowOblueOver, {} )

				local GlowBlueOver0IntroTransitionStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end

					element:setLeftRight( true, false, 11.49 + 5, 24.51 - 5 )
					element:setTopBottom( true, false, -36.85 + 5, 69.85 - 5 )
					element:setRGB( 1, 0.48, 0 )
					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local GlowBlueOver0IntroTransitionStage1 = function ( element, event )
					if event.interrupted then
						GlowBlueOver0IntroTransitionStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.54 )

						element:registerEventHandler( "transition_complete_keyframe", GlowBlueOver0IntroTransitionStage2 )
					end
				end
				
				self.GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setLeftRight( true, false, 11.49 + 5, 24.51 - 5 )
				self.GlowBlueOver0:setTopBottom( true, false, -36.85 + 5, 69.85 - 5 )
				self.GlowBlueOver0:setRGB( 1, 0.48, 0 )
				self.GlowBlueOver0:setAlpha( 0 )
				GlowBlueOver0IntroTransitionStage1( self.GlowBlueOver0, {} )

				local PerkImageTransitionStage1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.PerkImage:completeAnimation()
				self.PerkImage:setAlpha( 0 )
				PerkImageTransitionStage1( self.PerkImage, {} )

				local GlowOrangeOver1TransitionStage4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local GlowOrangeOver1TransitionStage3 = function ( element, event )
					if event.interrupted then
						GlowOrangeOver1TransitionStage4( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.22 )

						element:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver1TransitionStage4 )
					end
				end

				local GlowOrangeOver1TransitionStage2 = function ( element, event )
					if event.interrupted then
						GlowOrangeOver1TransitionStage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0 )

						element:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver1TransitionStage3 )
					end
				end

				local GlowOrangeOver1TransitionStage1 = function ( element, event )
					if event.interrupted then
						GlowOrangeOver1TransitionStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.24 )

						element:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver1TransitionStage2 )
					end
				end
				
				self.GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				GlowOrangeOver1TransitionStage1( self.GlowOrangeOver1, {} )

				local LightningTransitionStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local LightningTransitionStage1 = function ( element, event )
					if event.interrupted then
						LightningTransitionStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", LightningTransitionStage2 )
					end
				end
				
				self.Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				LightningTransitionStage1( self.Lightning, {} )
			end
		},
		Paused = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.GlowOblueOver:completeAnimation()
				self.GlowOblueOver:setAlpha( 0 )
				self.clipFinished( self.GlowOblueOver, {} )

				self.GlowBlueOver0:completeAnimation()
				self.GlowBlueOver0:setAlpha( 0 )
				self.clipFinished( self.GlowBlueOver0, {} )

				local PausedPerkImageAnimation = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.PerkImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				self.PerkImage:setAlpha( 0 )
				self.PerkImage:registerEventHandler( "transition_complete_keyframe", PausedPerkImageAnimation )

				self.GlowOrangeOver1:completeAnimation()
				self.GlowOrangeOver1:setAlpha( 0 )
				self.clipFinished( self.GlowOrangeOver1, {} )

				self.Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( self.Lightning, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", 1 )
			end
		},
		{
			stateName = "Paused",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "status", 2 )
			end
		}
	} )

	self:linkToElementModel( self, "status", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfModelValueTrue( element, controller, "newPerk" ) then
			PlayClip( self, "Intro", controller )
			SetSelfModelValue( self, element, controller, "newPerk", false )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GlowOblueOver:close()
		element.GlowBlueOver0:close()
		element.PerkImage:close()
		element.GlowOrangeOver1:close()
		element.Lightning:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
