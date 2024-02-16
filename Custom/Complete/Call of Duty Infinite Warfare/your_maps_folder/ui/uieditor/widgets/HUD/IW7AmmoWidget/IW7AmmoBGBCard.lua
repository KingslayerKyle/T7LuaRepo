local BGBImageSubscription = function ( controller, element )
	local bgb_current = Engine.GetModel( Engine.GetModelForController( controller ), "bgb_current" )
	local bgb_display = Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" )

	if Engine.GetModelValue( bgb_current ) ~= nil then
		if Engine.GetModelValue( bgb_display ) ~= nil then
			if Engine.GetModelValue( bgb_display ) == 0 then
				element:setImage( RegisterImage( "blacktransparent" ) )
			else
				element:setImage( RegisterImage( GetItemImageFromIndex( Engine.GetModelValue( bgb_current ) ) ) )
			end
		end
	end
end

CoD.IW7AmmoBGBCard = InheritFrom( LUI.UIElement )
CoD.IW7AmmoBGBCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7AmmoBGBCard )
	self.id = "IW7AmmoBGBCard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.FireFX = LUI.UIImage.new()
	self.FireFX:setLeftRight( false, true, -175, -25 )
	self.FireFX:setTopBottom( false, true, -310, -170 )
	self.FireFX:setImage( RegisterImage( "zm_wc_fire_loop" ) )
	self.FireFX:setMaterial( LUI.UIImage.GetCachedMaterial( "zm_wc_fire_loop" ) )
	self.FireFX:setZRot( 3 )
	self:addElement( self.FireFX )

	self.CardImage = LUI.UIImage.new()
	self.CardImage:setLeftRight( false, true, -158, -37 )
	self.CardImage:setTopBottom( false, true, -170, 30 )
	self.CardImage:setImage( RegisterImage( "zm_wc_fate_card_base" ) )
	self.CardImage:setZRot( 3 )
	self:addElement( self.CardImage )

	self.BGBImage = LUI.UIImage.new()
	self.BGBImage:setLeftRight( false, true, -131, -66 )
	self.BGBImage:setTopBottom( false, true, -140, -75 )
	self.BGBImage:setImage( RegisterImage( "blacktransparent" ) )
	self.BGBImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	self.BGBImage:setShaderVector( 0, 0.5, 0, 0, 0 )
	self.BGBImage:setZRot( 3 )
	self.BGBImage:setScale( 1.3 )
	self.BGBImage:subscribeToGlobalModel( controller, "PerController", "bgb_current", function ( model )
		BGBImageSubscription( controller, self.BGBImage )
	end )
	self.BGBImage:subscribeToGlobalModel( controller, "PerController", "bgb_display", function ( model )
		BGBImageSubscription( controller, self.BGBImage )
	end )
	self:addElement( self.BGBImage )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			SlideOutAnim = function ()
				self:setupElementClipCounter( 3 )

				local FireFXOffAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
			
					element:setAlpha( 0 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local FireFXOffAnimationStage1 = function ( element, event )
					if event.interrupted then
						FireFXOffAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", FireFXOffAnimationStage2 )
					end
				end
			
				self.FireFX:completeAnimation()
				self.FireFX:setAlpha( 1 )
				FireFXOffAnimationStage1( self.FireFX, {} )

				local CardSlideOutAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end

					element:setLeftRight( false, true, -158, -37 )
					element:setTopBottom( false, true, -170, 30 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local CardSlideOutAnimationStage1 = function ( element, event )
					if event.interrupted then
						CardSlideOutAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setLeftRight( false, true, -158 - 5, -37 - 5 )
						element:setTopBottom( false, true, -170 - 60, 30 - 60 )

						element:registerEventHandler( "transition_complete_keyframe", CardSlideOutAnimationStage2 )
					end
				end

				self.CardImage:completeAnimation()
				self.CardImage:setAlpha( 1 )
				CardSlideOutAnimationStage1( self.CardImage, {} )

				local BGBSlideOutAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end

					element:setLeftRight( false, true, -131, -66 )
					element:setTopBottom( false, true, -140, -75 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local BGBSlideOutAnimationStage1 = function ( element, event )
					if event.interrupted then
						BGBSlideOutAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setLeftRight( false, true, -131 - 5, -66 - 5 )
						element:setTopBottom( false, true, -140 - 60, -75 - 60 )

						element:registerEventHandler( "transition_complete_keyframe", BGBSlideOutAnimationStage2 )
					end
				end

				self.BGBImage:completeAnimation()
				self.BGBImage:setAlpha( 1 )
				BGBSlideOutAnimationStage1( self.BGBImage, {} )
			end,
			SlideInAnim = function ()
				self:setupElementClipCounter( 3 )

				local FireFXOnAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
			
					element:setAlpha( 1 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local FireFXOnAnimationStage1 = function ( element, event )
					if event.interrupted then
						FireFXOnAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0 )

						element:registerEventHandler( "transition_complete_keyframe", FireFXOnAnimationStage2 )
					end
				end
			
				self.FireFX:completeAnimation()
				self.FireFX:setAlpha( 0 )
				FireFXOnAnimationStage1( self.FireFX, {} )

				local CardSlideInAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
			
					element:setLeftRight( false, true, -158 - 5, -37 - 5 )
					element:setTopBottom( false, true, -170 - 60, 30 - 60 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local CardSlideInAnimationStage1 = function ( element, event )
					if event.interrupted then
						CardSlideInAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
			
						element:setLeftRight( false, true, -158, -37 )
						element:setTopBottom( false, true, -170, 30 )

						element:registerEventHandler( "transition_complete_keyframe", CardSlideInAnimationStage2 )
					end
				end
			
				self.CardImage:completeAnimation()
				self.CardImage:setAlpha( 1 )
				CardSlideInAnimationStage1( self.CardImage, {} )
			
				local BGBSlideInAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
			
					element:setLeftRight( false, true, -131 - 5, -66 - 5 )
					element:setTopBottom( false, true, -140 - 60, -75 - 60 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				local BGBSlideInAnimationStage1 = function ( element, event )
					if event.interrupted then
						BGBSlideInAnimationStage2( element, event )
			
						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
			
						element:setLeftRight( false, true, -131, -66 )
						element:setTopBottom( false, true, -140, -75 )
			
						element:registerEventHandler( "transition_complete_keyframe", BGBSlideInAnimationStage2 )
					end
				end
			
				self.BGBImage:completeAnimation()
				self.BGBImage:setAlpha( 1 )
				BGBSlideInAnimationStage1( self.BGBImage, {} )
			end
		}
	}

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb_display"
		} )

		local bgb_display = Engine.GetModelValue( model )

		if bgb_display then
			if bgb_display == 0 then
				PlayClip( self, "SlideOutAnim", controller )
			else
				PlayClip( self, "SlideInAnim", controller )
			end
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FireFX:close()
		element.CardImage:close()
		element.BGBImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
